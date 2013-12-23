package com.superkids.domain

class ProductOrder {

    Product product
    Boolean received = true
    Boolean sampled = true

    static belongsTo = [order: CustomerOrder]

    static constraints = {
        product nullable:true
        order nullable:true
    }

    String toString() { "productOrder " + id + " with product " + product  + " and received " + received }

    def afterInsert() {
      println "Yo here we saved a $product with received $received and sampled $sampled"
    }

}
