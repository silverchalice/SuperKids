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


}
