
package com.superkids

import com.superkids.domain.*

class HomeController {

    def springSecurityService

    def index = {
        if(springSecurityService.isLoggedIn()){
            println springSecurityService.principal?.username
            def user = User.get(springSecurityService.principal.id)
            def adminRole = Role.findByAuthority("ROLE_ADMIN")
            def callerRole = Role.findByAuthority("ROLE_CALLER")
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
           def content
           def pt = PageText.findByName("ultragrain")
           if(pt){
               content = pt.content
           }
           [content:content]
	}

	def sustagrain = {
           def content
           def pt = PageText.findByName("sustagrain")
           if(pt){
               content = pt.content
           }
           [content:content]
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
         def states=['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
			  'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
			  'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
			  'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
			  'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
			  'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
			  'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
			  'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
			  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
			  'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
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
                   return [customerInstance: user, states:states]
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

       def addBroker = {
           def customerInstance
           def id = params.rId
           if(params.customerId){
               customerInstance = Customer.get(params.customerId)
           } else {
               customerInstance = Customer.get(springSecurityService.principal.id)

           }
           println customerInstance
           def controller = params.rController
           def action = params.rAction
           println "controller: " + controller + " action: " + action
           if(params.name){
               def broker = new Broker(params)
               println broker.name
               customerInstance.addToBrokers(broker)
               customerInstance.save()
            }
            redirect controller:controller, action:action, id:id
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
		   def content
           def pt = PageText.findByName("broker_products")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def broker_whole_grain_benefits = {
		   def content
           def pt = PageText.findByName("whole_grain_benefits")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def broker_whole_grain_studies = {
		   def content
           def pt = PageText.findByName("whole_grain_studies")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def incorporating_whole_grains_in_schools = {
		   def content
           def pt = PageText.findByName("incorporating_whole_grains_in_schools")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def broker_participate = {
		   def content
           def pt = PageText.findByName("broker_participate")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def broker_ecard = {
		   def content
           def pt = PageText.findByName("broker_ecard")
           if(pt){
               content = pt.content
           }
           [content:content]
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
                       def product = Product.get(it.product.id)
                       if(!Assessment.findByCustomerAndProduct(customer, product)){
                           products << product
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

       def minnesota_form = {
           def content
           def pt = PageText.findByName("minnesota_form")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def assessment_form = {
           def content
           def pt = PageText.findByName("assessment_form")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def student_form = {
           def content
           def pt = PageText.findByName("student_form")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

		def student_certificate = {
           def content
           def pt = PageText.findByName("student_certificate")
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

	   def ecards_send = {
		   def customer = Customer.get(springSecurityService.principal.id)

		   [customer: customer]
       }	

	def ecards_thanks = {
		   def customer = Customer.get(springSecurityService.principal.id)

		   render view:'ecards_send', model: [customer: customer]
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

	def what_are_whole_grains = {
           def content
           def pt = PageText.findByName("what_are_whole_grains")
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
           def adminInstance
           if(params.id){ 
               adminInstance = Admin.get(params.id)
           } else {
               adminInstance = Admin.get(springSecurityService.principal.id)
           }
           [adminInstance:adminInstance]
       }

       def admin_password = {
           def adminInstance
           if(params.id){ 
               adminInstance = Admin.get(params.id)
           } else {
               adminInstance = Admin.get(springSecurityService.principal.id)
           }
           if(params.password == params.confirmpassword){
               adminInstance.password = springSecurityService.encodePassword(params.password)
               adminInstance.save()
               flash.message = "Password updated."
                log.info flash.message
               redirect controller:"customer", action:"list"
           } else {
               flash.message = "New passwords do not match."
                log.info flash.message
               adminInstance.password = params.password
               render view:"change_password", model:[adminInstance:adminInstance]
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
               flash.message = "Please enter a new password. Your new password cannot be \"superkids\"."
                log.info flash.message
               redirect action:"c_change_password"
           } else {
               if(params.password == params.confirmpassword){
                   customerInstance.password = springSecurityService.encodePassword(params.password)
                   customerInstance.save(failOnError:true)
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

       def assignRoles = {
           if(springSecurityService.isLoggedIn()){
               if(User.get(springSecurityService.principal.id).isAdmin()){
                   def userRole = Role.findByAuthority("ROLE_USER") 
                   Customer.list().each{ customer ->
                       UserRole.create customer, userRole, true
                   }
               }
           }
           redirect controller:"home", action:"index"
       }

       def profile_help = {

       }

}
