package com.superkids.domain

class Call {

	CallResult result

	Date callbackDate
	String callbackTime
	Date dateCreated = new Date()

	String notes
	
	static belongsTo = [customer: Customer, caller: Caller]

	static mapping = {
		table 'PHONE_CALL'
	}

    static constraints = {
		result()
		customer()
		caller()
		callbackDate(nullable:true)
		callbackTime(nullable:true)
    }

}
