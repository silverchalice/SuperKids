package com.superkids.domain

class Customer extends User {

	String district
	Address address
	Address deliveryAddress

	String email

	Date dateCreated = new Date()

	String phone
	String fax

	String fsdName
	String fsdEmail
	String fsdTitle

	String ndName
	String ndEmail
	String ndTitle

	String cdName
	String cdEmail
	String cdTitle

	boolean receivedCurrentMailing

//	Misc. Stats

	Broker broker

	Integer studentsInDistrict
	Integer facilities
	Integer breakfastsServed
	Integer lunchesServed
	Integer snacksServed
	boolean hasBakery
	boolean purchaseFrozenBread
	boolean purchaseFreshBread
	boolean purchasePreparedFood
	boolean purchaseFrozenFood

	boolean hasPlacedCurrentOrder
	boolean hasCompletedCurrentAssessment

	static hasMany = [calls: Call]

    static constraints = {

		district()
		address()
		deliveryAddress(nullable: true)
		email()
		phone()
		fax(nullable: true)

		fsdName(nullable: true)
		fsdEmail(nullable: true, email: true)
		fsdTitle(nullable: true, inList: ["Mr.", "Mrs."])

		ndName(nullable: true)
		ndEmail(nullable: true, email: true)
		ndTitle(nullable: true, inList: ["Mr.", "Mrs."])

		cdName(nullable: true)
		cdEmail(nullable: true, email: true)
		cdTitle(nullable: true, inList: ["Mr.", "Mrs."])

		broker(nullable: true)

		studentsInDistrict(nullable: true)
		facilities(nullable: true)
		breakfastsServed(nullable: true)
		lunchesServed(nullable: true)
		snacksServed(nullable: true)

    }
}
