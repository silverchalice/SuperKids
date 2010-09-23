
package com.superkids

import com.superkids.domain.PageText
import com.superkids.domain.Customer
import com.superkids.domain.Broker
import com.superkids.domain.Address
import com.superkids.domain.User
import com.superkids.domain.UserRole
import com.superkids.domain.Role
import com.superkids.domain.Assessment

class HomeController {

    def springSecurityService

    def index = {
        if(springSecurityService.isLoggedIn()){
            def pass = springSecurityService.encodePassword("superkids")
            def loggedInUser = User.get(springSecurityService.principal.id)
            def ur = Role.findByAuthority("ROLE_USER")
            if(loggedInUser.password == pass && UserRole.findByUserAndRole(loggedInUser, ur)){
                flash.message = "Please enter a new password."
                log.info flash.message
                redirect action:"c_change_password"
            } else {
                println springSecurityService.principal?.username
                println "Users in system: "
                def user = User.get(springSecurityService.principal.id)
                def adminRole = Role.findByAuthority("ROLE_ADMIN")
                def callerRole = Role.findByAuthority("ROLE_CALLER")
                Customer.list().each { 
                    println it.username + " (" + it.id + ")"
                }
                if(UserRole.findByUserAndRole(user, callerRole)){
                     redirect controller:"call", action:"index"
                } else if (UserRole.findByUserAndRole(user, adminRole)){
                     redirect controller:"customer", action:"list"
                } else {
                    render(view:"landing")
                }
            }
        } else {
            render view:'home'
        }
    }

	def ultragrain = {
		render view:'ultragrain'
	}

	def sustagrain = {
		render view:'sustagrain'
	}

       def register = {
            def customerInstance = new Customer()
            customerInstance.address = new Address()
            customerInstance.deliveryAddress = new Address()

            def states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
			  'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
			  'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
			  'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
			  'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
			  'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
			  'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
			  'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
			  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
			  'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']

            customerInstance.properties = params
            
