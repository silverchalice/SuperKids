package com.superkids.domain

class Sponsor {

	String name
	String address
	String phone
	String website
    String description
    String details

	String salesContact
	String sampleContact

    Boolean inactive

	byte[] logo

	String logoSnippet

	static hasMany = [products: Product]

    static constraints = {

		name()
		address()
		phone()
		website()
		logo nullable:true, blank:true
        inactive nullable: true
		salesContact nullable: true
		sampleContact nullable: true

        description nullable:true, maxSize: 500000
        details nullable:true, maxSize: 500000

		products nullable:true
		logoSnippet nullable:true
    }

    static mapping = {
        logo sqlType:"longblob"
        description sqlType:"longtext"
        details sqlType:"longtext"
		logoSnippet sqlType:"longtext"
    }

	String toString() {
		name
	}
}
