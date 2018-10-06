package com.superkids.domain

class Customer extends User {

	String district
	Address address
	Address deliveryAddress

    String recipientAgency

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
	Boolean doNotCall = false

    Date inCall = null


//	Order Form Questions

    String studentsInDistrict                   //Order Form Question #1
    String studentsParticipateBreakfast         //Order Form Question #2a
    String studentsParticipateLunch             //Order Form Question #2b
    String studentsParticipateAfterSchool       //Order Form Question #2c
    String callerBrokers                        //Order Form Question #3  (primary foodservice distributors)
    Boolean hasBakery = null                    //Order Form Question #4
    Boolean useUltragrainFlour = null           //Order Form Question #4a
    Boolean useUltragrainWhiteFlour = null      //Order Form Question #4b
    Boolean buyCommodityFlour = null            //Order Form Question #4c
    String otherFlours                          //Order Form Question #4d
    String otherMixes                           //Order Form Question #4e
    Boolean bakingChallenges                    //Order Form Question #4f
    String otherFlourIssues                     //Order Form Question #4g
    Boolean addedPastItemsToMenu = null         //Order Form Question #5
    Boolean addedPastItemsToMenuA = null        //Order Form Question #5
    String pastItemsAddedToMenu                 //Order Form Question #5a
    Boolean lookForUltragrain = null            //Order Form Question #6
    String participateWaivers                   //Order Form Question #7
    String participateWaiversItems              //Order Form Question #7a
    String packaging                            //Order Form Question 8



    //Old questions:
    Boolean interestedInMixes = null
    String mixTypes
    String mixSizes
    String bidTimeForNewItems
    String studentsParticipate

    Boolean doNotReceiveAdditionalInformation = null

    String otherComments

    //Assessment Questions
    String programFeedback
    String overallPerceptions
	String reformulations
  	String otherProducts
    String addedSampleProducts
    String sampleProductsAdded
    String pastCompanies


    Integer customerRanking

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




    //NOT USED - 10/13/14
    String freeStudents //Order Form Question #3
    Boolean lookForAlliance
    Boolean coOpSamples
    String startLooking  //Order Form Question #7
    String startBidding //Order Form Question #8
    Boolean useWholeWheatFlour
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
    Boolean coOpMember = null                   //Order Form Question #4
    String coOpName                             //Order Form Question #4a
    String coOpAddress                          //Order Form Question #4b
    String secondaryDistributors
    Boolean likesBagHandles = null              //Order Form Question #6d
    String preferredBagSize                     //Order Form Question #6e
    Boolean participateInRewardsPrograms = null //Order Form Question #9
    Boolean participateInCoolSchoolCafe = null  //Order Form Question #9a
    String programsParticipatedIn               //Order Form Question #9b


    Boolean contractManaged                     //Order Form Question #3
    String contractManager                      //Order Form Question #3a


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
        customerRanking nullable: true
        didNotReceiveMailing nullable:true
        seq nullable: true
        recipientAgency nullable: true, maxSize: 512
        secondaryDistributors nullable: true, maxSize: 1024
        source nullable:true

        interestedInMixes nullable:true
        mixSizes nullable:true
        mixTypes nullable:true
        bidTimeForNewItems nullable:true
        participateWaivers nullable:true

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
        useUltragrainWhiteFlour nullable: true

        contactManufacturers nullable:true, maxSize: 12000

		studentsInDistrict nullable: true
        studentsParticipate nullable:  true
        freeStudents nullable: true

        otherMixes nullable: true
        bakingChallenges nullable: true
        studentsParticipateBreakfast nullable: true
        studentsParticipateLunch nullable: true
        studentsParticipateAfterSchool nullable: true

        startBidding nullable: true
        startLooking nullable:  true
        lookForAlliance nullable: true
        useWholeWheatFlour nullable: true
        useUltragrainFlour nullable: true
        buyCommodityFlour nullable: true
        otherFlours nullable: true
        otherFlourIssues nullable: true
        likesBagHandles nullable: true
        preferredBagSize nullable: true

        addedPastItemsToMenu nullable: true
        addedPastItemsToMenuA nullable: true
        pastItemsAddedToMenu nullable: true
        participateInRewardsPrograms nullable: true
        participateInCoolSchoolCafe nullable: true
        programsParticipatedIn nullable: true
        programInfluence nullable: true
        lookForUltragrain nullable: true

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
        coOpSamples nullable:true
        coOpName nullable:true
        coOpAddress nullable:true

        contractManaged  nullable:true
        contractManager  nullable:true

		newCustomer nullable:true

        localBakeries nullable: true
        monthlyFlourUsage nullable:true
        usedUltragrainSustagrainProducts nullable: true
        usedUltragrainSustagrainProducts nullable: true
        doNotReceiveAdditionalInformation nullable: true

		//Final Questions cont...
		programFeedback nullable:true
//        expectationsNotMetFeedback nullable:true, maxSize: 120000
//        expectationsNotMetManufacturer nullable:true
//        expectationsNotMetProductName nullable:true
//        expectationsNotMetReason nullable:true
		reformulations nullable:true
		otherProducts nullable: true
        addedSampleProducts nullable: true
        sampleProductsAdded nullable: true
        pastCompanies nullable: true
        overallPerceptions nullable: true

        participateWaiversItems nullable: true

		// Broker Call Times
		fall nullable:true
		spring nullable:true
		am nullable:true
		pm nullable:true
        pastParticipant nullable:true
        notes nullable:true, blank:true, maxSize: 12000
        opNotes nullable:true, blank:true, maxSize: 12000
        packaging nullable: true, blank: true
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
		district sqlType:"longtext"
        wantedProducts sqlType:"longtext"
        biggestFoodserviceConcern sqlType:"longtext"
	}


    String getRanking() {

        if(customerRanking) {
            switch (customerRanking) {
                case 1:
                    return "Top 100"
                case 2:
                    return "20,000 - 46,999"
                case 3:
                    return "10,001 - 20,000"
                case 4:
                    return "10,000 - 19,999"
                case 5:
                    return "5,000 - 9,999"
                case 6:
                    return "3,000 - 5,000"
                case 7:
                    return "Under 3,000"
                default:
                    return "NA"
            }

        } else {
            return "NA"
        }
    }

	String toString() {
		district
	}

}
