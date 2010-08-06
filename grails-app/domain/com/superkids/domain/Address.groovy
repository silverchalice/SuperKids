package com.superkids.domain

class Address {

	String street1
	String street2
	String city
	String state
	Integer zip

	static belongsTo = [customer: Customer]

    static constraints = {
		street1()
		street2(nullable: true)
		city()
		state()
		zip()
    }

	String toString() {
		"${street1}, ${city}, ${state} ${zip}"
	}
}
