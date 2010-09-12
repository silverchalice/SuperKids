package com.superkids.domain

class ShoppingController {

    def index = { 
        
    }

    def confirm = { 
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
               render view:"confirm"
           } else {
               render(view: "checkout", model: [customerInstance: customerInstance])
           }
       } else {
           flash.message = "Couldn't find that customer record."
           redirect(controller:"home", action: "index")
       }
    }

}
