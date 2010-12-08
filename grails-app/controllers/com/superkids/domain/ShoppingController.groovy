package com.superkids.domain

import com.superkids.domain.ShippingDate
import com.superkids.domain.Product
import com.superkids.domain.CustomerStatus

class ShoppingController {

    def springSecurityService
    def shoppingCartService

    def index = { 
        
    }

    def confirm = {
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
           if(checkParams(params)){
               customerInstance.properties = params
               if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {
                   def cartItems = shoppingCartService.getItems()
                   def products = []
                   cartItems?.each { item ->
                       def prod = Product.findByShoppingItem(item)
                       if(prod){
                           def product = new Expando(toString: {-> prod.name}, id:prod.id, quantity:prod.servings)
                           products << product
                       }
                   }
                   flash.message = "Your customer details have been updated."
                   render view:"confirm", model: [customerInstance:customerInstance, shippingDates:ShippingDate.list(), products:products]
               } else {
                   render(view: "check_out", model: [customerInstance: customerInstance])
               }
           } else {
               render(view:"check_out", model:[customerInstance:customerInstance, states:states])
           }
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
        customer.order = order
        customer.save(failOnError:true)
        println "customer " + customer.fsdName + " placed order through site"
        session.checkedOutItems = shoppingCartService.checkOut()
        redirect action:"thanks"
    }

    def thanks = {

    }

       def checkParams(params){
           if(!params.fsdName || !params.email || !params.district || !params.address.city || !params.address.zip || !params.address.street || !params.breakfastsServed || !params.lunchesServed || !params.snacksServed){
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
               if(!params.address.city){
                   if(flash.message){
                       flash.message += "Please enter the city of your school district <br />"
                   } else {
                       flash.message = "Please enter the city of your school district <br />"
                   }
               }
               if(!params.address.zip){
                   if(flash.message){
                       flash.message += "Please enter the zip of your school district <br />"
                   } else {
                       flash.message = "Please enter the zip of your school district <br />"
                   }
               }
               if(!params.address.street){
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
               return false
           } else {
               return true
           }
       }


}
