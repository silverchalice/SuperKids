package com.superkids.domain

class ShoppingController {

    def springSecurityService
    def shoppingCartService
    def userService

    static def states = ['AL','AK','AZ','AR',' CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME',
            'MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA',
            'RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY']

    def index = {
        if(springSecurityService.isLoggedIn()) {
            def customer = Customer.get(springSecurityService.principal.id)
            if (customer.hasPlacedCurrentOrder) {
                redirect(controller: 'assessment', action: 'start')
                return
            } else {
                render view: 'index'
            }

        }  else {
            redirect(controller: 'login')
        }
        
    }

    def confirm = {

       if(springSecurityService.isLoggedIn()){
       def customerInstance = Customer.get(params.id)
       if (customerInstance) {
           if (params.version) {
               def version = params.version.toLong()
               if (customerInstance.version > version) {
                   customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'customer.label', default: 'Customer')] as Object[], "Another user has updated this Customer while you were editing")
                   render(view: "check_out", model: [customerInstance: customerInstance,  sponsors: Sponsor.findAllByInactive(false).sort {it.name}])
                   return
               }
           }
           if(checkParams(params)){
               customerInstance.properties = userService.bindParams(params)
               if(customerInstance.coOpName) customerInstance.coOpMember = true

               if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {

                   flash.message = "Your customer details have been updated."
                   redirect action: "confirm_order", params: [id:customerInstance?.id]
               } else {
                   render(view: "check_out", model: [customerInstance: customerInstance, states: states, sponsors: Sponsor.findAllByInactive(false).sort {it.name}])
               }
           } else {
               render(view:"check_out", model:[customerInstance:customerInstance, states:states, sponsors: Sponsor.findAllByInactive(false).sort {it.name}])
           }
         }
       } else {
           flash.message = "Couldn't find that customer record."
           redirect(controller:"home", action: "index")
       }
    }

    def confirm_order = {

        def customerInstance = User.get(params.id)
        if (customerInstance) {
            def products = shoppingCartService.getItems()
            [customerInstance:customerInstance, shippingDates: ShippingDate.findAllByActive(true), products:products]
        }

    }


    def place_order = {
        def shippingDate = ShippingDate.get(params.shippingDate)
        def customer = Customer.get(springSecurityService.principal.id)
        customer?.hasPlacedCurrentOrder = true
        customer.status = CustomerStatus.HAS_ORDERED
        def order = new CustomerOrder(customer:customer, shippingDate:shippingDate, orderType:OrderType.WEB)
        shoppingCartService.getItems().each{
            def product = Product.findByShoppingItem(it)
            def productOrder = new ProductOrder(product:product, order:order, received:true)
            order.addToProducts(productOrder)

			if(Product.findAllByParent(product)) {
				def subProducts = Product.findAllByParent(product)

				subProducts.each { sp ->
					def po =  new ProductOrder(product:sp, order:order, received:true)
					order.addToProducts(po)
				}
			}

            order.save()
        }
        customer.customerOrder = order
        customer.save(failOnError:true)
        println "customer " + customer.fsdName + " placed order through site"
        session.checkedOutItems = shoppingCartService.checkOut()
        redirect action:"thanks"
    }

    def thanks = {
        def content
        def pt = PageText.findByName("thanks")
        if(pt){
            content = pt.content
        }
        [content:content]
    }

       def checkParams(params){
           if(!params.fsdName || !params.email || !params.district || !params.address.city || !params.address.zip || !params.address.street){
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
               return false
           } else {
               return true
           }
       }


}
