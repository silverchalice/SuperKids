package com.superkids.domain

class Broker {

	String name
	String phone
	String fax
	String email

	Address address

	static belongsTo = [customer: Customer]

    static constraints = {
    }
}
