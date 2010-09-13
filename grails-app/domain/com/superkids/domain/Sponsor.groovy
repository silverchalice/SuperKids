package com.superkids.domain

class Sponsor {

	String name
	Address address
	String phone
	String website

	String salesContact
	String sampleContact

	byte[] logo

	static hasMany = [products: Product]

    static constraints = {

		name()
		address()
		phone()
		website()
		logo(nullable:true, blank:true)

		salesContact(nullable: true)
		sampleContact(nullable: true)

		products(nullable:true)
    }

	String toString() {
		name
	}
}
