package com.superkids.domain

class Sponsor {

	String name
    Address address
	String website
	byte[] logo
    String salesContact
    String sampleContact

	static hasMany = [products: Product]

    static constraints = {
    }
}
