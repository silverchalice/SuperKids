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

	Boolean didNotReceiveMailing
	Boolean newCustomer
	Boolean fall
	Boolean spring
	Boolean am
	Boolean pm
	Boolean pastParticipant
	Date inCall = null

//	Misc. Questions

    String studentsInDistrict //Order Form Question #1
    String studentsParticipate //Order Form Question #2
    String freeStudents //Order Form Question #3
    Boolean lookForAlliance
    Boolean contractManaged //Order Form Question #4
    Boolean contractManagedNA //Order Form Question #4
    String contractManager
    Boolean coOpMember //Order Form Question #5
    Boolean coOpMemberNA //Order Form Question #5
    Boolean coOpSamples
    Boolean coOpSamplesNA
    String coOpName
    String coOpAddress
    String callerBrokers //Order Form Question #6  -- primary foodservice distributors
    String startLooking  //Order Form Question #7
    String startBidding //Order Form Question #8
    Boolean hasBakery //Order Form Question #6
    Boolean hasBakeryNA //Order Form Question #6
    Boolean useWholeWheatFlour
    Boolean useUltragrainFlour
    Boolean useUltragrainFlourNA
    Boolean buyCommodityFlour
    Boolean buyCommodityFlourNA
    Boolean addedPastItemsToMenu
    Boolean addedPastItemsToMenuNA
    String pastItemsAddedToMenu
    Boolean participateInRewardsPrograms
    Boolean participateInRewardsProgramsNA
    String programsParticipatedIn
    String programInfluence
    String localBakeries
    Boolean readyFor2013
    Boolean readyFor2014
    String wholeGrainChallenge
    String wantedProducts
    String biggestFoodserviceConcern

    String breakfastsServed
    String lunchesServed
    String snacksServed
    String facilities

    String monthlyFlourUsage

    String usedUltragrainSustagrainProducts //Order Form Question #7

    Boolean doNotReceiveAdditionalInformation = false

    String otherComments //Order Form Question #11  -- manufacturerComments


    //Assessment Questions
    String programFeedback
    String expectationsNotMetFeedback
    String expectationsNotMetManufacturer
    String expectationsNotMetProductName
    String expectationsNotMetReason
	  String reformulations
  	String otherProducts
    String addedSampleProducts
    String sampleProductsAdded
    String pastCompanies


	boolean topCustomer = false

	Boolean usingResetPassword = false

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

        didNotReceiveMailing nullable:true
        seq nullable: true

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

        hasBakery nullable: true
        hasBakeryNA nullable: true

        contactManufacturers nullable:true, maxSize: 12000

		studentsInDistrict nullable: true
        studentsParticipate nullable:  true
        freeStudents nullable: true

        startBidding nullable: true
        startLooking nullable:  true
        lookForAlliance nullable: true
        useWholeWheatFlour nullable: true
        useUltragrainFlour nullable: true
        useUltragrainFlourNA nullable: true
        buyCommodityFlour nullable: true
        buyCommodityFlourNA nullable: true

        addedPastItemsToMenu nullable: true
        addedPastItemsToMenuNA nullable: true
        pastItemsAddedToMenu nullable: true
        participateInRewardsPrograms nullable: true
        participateInRewardsProgramsNA nullable: true
        programsParticipatedIn nullable: true
        programInfluence nullable: true

        readyFor2013 nullable: true
        readyFor2014 nullable: true
        wholeGrainChallenge nullable: true, maxSize: 12000
        wantedProducts nullable: true, maxSize: 12000
        biggestFoodserviceConcern nullable: true, maxSize: 12000

        facilities nullable: true
		breakfastsServed nullable: true 
		lunchesServed nullable: true
		snacksServed nullable: true

        coOpMember nullable:true
        coOpMemberNA nullable:true
        coOpSamples nullable:true
        coOpSamplesNA nullable:true
        coOpName nullable:true
        coOpAddress nullable:true

        contractManaged  nullable:true
        contractManagedNA  nullable:true
        contractManager  nullable:true

		newCustomer nullable:true

        localBakeries nullable: true
        monthlyFlourUsage nullable:true
        usedUltragrainSustagrainProducts nullable: true
        usedUltragrainSustagrainProducts nullable: true
        doNotReceiveAdditionalInformation nullable: true

		//Final Questions cont...
		programFeedback nullable:true
        expectationsNotMetFeedback nullable:true, maxSize: 120000
        expectationsNotMetManufacturer nullable:true
        expectationsNotMetProductName nullable:true
        expectationsNotMetReason nullable:true
		reformulations nullable:true
		otherProducts nullable: true
        addedSampleProducts nullable: true
        sampleProductsAdded nullable: true
        pastCompanies nullable: true


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
        wantedProducts sqlType:"longtext"
        biggestFoodserviceConcern sqlType:"longtext"
	}

	String toString() {
		district
	}

}
