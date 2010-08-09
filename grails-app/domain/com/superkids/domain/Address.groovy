package com.superkids.domain

class Address {

	String street
	String city
	String state
	Integer zip

	static belongsTo = [customer: Customer, sponsor: Sponsor]

    static constraints = {
		street1()
		city()
		state()
		zip()
		customer(nullable:true)
		sponsor(nullable:true)
    }

	String toString() {
		"${street}, ${city}, ${state} ${zip}"
	}
}
