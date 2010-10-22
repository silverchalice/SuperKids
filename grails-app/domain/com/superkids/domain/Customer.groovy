package com.superkids.domain

class Customer extends User {

	String district
	Address address
	Address deliveryAddress

	String email

	String website

        CustomerOrder order

	Date dateCreated = new Date()
        Date lastUpdated

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

	Boolean didNotReceiveMailing = true
	Boolean newCustomer
	Boolean fall
	Boolean spring
	Boolean am
	Boolean pm
	Date inCall = null

//	Misc. Stats

	String studentsInDistrict
	String facilities
	String breakfastsServed
	String lunchesServed
	String snacksServed

	String programFeedback
	String reformulations
	String otherProducts

	boolean hasBakery
	boolean purchaseFrozenBread
	boolean purchaseFreshBread
	boolean purchasePreparedFood
	boolean purchaseFrozenFood

	boolean topCustomer = false

        boolean usingResetPassword = false

	String otherComments

	Call lastCall

	boolean hasPlacedCurrentOrder
	boolean hasCompletedCurrentAssessment

	List calls
	List assessments
	List brokers

	static hasMany = [ calls : Call, assessments : Assessment, pastYears : Integer, brokers : Broker ]

    static constraints = {

		district nullable:true, blank:true
		address nullable:true, blank:true
		deliveryAddress nullable: false
		email()
		website(nullable: true)
		phone(nullable:true, blank:true)
		fax nullable: true 
		inCall nullable:true

		fsdName nullable: true
		fsdEmail nullable: true
		fsdTitle nullable: true

		ndName nullable: true
		ndEmail nullable: true
		ndTitle nullable: true

		cdName nullable: true
		cdEmail nullable: true
		cdTitle nullable: true

		assessments nullable: true

		order nullable:true
		otherComments nullable:true
		lastCall nullable:true

		studentsInDistrict nullable: true
		facilities nullable: true
		breakfastsServed nullable: true 
		lunchesServed nullable: true
		snacksServed nullable: true

		newCustomer nullable:true

		//Final Questions cont...
		programFeedback nullable:true
		reformulations nullable:true
		otherProducts nullable: true


		// Broker Call Times
		fall nullable:true
		spring nullable:true
		am nullable:true
		pm nullable:true
    }
	
	static namedQueries = {
		readyForOrder {
			eq 'status', CustomerStatus.HAS_NOT_ORDERED
			
		}

		readyForAssessment {
			eq 'status', CustomerStatus.HAS_ORDERED
		}
	}
    
	static searchable = {
		only = ['fsdName', 'ndName', 'cdName', 'district', 'fsdEmail', 'ndEmail', 'cdEmail']
	}

	String toString() {
		district
	}

}
