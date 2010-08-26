package com.superkids.domain
import com.superkids.domain.Customer
import com.superkids.domain.Product
import com.superkids.domain.OrderType


class CustomerOrder {
    Customer customer
    Date dateCreated
    OrderType orderType

    static hasMany = [products:Product]
    static belongsTo = Customer

    static constraints = {   
    }
}
