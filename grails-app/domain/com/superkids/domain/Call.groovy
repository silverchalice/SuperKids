package com.superkids.domain

class Call {

	String result

	static belongsTo = [customer: Customer, caller: Caller]

	static mapping = {
		table 'PHONE_CALL'
	}

    static constraints = {
    }
}
