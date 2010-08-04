package com.superkids.domain

class Product {

	String name
	Byte brochure
	Byte imageAd
    String description
	String nutrition
    String details

	static belongsTo = [sponsor: Sponsor]
    static hasMany = [assessments: Assessment]


    static constraints = {
    }
}
