package com.superkids.domain

class Order {

	Boolean earlyShipping

	static hasMany = [
		products:Product,
		assessments:Assessment,
		]

	static belongsTo = [customer: Customer]

    static constraints = {
    }
}
