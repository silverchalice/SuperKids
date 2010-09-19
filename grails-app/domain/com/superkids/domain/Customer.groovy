package com.superkids.domain

import com.superkids.domain.CustomerOrder

class Customer extends User {

	String district
	Address address
	Address deliveryAddress

	String email

	String website

    CustomerOrder order

	Date dateCreated = new Date()

	CustomerStatus status = CustomerStatus.HAS_NOT_ORDERED
	
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

	boolean receivedCurrentMailing = true
        boolean isNew

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

	static hasMany = [ calls : Call, assessments : Assessment ]

    static constraints = {

		district nullable:true, blank:true
		address nullable:true, blank:true
		deliveryAddress nullable: true
		email()
		website(nullable: true)
		phone()
		fax nullable: true 

		fsdName nullable: true
		fsdEmail nullable: true, email: true
		fsdTitle nullable: true

		ndName nullable: true
		ndEmail nullable: true, email: true
		ndTitle nullable: true

		cdName nullable: true
		cdEmail nullable: true, email: true
		cdTitle nullable: true

		broker nullable: true

                order nullable:true

		studentsInDistrict nullable: true
		facilities nullable: true
		breakfastsServed nullable: true 
		lunchesServed nullable: true
		snacksServed nullable: true

    }
	
	static namedQueries = {
		readyForOrder {
			eq 'status', CustomerStatus.HAS_NOT_ORDERED
			
		}

		readyForAssessment {
			eq 'status', CustomerStatus.HAS_ORDERED
		}
	}
}
