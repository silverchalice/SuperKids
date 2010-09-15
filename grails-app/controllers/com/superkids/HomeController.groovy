
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
            customerInstance.broker = new Broker()

            customerInstance.properties = params

            def states=['AL': 'Alabama', 'AK': 'Alaska', 'AZ': 'Arizona', 'AR': 'Arkansas', 'CA': 'California', 'CO': 'Colorado', 'CT': 'Connecticut', 'DE': 'Delaware', 'DC': 'District Of Columbia', 'FL': 'Florida', 'GA': 'Georgia', 'HI': 'Hawaii', 'ID': 'Idaho', 'IL': 'Illinois', 'IN': 'Indiana', 'IA': 'Iowa', 'KS': 'Kansas', 'KY': 'Kentucky', 'LA': 'Louisiana', 'ME': 'Maine', 'MD': 'Maryland', 'MA': 'Massachusetts', 'MI': 'Michigan', 'MN': 'Minnesota', 'MS': 'Mississippi', 'MO': 'Missouri', 'MT': 'Montana', 'NE': 'Nebraska', 'NV': 'Nevada', 'NH': 'New Hampshire', 'NJ': 'New Jersey', 'NM': 'New Mexico', 'NY': 'New York', 'NC': 'North Carolina', 'ND': 'North Dakota', 'OH': 'Ohio', 'OK': 'Oklahoma', 'OR': 'Oregon', 'PA': 'Pennsylvania', 'RI': 'Rhode Island', 'SC': 'South Carolina', 'SD': 'South Dakota', 'TN': 'Tennessee', 'TX': 'Texas', 'UT': 'Utah', 'VT': 'Vermont', 'VA': 'Virginia', 'WA': 'Washington', 'WV': 'West Virginia', 'WI': 'Wisconsin', 'WY': 'Wyoming']
            
            return [customerInstance: customerInstance, states:states.collect{it.key}]
       }

       def save = {
         println "GRR! here are the params: " + params
         def states=['AL': 'Alabama', 'AK': 'Alaska', 'AZ': 'Arizona', 'AR': 'Arkansas', 'CA': 'California', 'CO': 'Colorado', 'CT': 'Connecticut', 'DE': 'Delaware', 'DC': 'District Of Columbia', 'FL': 'Florida', 'GA': 'Georgia', 'HI': 'Hawaii', 'ID': 'Idaho', 'IL': 'Illinois', 'IN': 'Indiana', 'IA': 'Iowa', 'KS': 'Kansas', 'KY': 'Kentucky', 'LA': 'Louisiana', 'ME': 'Maine', 'MD': 'Maryland', 'MA': 'Massachusetts', 'MI': 'Michigan', 'MN': 'Minnesota', 'MS': 'Mississippi', 'MO': 'Missouri', 'MT': 'Montana', 'NE': 'Nebraska', 'NV': 'Nevada', 'NH': 'New Hampshire', 'NJ': 'New Jersey', 'NM': 'New Mexico', 'NY': 'New York', 'NC': 'North Carolina', 'ND': 'North Dakota', 'OH': 'Ohio', 'OK': 'Oklahoma', 'OR': 'Oregon', 'PA': 'Pennsylvania', 'RI': 'Rhode Island', 'SC': 'South Carolina', 'SD': 'South Dakota', 'TN': 'Tennessee', 'TX': 'Texas', 'UT': 'Utah', 'VT': 'Vermont', 'VA': 'Virginia', 'WA': 'Washington', 'WV': 'West Virginia', 'WI': 'Wisconsin', 'WY': 'Wyoming']
         def customerInstance = new Customer(params)
         if(params.password == params.confirmpassword){
           customerInstance.username = params.email
           customerInstance.password = springSecurityService.encodePassword(params.password)
           customerInstance.enabled = true
           customerInstance.accountExpired = false
           customerInstance.accountLocked = false
           customerInstance.passwordExpired = false
           def userRole = Role.findByAuthority("ROLE_USER")
           if(customerInstance.save()){
               UserRole.create customerInstance, userRole, true
               println "we just saved a user. (pause for deafening applause.) this user's username is " + customerInstance.username + "; its email address is " + customerInstance.email + "; its password is " + params.password + "."
               flash.message = "Your account was created."
               redirect(action:"index")
           } else {
               flash.message = "I was just flying along, and I blew up."
               customerInstance.errors.allErrors.each {
                   println it
                   println " "
               }
               customerInstance.password = params.password
               render(view:"register", model:[customerInstance:customerInstance, states:states.collect{it.key}])
           }
         } else {
             flash.message = "Passwords do not match."
             customerInstance.password = params.password
             render(view:"register", model:[customerInstance:customerInstance]) 
         }
       }

       def edit_profile = {         
           if(springSecurityService.isLoggedIn()){
               def user = Customer.findByUsername(springSecurityService.principal.username)
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
               if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {
               flash.message = "${message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])}"
                   redirect(action: "index")
               } else {
                   render(view: "edit_profile", model: [customerInstance: customerInstance])
               }
           } else {
               flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
               redirect(action: "index")
           }
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

}