            return [customerInstance: customerInstance, states:states]
       }

       def save = {
         params.username = params.email
         def states=['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']
         def customerInstance = new Customer(params)
           customerInstance.password = springSecurityService.encodePassword("superkids")
           customerInstance.enabled = true
           customerInstance.accountExpired = false
           customerInstance.accountLocked = false
           customerInstance.passwordExpired = false
           def userRole = Role.findByAuthority("ROLE_USER")
           if(customerInstance.save()){
               UserRole.create customerInstance, userRole, true
               if(params.brokerName){
                   def broker = new Broker(name:params.brokerName, phone:params.brokerPhone, fax:params.brokerFax, email:params.brokerEmail, street:params.brokerStreet, street2:params.brokerStreet2, city:params.brokerCity, state:params.brokerState, zip:params.brokerZip, customer:customerInstance)
                   broker.save(failOnError:true)
                   println broker.name
                   customerInstance.addToBrokers(broker)
                   customerInstance.save()
               }
               flash.message = "Your account was created."
               log.info flash.message
               redirect(action:"register_n")
           } else {
               flash.message = "There were errors with your information."
               log.info flash.message
               customerInstance.errors.allErrors.each {
                   println it
                   println " "
               }
               render(view:"register", model:[customerInstance:customerInstance, states:states])
           }
       }

       def register_n = {
           
       }

       def edit_profile = {         
           if(springSecurityService.isLoggedIn()){
               def user = Customer.get(springSecurityService.principal.id)
               println "this user is of " + user.class + ", and its username is " + user.username
               println "here's a list of the Customers: "
               Customer.list().each { println it }
               println "and here's a list of the Users: "
               User.list().each{ println it }
               println "and here is a list of the UserRoles: "
               UserRole.list().each{ println it }
               def userRole = Role.findByAuthority("ROLE_USER")
               if (UserRole.findByUserAndRole(user, userRole)){
                   return [customerInstance: user]
               } else {
                   redirect(action: "index")
               }
           } else {
               redirect(action:"index")
           }
       }

       def update = {
           def customerInstance = Customer.get(params.id)
           if (customerInstance) {
               if (params.version) {
                   def version = params.version.toLong()
                   if (customerInstance.version > version) {
                       customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'customer.label', default: 'Customer')] as Object[], "Another user has updated this Customer while you were editing")
                       render(view: "edit_profile", model: [customerInstance: customerInstance])
                       return
                   }
               }
               customerInstance.properties = params
               if(params.password){ customerInstance.password = springSecurityService.encodePassword(params.password) }
               if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {
               flash.message = "${message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])}"
                log.info flash.message
                   redirect(action: "index")
               } else {
                   render(view: "edit_profile", model: [customerInstance: customerInstance])
               }
           } else {
               flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
                log.info flash.message
               redirect(action: "index")
           }
       }

       def brokerFromEdit = {
           def customerInstance = Customer.get(springSecurityService.principal.id)
           if(params.brokerName){
               def broker = new Broker(name:params.brokerName, phone:params.brokerPhone, fax:params.brokerFax, email:params.brokerEmail, street:params.brokerStreet, street2:params.brokerStreet2, city:params.brokerCity, state:params.brokerState, zip:params.brokerZip, customer:customerInstance)
               broker.save(failOnError:true)
               println broker.name
               customerInstance.addToBrokers(broker)
               customerInstance.save()
            }
            redirect action:"edit_profile"
       }

       def enter_site = {
         def controller
         def action
         if(params.job){
             switch(params.job) {
                 case "B":
                     controller = "home"
                     action = "broker"
                     break
                 case "C":
                     controller = "home"
                     action = "anonymous"
                     break
                 case "D":
                     controller = "home"
                     action = "anonymous"
                     break
                 case "E":
                     controller = "home"
                     action = "anonymous"
                     break
                 }
                 redirect controller:controller, action:action
            } else {
                 flash.message = "Uh... those were Olaf's."
                log.info flash.message
                 redirect controller:"home", action:"index"
            }
       }

       def broker = {
           def content
           def pt = PageText.findByName("broker")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def broker_products = {

       }

       def broker_whole_grain_benefits = {

       }

       def broker_whole_grain_studies = {

       }

       def incorporating_whole_grains_in_schools = {

       }

       def broker_participate = {

       }

       def broker_ecard = {

       }

       def anonymous = {

       }


       def learn = {
           def content
           def pt = PageText.findByName("learn")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def order = {
           def content
           def pt = PageText.findByName("order")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def assess = {
           def products = []
           if(springSecurityService.isLoggedIn()){
               def user = User.get(springSecurityService.principal.id)
               def userRole = Role.findByAuthority("ROLE_USER")
               if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                   def customer = Customer.get(springSecurityService.principal.id)
                   customer.order.products.each{
                       if(!Assessment.findByCustomerAndProduct(customer, it)){
                           products << it
                       }
                   }
               }
           }
           def content
           def pt = PageText.findByName("assess")
           if(pt){
               content = pt.content
           }
           [content:content, products:products]
       }

       def promote = {
           def content
           def pt = PageText.findByName("promote")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def assessment_drawing_rules = {
           def content
           def pt = PageText.findByName("assessment_drawing_rules")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def assessment_tools = {
           def content
           def pt = PageText.findByName("assessment_tools")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def ecards = {
           def content
           def pt = PageText.findByName("ecards")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def promotion_tools_and_resources = {
           def content
           def pt = PageText.findByName("promotion_tools_and_resources")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def additional_promotional_ideas = {
           def content
           def pt = PageText.findByName("additional_promotional_ideas")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def what_is = {
           def content
           def pt = PageText.findByName("what_is")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def about = {
           def content
           def pt = PageText.findByName("about")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def superkids_products = {
           def content
           def pt = PageText.findByName("superkids_products")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def testimonials = {
           def content
           def pt = PageText.findByName("testimonials")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def whole_grain_list = {
           def content
           def pt = PageText.findByName("whole_grain_list")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def whole_grain_benefits = {
           def content
           def pt = PageText.findByName("whole_grain_benefits")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def whole_grain_studies = {
           def content
           def pt = PageText.findByName("whole_grain_studies")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def childhood_obesity = {
           def content
           def pt = PageText.findByName("childhood_obesity")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def council_tips = {
           def content
           def pt = PageText.findByName("council_tips")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def change_password = {
           def userInstance = User.get(springSecurityService.principal.id)
           [userInstance:userInstance]
       }

       def admin_password = {
           def userInstance = User.get(springSecurityService.principal.id)
           if(params.password == params.confirmpassword){
               userInstance.password = springSecurityService.encodePassword(params.password)
               userInstance.save()
               flash.message = "Your password has been updated."
                log.info flash.message
               redirect uri:"/admin"
           } else {
               flash.message = "New passwords do not match."
                log.info flash.message
               userInstance.password = params.password
               render view:"change_password", model:[userInstance:userInstance]
           }
       }

       def c_change_password = {
           def customerInstance = Customer.get(springSecurityService.principal.id)
           [customerInstance:customerInstance]
       }

       def c_password = {
           println "here is the password we got: " + params.password
           def customerInstance = Customer.get(springSecurityService.principal.id)
           if(params.password == "superkids"){
               flash.message = "Please enter a new password. Your password cannot be \"superkids\"."
                log.info flash.message
               redirect action:"c_change_password"
           } else {
               if(params.password == params.confirmpassword){
                   customerInstance.password = springSecurityService.encodePassword(params.password)
                   customerInstance.save()
                   flash.message = "Your password has been updated."
                log.info flash.message
                   println "!!! redirecting"
                   redirect action:"index"
               } else {
                   flash.message = "New passwords do not match."
                log.info flash.message
                   customerInstance.password = params.password
                   render view:"c_change_password", model:[customerInstance:customerInstance]
               }
           }
       }

       def profile_help = {

       }

}
