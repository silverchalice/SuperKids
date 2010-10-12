package com.superkids.domain
import com.superkids.domain.Customer
import com.superkids.domain.ProductOrder
import com.superkids.domain.OrderType
import com.superkids.domain.ShippingDate


class CustomerOrder {
    Customer customer
    Date dateCreated
    ShippingDate shippingDate
    OrderType orderType

    static hasMany = [products:ProductOrder]
    static belongsTo = Customer

    static constraints = {   
        shippingDate nullable:false
    }
}
