package com.superkids.domain

import com.superkids.callerModule.*

class Call {

	CallResult result

	static belongsTo = [customer: Customer, caller: Caller]

	static mapping = {
		table 'PHONE_CALL'
	}

    static constraints = {
    }
}
