package com.superkids.taglib

import com.superkids.domain.Customer
import com.superkids.domain.Product
import com.metasieve.shoppingcart.Quantity

class MiscTagLib {

    def springSecurityService
    def shoppingCartService

    static namespace = 'sks'

    def hasPlacedCurrentOrder = { attrs, body ->
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            if(customer?.hasPlacedCurrentOrder){
                out << body()
            } else { out << "" }
        }
    }

    def hasNotPlacedCurrentOrder = { attrs, body ->
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            if(!customer?.hasPlacedCurrentOrder){
                out << body()
            } else { out << "" }
        }
    }

    def productList = { attrs -> 
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            def shoppingCart = shoppingCartService.getShoppingCart()
            def products = Product.list().collect { product ->
                def isContained = false
                def quantity = Quantity.findByShoppingCartAndShoppingItem(shoppingCart, product.shoppingItem)
                if(quantity){
                    isContained = true
                }
                new Expando(toString: {-> product.name}, id: product.id, isInCart: isContained)
            }
            for(product in products) {
                println product.isInCart
                out << "<tr>"
                out << "<td>"    
                out << product
                out << "</td>"
                out << "<td>"
                if(!customer.hasPlacedCurrentOrder) {
                    if(!product.isInCart){
                        println "add link"
                        out << g.remoteLink(controller: 'product', action: 'add', update:'shoppingCartContent', params: [id: product.id, cartPage:true]) { 'Add' }
                    }
                }
                out << "</td>"
                out << "</tr>"
            }
        }
    }

    def orderList = { attrs -> 
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            out << "<br />"
            out << "<h2>Your order</h2>"
            out << "<br />"
            out << "<table>"
            out << "<thead>"
            out << "<tr>"   
            out << g.sortableColumn(property:'item',title:'Product',width:'87%')    
            out << "<th> </th>"
            out << "</tr>"
            out << "</thead>"
            out << "<tbody>"
            for(product in customer.order.products) {
                out << "<tr>"
                out << "<td>"    
                out << product
                out << "</td>"
                out << "<td>"
                out << "</td>"
                out << "</tr>"
            }
            out << "<tr>"
            out << "<td>"
            out << "</td>"
            out << "<td>"
            out << "</td>"
            out << "</tr>"
            out << "</tbody>"
            out << "</table>"
        }
    }

}
