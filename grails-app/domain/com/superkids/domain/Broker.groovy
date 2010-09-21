package com.superkids.domain

class Broker {

	String name
	String phone
	String fax
	String email

	String street
        String street2
	String city
	String state
	Integer zip

	static belongsTo = [customer: Customer]

    static constraints = {
                phone(nullable:true)
                fax(nullable:true)
                email(nullable:true)
		street(nullable: true)
                street2(nullable:true)
		city(nullable: true)
		state(nullable: true)
		zip(nullable: true)
		customer(nullable: true)
    }
}

