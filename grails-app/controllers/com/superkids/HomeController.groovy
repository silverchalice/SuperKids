
package com.superkids

import cr.co.arquetipos.password.PasswordTools
import com.superkids.domain.*

class HomeController {

    def springSecurityService
    def mailService

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

    def superkids_products_gen = {

        [productInstanceList: Product.list(params), productInstanceTotal: Product.count()]

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

            return [customerInstance: customerInstance, states:states, sponsors: Sponsor.findAllByInactive(false).sort {it.name}]
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
         Customer customerInstance = new Customer()
         customerInstance.properties = params

           Sponsor.list().each { sponsor ->
                println "checking for sponsor $sponsor"
                if(params["sponsor.${sponsor.id}"]) {
                    customerInstance.addToContactManufacturers(sponsor)
                } else if(customerInstance.contactManufacturers.contains(sponsor)) {
                   customerInstance.removeFromContactManufacturers(sponsor)
                }
           }


         println "saved new customer: " + customerInstance
         if(checkParams(params)){
           customerInstance.password = springSecurityService.encodePassword("superkids")
           customerInstance.enabled = true
           customerInstance.accountExpired = false
           customerInstance.accountLocked = false
           customerInstance.passwordExpired = false
           def userRole = Role.findByAuthority("ROLE_USER")
           if(!customerInstance.hasErrors() && customerInstance.save()){
               UserRole.create customerInstance, userRole, true
               if(params.brokerName){
                   def broker = new Broker(name:params.brokerName, phone:params.brokerPhone, fax:params.brokerFax, email:params.brokerEmail, street:params.brokerStreet, street2:params.brokerStreet2, city:params.brokerCity, state:params.brokerState, zip:params.brokerZip, customer:customerInstance)
                   println broker.name
                   customerInstance.addToBrokers(broker)
                   customerInstance.save()
               }
               flash.message = "Your account was created."
               log.info flash.message
               redirect(action:"register_n")
           } else {
               flash.message = "There were errors with your information."
               println "errors saving customer " + customerInstance + ":"
               customerInstance.errors.allErrors.each {
                   println it
                   println " "
               }
               render(view:"register", model:[customerInstance:customerInstance, states:states, sponsors: Sponsor.findAllByInactive(false).sort {it.name}])
           }
           } else {
               render(view:"register", model:[customerInstance:customerInstance, states:states, sponsors: Sponsor.findAllByInactive(false).sort {it.name}])
           }
       }

       def register_n = {
           
       }

