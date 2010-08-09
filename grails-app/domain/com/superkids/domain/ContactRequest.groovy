package com.superkids.domain

class ContactRequest {

	String firstName
	String lastName
	String email
	String phone
	String districtName

	Address address
	String message

    static constraints = {
		firstName()
		lastName()
		email(email: true)
		phone(nullable: true)
		districtName(nullable: true)
		address(nullable: true)
		message(nullable: true)

    }
}
