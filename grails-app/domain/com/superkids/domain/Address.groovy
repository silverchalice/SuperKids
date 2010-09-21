package com.superkids.domain

class Address {

	String street
    String street2
	String city
	String state
	String zip

	static belongsTo = [customer: Customer, sponsor: Sponsor]

    static constraints = {
		street(nullable:true)
        street2(nullable:true)
		city(nullable:true)
		state(maxSize:2)
		zip(nullable:true)
		customer(nullable:true)
		sponsor(nullable:true)
    }


    String toString(){
      "$street${street2 ?: ' '}$city, $state $zip"
    }          

}
