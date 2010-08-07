package com.superkids.domain

class Address {

	String street1
	String street2
	String city
	String state
	Integer zip

	static belongsTo = [customer: Customer, sponsor: Sponsor]

    static constraints = {
		street1()
		street2(nullable: true)
		city()
		state()
		zip()
		customer(nullable:true)
		sponsor(nullable:true)
    }

	String toString() {
		"${street1}, ${city}, ${state} ${zip}"
	}
}
