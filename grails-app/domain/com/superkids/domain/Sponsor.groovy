package com.superkids.domain

class Sponsor {

	String name
	String address
	String phone
	String website
        String description

	String salesContact
	String sampleContact

	byte[] logo

	static hasMany = [products: Product]

    static constraints = {

		name()
		address()
		phone()
		website()
		logo nullable:true, blank:true

		salesContact nullable: true
		sampleContact nullable: true

                description nullable:true, maxSize: 500000

		products nullable:true
    }

    static mapping = {
        logo sqlType:"longblob"
        description sqlType:"longtext"
    }

	String toString() {
		name
	}
}
