package com.superkids.domain

import com.metasieve.shoppingcart.IShoppable

class Product implements IShoppable {

	String name
	String description
	String details
	String nutrition
        com.metasieve.shoppingcart.ShoppingItem shoppingItem

	byte[] image
	byte[] summary

	static belongsTo = [ sponsor : Sponsor ]

        static hasMany = [ assessments : Assessment ]

    static constraints = {
		name()
		description()
		details()
		nutrition()
		image()
		summary()
		sponsor(nullable:true)
    }

    String toString(){ name }
}
