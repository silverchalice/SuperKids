package com.superkids.domain

import com.metasieve.shoppingcart.IShoppable
import com.metasieve.shoppingcart.ShoppingItem

class Product implements IShoppable {

	String name
	String description
	String details
	String nutrition
	String servings
	com.metasieve.shoppingcart.ShoppingItem shoppingItem

    String summaryName
    String summaryType

	Boolean liveProduct = true
	Boolean bake = false
	Boolean frozen = false

	Product parent


	String backgroundImage        // file path
	byte[] image
	byte[] hoverImage
	byte[] summary

	static belongsTo = [ sponsor : Sponsor ]

	static hasMany = [ assessments : Assessment, statesAvailable : String ]

	static constraints = {
	name()
	description(maxSize:500000)
	details(maxSize:500000)
	nutrition(maxSize:500000)
	image()
	hoverImage()
	backgroundImage nullable: true
	summary()
	summaryName(nullable:true)
	summaryType(nullable:true)
	servings(nullable:true)
	sponsor(nullable:true)
	assessments(nullable:true)
        parent nullable:true
        shoppingItem nullable:true
	}

	static mapping = {
		backgroundImage sqlType:"longblob"
		image sqlType:"longblob"
		hoverImage sqlType:"longblob"
		summary sqlType:"longblob"
		description sqlType:"text"
		nutrition sqlType:"text"
	}

	String toString(){ name }

        def beforeInsert = {
            def si = new ShoppingItem().save()
            shoppingItem = si
        }

}
