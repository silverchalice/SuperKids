package com.superkids.domain

class ContactRequest {

	String firstName
	String lastName
	String email
	String phone
	String districtName
        Date dateCreated
        String street
        String street2
        String city
        String state
        String zip

	String message

    static constraints = {
		firstName()
		lastName()
		email(email: true)
		phone(nullable: true)
		districtName(nullable: true)
		message(nullable: false)    
                street(nullable:true)
                street2(nullable:true) 
                city(nullable:true)
                state(nullable:true)
                zip(nullable:true)
    }
}
