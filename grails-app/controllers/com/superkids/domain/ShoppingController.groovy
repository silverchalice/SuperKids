package com.superkids.domain

import com.superkids.domain.ShippingDate

class ShoppingController {

    def springSecurityService
    def shoppingCartService

    def index = { 
        
    }

    def confirm = { 
       println "the params are " + params
       def customerInstance = Customer.get(params.id)
       if (customerInstance) {
           if (params.version) {
               def version = params.version.toLong()
               if (customerInstance.version > version) {
                   customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'customer.label', default: 'Customer')] as Object[], "Another user has updated this Customer while you were editing")
                   render(view: "check_out", model: [customerInstance: customerInstance])
                   return
               }
           }
           customerInstance.properties = params
           if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {
               flash.message = "w00t! we updated the Customer!"
               render view:"confirm", model: [customerInstance:customerInstance, shippingDates:ShippingDate.list()]
           } else {
               render(view: "check_out", model: [customerInstance: customerInstance])
           }
       } else {
           flash.message = "Couldn't find that customer record."
           redirect(controller:"home", action: "index")
       }
    }

    def place_order = {
        def shippingDate = ShippingDate.get(params.shippingDate)
        def customer = Customer.get(springSecurityService.principal.id)
        customer?.hasPlacedCurrentOrder = true
        def order = new CustomerOrder(customer:customer, shippingDate:shippingDate, orderType:OrderType.WEB)
        shoppingCartService.getItems().each{
            def product = Product.get(it.id)
            order.addToProducts(product)
        }
        customer.order = order
        customer.save()
        session.checkedOutItems = shoppingCartService.checkOut()
        redirect action:"thanks"
    }

    def thanks = {

    }

}
