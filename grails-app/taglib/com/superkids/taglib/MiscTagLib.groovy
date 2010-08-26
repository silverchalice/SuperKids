package com.superkids.taglib

import com.superkids.domain.Customer
import com.superkids.domain.Product
import com.metasieve.shoppingcart.Quantity

class MiscTagLib {

    def springSecurityService
    def shoppingCartService

    static namespace = 'sks'

    def hasPlacedCurrentOrder = { attrs, body ->
        def customer = Customer.get(springSecurityService.principal.id)
        if(customer?.hasPlacedCurrentOrder){
            out << body()
        } else { out << "" }
    }

    def hasNotPlacedCurrentOrder = { attrs, body ->
        def customer = Customer.get(springSecurityService.principal.id)
        if(!customer?.hasPlacedCurrentOrder){
            out << body()
        } else { out << "" }
    }

    def productList = { attrs -> 
        def customer = Customer.get(springSecurityService.principal.id)
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
            if(!customer.hasPlacedCurrentOrder) {
                out << "<td>"
                if(!product.isInCart){
                    println "add link"
                    out << g.remoteLink(controller: 'product', action: 'add', update:'shoppingCartContent', params: [id: product.id, cartPage:true]) { 'Add' }
                }
                out << "</td>"
            }
            out << "</tr>"
        }
    }

}
