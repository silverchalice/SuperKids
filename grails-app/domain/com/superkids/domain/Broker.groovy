package com.superkids.domain

class Broker {

	String name
	String phone
	String fax
	String email

	Address address

	static hasMany = [customers: Customer]

    static constraints = {
    }
}
