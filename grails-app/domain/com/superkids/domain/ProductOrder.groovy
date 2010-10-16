package com.superkids.domain

class ProductOrder {

    Product product
    Boolean received = true

    static belongsTo = [order: CustomerOrder]

    static constraints = {
        product nullable:true
        order nullable:true
    }

    String toString() { "productOrder " + id + " with product " + product  + " and received " + received }

}