       def edit_profile = {      
            def broker
            if(params.brokerId){
                broker = Broker.get(params.brokerId)
            }
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
               def userRole = Role.findByAuthority("ROLE_USER")
               if (UserRole.findByUserAndRole(user, userRole)){
                   return [customerInstance: user, states:states, broker:broker]
               } else {
                   redirect(action: "index")
               }
           } else {
               redirect(action:"index")
           }
       }

       def update = {
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
           def customerInstance = Customer.get(params.id)
           if (customerInstance) {
               if (params.version) {
                   def version = params.version.toLong()
                   if (customerInstance.version > version) {
                       customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'customer.label', default: 'Customer')] as Object[], "Another user has updated this profile while you were editing.")
                       render(view: "edit_profile", model: [customerInstance: customerInstance])
                       return
                   }
               }
               if(checkParams(params)){
                   customerInstance.properties = params
                   if(params.email){
                       def u = User.get(params.id)
                       u.username = params.email
                       u.save(failOnError:true)
                   }
                   if(params.password){ customerInstance.password = springSecurityService.encodePassword(params.password) }
                   if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {
                   flash.message = "Your customer profile has been updated"
                    log.info flash.message
                       redirect(action: "index")
                   } else {
                       render(view: "edit_profile", model: [customerInstance: customerInstance])
                   }
               } else {
                   render(view:"edit_profile", model:[customerInstance:customerInstance, states:states])
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
           def controller = params.rController
           def action = params.rAction
           if(params.name){
               def broker = new Broker(params)
               println "in addBroker, saved new broker: " + broker.name
               customerInstance.addToBrokers(broker)
               customerInstance.save(failOnError:true)
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
                 flash.message = "Please select an option from the list."
                log.info flash.message
                 redirect controller:"login", action:"auth"
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
		   def content = PageText.findByName("superkids_products").content
           render view:"/home/broker_products", model:[ content: content]
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
           def content
           def pt = PageText.findByName("anonymous")
           if(pt){
               content = pt.content
           }
           [content:content]
       }



       def public_products = {
           def content = PageText.findByName("superkids_products").content
           render view:"/home/public_products", model:[content: content]
       }

       def public_diets = {
           def content
           def pt = PageText.findByName("public_diets")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def public_diets_students = {
           def content
           def pt = PageText.findByName("public_diets_students")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def public_other_products = {
           def content
           def pt = PageText.findByName("public_other_products")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def public_whole_grain_in_schools = {
           def content
           def pt = PageText.findByName("incorporating_whole_grains_in_schools")
           if(pt){
               content = pt.content
           }
           [content:content]   
       }

       def public_whole_grain_studies = {
           def content
           def pt = PageText.findByName("whole_grain_studies")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def public_whole_grain_benefits = {
           def content
           def pt = PageText.findByName("whole_grain_benefits")
           if(pt){
               content = pt.content
           }
           [content:content]
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

           def products = []

           def customer = Customer.get(springSecurityService.principal.id)
           Product.list().each {product ->
               if((product.liveProduct) && (product.statesAvailable.find{ customer?.deliveryAddress?.state }) && (!product.parent)) {
                   products << product
               }
           }
           [content:content, products: products]
       }

       def assess = {
           def products = []
           if(springSecurityService.isLoggedIn()){
               def user = User.get(springSecurityService.principal.id)
               def userRole = Role.findByAuthority("ROLE_USER")
               if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                   def customer = Customer.get(springSecurityService.principal.id)
                   customer.order.products.each{
                       def product = Product.get(it?.product?.id)
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

		   println "in ecard_send for HomeController"
		   println "principle" + springSecurityService.principal
		   println "principle.id" + springSecurityService.principal.id

		   def customer = Customer.get(springSecurityService.principal.id)

		   [customer: customer]
       }	

	def ecards_thanks = {

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

       def ultragrain_general = {
           def content
           def pt = PageText.findByName("ultragrain_general")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def sustagrain_general = {
           def content
           def pt = PageText.findByName("sustagrain")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def about_manufacturers = {
           def content
           def pt = PageText.findByName("about_manufacturers")
           if(pt){
               content = pt.content
           }
           [content:content]
       }

       def where_to_find = {
           def content
           def pt = PageText.findByName("where_to_find")
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

       def chef_jeff = {
           def content
           def pt = PageText.findByName("chef_jeff")
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

        def healthy_hunger_free = {
            def content
            def pt = PageText.findByName("healthy_hunger_free")
            if(pt){
                content = pt.content
            }
            [content:content]
        }

        def my_plate = {
            def content
            def pt = PageText.findByName("my_plate")
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
           if(params.password){
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
           } else {
               flash.message = "Please enter a new password."
               render view:"change_password", model:[adminInstance:adminInstance]
           }
       }

       def a_change_c_password = {
           def customerInstance = Customer.get(params.id)
           [customerInstance:customerInstance]
       }

       def a_c_password = {
           def customerInstance = Customer.get(params.id)
           if(params.password){
               if(params.password == params.confirmpassword){
                   customerInstance.password = springSecurityService.encodePassword(params.password)
                   customerInstance.save()
                   flash.message = "Password for user ${customerInstance.district} updated."
                    log.info flash.message
                   redirect controller:"customer", action:"list"
               } else {
                   flash.message = "New passwords do not match."
                   log.info flash.message
                   render view:"a_change_c_password", model:[customerInstance:customerInstance]
               }
           } else {
               flash.message = "Please enter a new password."
               render view:"a_change_c_password", model:[customerInstance:customerInstance]
           }
       }

       def c_change_password = {
           def customerInstance = Customer.get(springSecurityService.principal.id)
           [customerInstance:customerInstance]
       }

       def c_password = {
           def customerInstance = Customer.get(springSecurityService.principal.id)
           println "changing password for customer " + customerInstance + " (c_password action of HomeController). here is the password we got: " + params.password
           if(params.password == "superkids"){
               flash.message = "Please enter a new password. Your new password cannot be \"superkids\"."
               println "new password for customer " + customerInstance + " was 'superkids' (c_password)"
               redirect action:"c_change_password"
           } else {
               if(params.password == params.confirmpassword){
                   customerInstance.password = springSecurityService.encodePassword(params.password)
                   customerInstance.usingResetPassword = false
                   customerInstance.save(failOnError:true)
                   flash.message = "Your password has been updated."
                   println "updated password for customer " + customerInstance + " (c_password)"
                   redirect action:"index"
               } else {
                   flash.message = "New passwords do not match."
                   println "new passwords for customer " + customerInstance + " did not match (c_password)"
                   customerInstance.password = params.password
                   render view:"c_change_password", model:[customerInstance:customerInstance]
               }
           }
       }

       def c_2_change_password = {
           def customerInstance = Customer.get(springSecurityService.principal.id)
           [customerInstance:customerInstance]
       }

       def c_2_password = {
           def customerInstance = Customer.get(springSecurityService.principal.id)
           println "changing password for customer " + customerInstance + " (c_2_password action of HomeController). here is the password we got: " + params.password
           def oldpassword = springSecurityService.encodePassword(params.oldpassword)
           if(params.password == "superkids"){
               flash.message = "Please enter a new password. Your new password cannot be \"superkids\"."
                println "new password for customer " + customerInstance + " was 'superkids' (c_2_password)"
               redirect action:"c_2_change_password"
           } else {
               if(oldpassword == customerInstance.password){
                   if(params.password){
                       if(params.password == params.confirmpassword){
                           customerInstance.password = springSecurityService.encodePassword(params.password)
                           customerInstance.usingResetPassword = false
                           customerInstance.save(failOnError:true)
                           flash.message = "Your password has been updated."
                           println "updated password for customer " + customerInstance + " (c_2_password)"
                           redirect action:"index"
                       } else {
                           flash.message = "New passwords do not match."
                           println "new passwords for customer " + customerInstance + " did not match (c_2_password)"
                           render view:"c_2_change_password", model:[customerInstance:customerInstance]
                       }
                   } else {
                       println "there was no new password... (c_2_password)"
                       flash.message = "Please enter a new password."
                       log.info flash.message
                       render view:"c_2_change_password", model:[customerInstance:customerInstance]
                   }
               } else {
                   flash.message = "Current password is not correct."
                   log.info flash.message
                   render view:"c_2_change_password", model:[customerInstance:customerInstance]
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

       def c_forgot_password = {
       }

       def c_passwd_reset = {
           def customerInstance = Customer.findByUsername(params.username)
           if(customerInstance){
               def passwd = PasswordTools.generateRandomPassword()
               customerInstance.password = springSecurityService.encodePassword(passwd)
               customerInstance.usingResetPassword = true
               customerInstance.save(failOnError:true)
               sendMail {
                   to customerInstance?.email
                   subject "[SuperKids] Your password has been reset"
                   body """
Your password has been reset to the following:

${passwd}

Log in to your SuperKids account with this password. You will be required to change your password once you have logged in.

--
SuperKids Whole Grain Sampling Program
http://www.superkidssampling.com/
"""
               }
               redirect action:"c_reset_success"
           } else {
               flash.message = "The username you entered could not be found."
               redirect action:"c_forgot_password"
           }
       }

       def c_reset_success = {
       }

       def forgot_password = {
       }

       def passwd_reset = {
           def adminInstance = Admin.findByUsername(params.username)
           Admin.list().each{ println it.username }
           if(adminInstance){
               def passwd = PasswordTools.generateRandomPassword()
               adminInstance.password = springSecurityService.encodePassword(passwd)
               adminInstance.save(failOnError:true)
               sendMail {
                   to adminInstance?.email
                   subject "[SuperKids] Your password has been reset"
                   body """${adminInstance.firstName},

Your password for the account "${adminInstance.username}" has been reset to the following:

${passwd}

You can log in to your SuperKids administrator account with this password. Please change your password once you have logged in.

--
SuperKids Whole Grain Sampling Program
http://www.superkidssampling.com/
"""
               }
               flash.message = "A new password has been created and emailed to ${adminInstance.email}."
               redirect controller:"login", action:"admin_login"
           } else {
               flash.message = "The username you entered could not be found."
               redirect action:"forgot_password"
           }
       }

       def checkParams(params){
           if(!params.fsdName || !params.email || !params.district || !params.address.city || !params.address.zip || !params.address.street || !params.breakfastsServed || !params.lunchesServed || !params.snacksServed || Customer.findByEmail(params.email) && !springSecurityService.isLoggedIn()){
               if(!params.fsdName){
                   if(flash.message){
                       flash.message += "Please enter your name <br />"
                   } else {
                       flash.message = "Please enter your name <br />"
                   }
               }
               if(!params.email){
                   if(flash.message){
                       flash.message += "Please enter your email address <br />"
                   } else {
                       flash.message = "Please enter your email address <br />"
                   }
               }
               if(!params.district){
                   if(flash.message){
                       flash.message += "Please enter your school district name <br />"
                   } else {
                       flash.message = "Please enter your school district name <br />"
                   }
               }
               if(!params.address?.city){
                   if(flash.message){
                       flash.message += "Please enter the city of your school district <br />"
                   } else {
                       flash.message = "Please enter the city of your school district <br />"
                   }
               }
               if(!params.address?.zip){
                   if(flash.message){
                       flash.message += "Please enter the zip of your school district <br />"
                   } else {
                       flash.message = "Please enter the zip of your school district <br />"
                   }
               }
               if(!params.address?.street){
                   if(flash.message){
                       flash.message += "Please enter the address of your school district <br />"
                   } else {
                       flash.message = "Please enter the address of your school district <br />"
                   }
               }
               if(!params.breakfastsServed){
                   if(flash.message){
                       flash.message += "Please enter the number of students that you serve breakfast to <br />"
                   } else {
                       flash.message = "Please enter the number of students that you serve breakfast to <br />"
                   }
               }
               if(!params.lunchesServed){
                   if(flash.message){
                       flash.message += "Please enter the number of students that you serve lunch to <br />"
                   } else {
                       flash.message = "Please enter the number of students that you serve lunch to <br />"
                   }
               }
               if(!params.snacksServed){
                   if(flash.message){
                       flash.message += "Please enter the number of students that you serve a snack to <br />"
                   } else {
                       flash.message = "Please enter the number of students that you serve a snack to <br />"
                   }
               }
               if(Customer.findByEmail(params.email) && !springSecurityService.isLoggedIn()){
                   if(flash.message){
                       flash.message += "The email address you have entered is already assigned to an account <br />"
                   } else {
                       flash.message = "The email address you have entered is already assigned to an account <br />"
                   }
               }
               return false
           } else {
               return true
           }
       }

       def demo = {
	       redirect controller:"login", action:"demo"
       }

}
