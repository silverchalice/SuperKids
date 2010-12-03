package com.superkids.domain

class Customer extends User {

	String district
	Address address
	Address deliveryAddress

    String timezone
    Integer seq

	String email

	String website

    CustomerOrder order

	Date dateCreated = new Date()
    Date lastUpdated

	CustomerStatus status = CustomerStatus.HAS_NOT_ORDERED
	
	String phone
	String fax

    String notes //notes from Callers

	String fsdName
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
        Boolean pastParticipant
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

    String callerBrokers // brokers collected from callers

	static hasMany = [ calls : Call, assessments : Assessment, pastYears : Integer, brokers : Broker ]

    static constraints = {

		district nullable:false, blank:false
		address nullable:true, blank:true
		deliveryAddress nullable: false
		email nullable:false, blank:false //, email:true
		website(nullable: true)
		phone(nullable:true, blank:true)
		fax nullable: true 
		inCall nullable:true

		fsdName nullable: false
		fsdTitle nullable: true

		ndName nullable: true
		ndEmail nullable: true
		ndTitle nullable: true

		cdName nullable: true
		cdEmail nullable: true
		cdTitle nullable: true

        timezone nullable: true
        seq nullable: true
        callerBrokers nullable: true

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
        pastParticipant nullable:true
        notes nullable:true, blank:true
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
		only = ['fsdName', 'ndName', 'cdName', 'district', 'email', 'ndEmail', 'cdEmail']
	}

        static mapping = {
            notes sqlType:"text"
        }

	String toString() {
		district
	}

}
