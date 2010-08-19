package com.superkids.domain

class Product extends com.metasieve.shoppingcart.Shoppable {

	String name
	String description
	String details
	String nutrition

	byte[] image
	byte[] summary

	static belongsTo = [sponsor: Sponsor]


    static constraints = {
		name()
		description()
		details()
		nutrition()
		image()
		summary()
		sponsor(nullable:true)
    }
}
