
package com.superkids

import com.superkids.domain.Customer
import com.superkids.domain.Broker
import com.superkids.domain.Address
import com.superkids.domain.User
import com.superkids.domain.UserRole
import com.superkids.domain.Role

class HomeController {

    def springSecurityService

    def index = {
        if(springSecurityService.isLoggedIn()){
            println springSecurityService.principal?.username
            println "Users in system: "
            Customer.list().each { println it.username }
            render(view:"landing")
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
            
            return [customerInstance: customerInstance]
       }

       def save = {
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
               render(view:"register", model:[customerInstance:customerInstance])
           }
         } else {
             flash.message = "Passwords do not match."
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
         println "entering enter_site action of home controller. params are " + params
         def controller
         def action
         if(params.job){
             switch(params.job) {
                 case "B":
                     controller = "home"
                     action = "register"
                     break
                 case "C":
                     controller = "home"
                     action = "foo"
                     break
                 case "D":
                     controller = "foo"
                     action = "bar"
                     break
                 case "E":
                     controller = "foo"
                     action = "bar"
                     break
                 }
                 redirect controller:controller, action:action
            } else {
                 flash.message = "Uh... those were Olaf's."
                 redirect controller:"home", action:"index"
            }
       }

       def foo = {}

}
