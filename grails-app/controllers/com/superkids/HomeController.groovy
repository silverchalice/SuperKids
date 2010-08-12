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
                println springSecurityService.principal?.username
		render view:'home'
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
               render(view:"register", customerInstance:customerInstance)
           }
       }

}
