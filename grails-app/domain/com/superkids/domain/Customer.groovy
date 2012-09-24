package com.superkids.domain

class Customer extends User {

	String district
	Address address
	Address deliveryAddress

    String timezone
    Integer seq

    String source

	String email

	String website

    CustomerOrder customerOrder

	Date dateCreated = new Date()
    Date lastUpdated

	CustomerStatus status = CustomerStatus.HAS_NOT_ORDERED
	
	String phone
	String fax

    String notes //notes from Callers
    String opNotes //notes from Callers

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

//	Misc. Questions

    String studentsInDistrict //Order Form Question #1
    String breakfastsServed //Order Form Question #2
    String lunchesServed //Order Form Question #3
    String snacksServed //Order Form Question #4
    String facilities //Order Form Question #5

    boolean hasBakery //Order Form Question #6
    String monthlyFlourUsage
    String localBakeries

    String usedUltragrainSustagrainProducts //Order Form Question #7
    String callerBrokers //Order Form Question #8  -- primary foodservice distributors

    Boolean coOpMember //Order Form Question #9
    Boolean coOpSamples
    String coOpName
    String coOpAddress

    Boolean contractManaged //Order Form Question #10
    String contractManager

    String otherComments //Order Form Question #11  -- manufacturerComments


    //Assessment Questions
    String programFeedback
	String reformulations
	String otherProducts


	boolean topCustomer = false

	boolean usingResetPassword = false

    Boolean invalidEmail
    Boolean duplicate
    Boolean deleted = false

	Call lastCall

	boolean hasPlacedCurrentOrder
	boolean hasCompletedCurrentAssessment


	List calls
	List assessments
	List brokers

	static hasMany = [ calls : Call, assessments : Assessment, pastYears : Integer, brokers : Broker, contactManufacturers: Sponsor ]

    static constraints = {

		district nullable:false, blank:false
		address nullable:true, blank:true
		deliveryAddress nullable: false
		email nullable:false, blank:false //, email:true
		website(nullable: true)
		phone(nullable:true, blank:true)
		fax nullable: true 
		inCall nullable:true

        source nullable:true

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

		duplicate nullable:true
		deleted nullable:true
		invalidEmail nullable:true

		assessments nullable: true

		customerOrder nullable:true
		otherComments nullable:true
		lastCall nullable:true

        contactManufacturers nullable:true

		studentsInDistrict nullable: true
		facilities nullable: true
		breakfastsServed nullable: true 
		lunchesServed nullable: true
		snacksServed nullable: true

        coOpMember nullable:true
        coOpSamples nullable:true
        coOpName nullable:true
        coOpAddress nullable:true

        contractManaged  nullable:true
        contractManager  nullable:true

		newCustomer nullable:true

        localBakeries nullable: true
        monthlyFlourUsage nullable:true
        usedUltragrainSustagrainProducts nullable: true

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
        notes nullable:true, blank:true, maxSize: 12000
        opNotes nullable:true, blank:true, maxSize: 12000
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
		only = ['fsdName', 'ndName', 'cdName', 'district', 'email', 'ndEmail', 'cdEmail', 'seq']
	}

	static mapping = {
		opNotes sqlType:"longtext"


	}

	String toString() {
		district
	}

}
