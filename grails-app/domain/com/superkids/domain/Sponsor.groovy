package com.superkids.domain

class Sponsor {

	String name
	Address address
	String phone
	String website

	String salesContact
	String sampleContact

	static hasMany = [products: Product]

    static constraints = {

		name()
		address()
		phone()
		website()

		salesContact(nullable: true)
		sampleContact(nullable: true)

		products(nullable:true)
    }

	String toString() {
		name
	}
}
