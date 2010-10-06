package com.superkids.domain

import com.metasieve.shoppingcart.IShoppable

class Product implements IShoppable {

	String name
	String description
	String details
	String nutrition
	String servings
	com.metasieve.shoppingcart.ShoppingItem shoppingItem

     String summaryName
     String summaryType



	Boolean isLive = true
	Boolean bake = false

	byte[] image
	byte[] summary

	static belongsTo = [ sponsor : Sponsor ]

        static hasMany = [ assessments : Assessment, statesAvailable : String ]

        static constraints = {
		name()
		description()
		details()
		nutrition()
		image()
		summary()
                summaryName(nullable:true)
                summaryType(nullable:true)
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
