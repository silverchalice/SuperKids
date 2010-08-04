package com.superkids.domain
                                                 
class Order {

	Date shippingDate
    Date orderedDate = new Date()


	static hasMany = [
		products:Product,
		]

	static belongsTo = [customer: Customer]

    static constraints = {
    }
}
