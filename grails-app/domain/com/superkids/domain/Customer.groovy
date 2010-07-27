package com.superkids.domain

class Customer {

//	District Address
	String district
	String address1
	String address2
	String city
	String state
	Integer zip
	Integer phone
	Integer fax

	String website


//	Opt. Delivery Address
	String deliveryAddress1
	String deliveryAddress2
	String deliveryCity
	String deliveryState
	String deliveryZip

//	Food Service Director
	String fsdName
	String fsdTitle
	String fsdEmail

//	Chief Dietitian
	String cdName
	String cdTitle
	String cdEmail

//	Nutritional Director
	String ndName
	String ndTitle
	String ndEmail

//	Optional Stats
	Integer studentsInDistrict
	Integer facilities
	Integer breakfastsServed
	Integer lunchesServed
	Integer snacksServed

	Boolean doesPrepareBreadFromScratch
	Boolean doesPrepareBreadFromMix
	Boolean doesPurchasePreparedFood
	Boolean doesPurchaseFrozenFood
	Boolean doesPurchaseBakedFood

	static hasMany = [
		orders: Order,
		calls: Call,
		]

    static constraints = {
    }
}
