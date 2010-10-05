package com.superkids.domain

import com.metasieve.shoppingcart.IShoppable

class Product implements IShoppable {

	String name
	String description
	String details
	String nutrition
        String servings
        String summary
        com.metasieve.shoppingcart.ShoppingItem shoppingItem

        boolean isLive = true
        boolean bake = false

	byte[] image

	static belongsTo = [ sponsor : Sponsor ]

        static hasMany = [ assessments : Assessment, statesAvailable : String ]

        static constraints = {
		name()
		description()
		details()
		nutrition()
		image()
		summary()
                servings(nullable:true)
		sponsor(nullable:true)
        }

        static mapping = {
            image sqlType:"longblob"
            summary sqlType:"longblob"
            description sqlType:"text"
            nutrition sqlType:"text"
        }
  
        String toString(){ name }
}
