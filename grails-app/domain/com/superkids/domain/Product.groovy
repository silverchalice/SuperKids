package com.superkids.domain

class Product {

	String name
	Byte brochure
	Byte picture
	Byte nutritionalInfoSheet

	static belongsTo = [sponsor: Sponsor]




    static constraints = {
    }
}
