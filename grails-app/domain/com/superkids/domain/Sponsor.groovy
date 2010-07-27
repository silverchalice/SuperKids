package com.superkids.domain

class Sponsor {

	String name
	String website
	String logo

	static hasMany = [products: Product]

    static constraints = {
    }
}
