package com.superkids.domain

class Address {

	String street
	String city
	String state
	Integer zip

	static belongsTo = [customer: Customer, sponsor: Sponsor]

    static constraints = {
		street()
		city()
		state(maxSize:2)
		zip()
		customer(nullable:true)
		sponsor(nullable:true)
    }

	String toString() {
		"${street}, ${city}, ${state} ${zip}"
	}
}
