package com.superkids.domain
import com.superkids.domain.Customer
import com.superkids.domain.Product
import com.superkids.domain.OrderType
import com.superkids.domain.ShippingDate


class CustomerOrder {
    Customer customer
    Date dateCreated
    ShippingDate shippingDate
    OrderType orderType

    static hasMany = [products:Product]
    static belongsTo = Customer

    static constraints = {   
        shippingDate nullable:true
    }
}
