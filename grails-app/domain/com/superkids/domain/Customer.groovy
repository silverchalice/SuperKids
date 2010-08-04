package com.superkids.domain

class Customer {

//	District Address
	String district
    Address address
    Address deliveryAddress

	String website

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
    String primaryFoodServiceDistributor

    

	static hasMany = [
		orders: Order,
		calls: Call,
        brokerReps : BrokerRepresentative,    
		]

    static constraints = {
    }
}
