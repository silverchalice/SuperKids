package com.superkids.domain

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ReportController {

    def exportService

    def index = { }


	def incompleteOrders = {
		println "exporting incomplete orders"

		def incomplete = []

		def customers = Customer.list(sort:'seq').each { c ->
			if(c.customerOrder) {
				println "$c has placed order"
				def order =  c.customerOrder
				c.customerOrder.products.each {
					println "checking $it.product"
					if(!it.product) {
						println "$c has a missing product"
						incomplete << c
					}
				}
			}
		}

		def export = []

		incomplete.each { customer ->
			def c = [:]


			def total = 0

			customer.customerOrder.products.each {
				if(!it.product) {
					total++
				}
			}

			if(total < 5) {
				def caller
			def call = Call.findByCustomerAndResult(customer, CallResult.QUALIFIED)
			println "looking for the call"
			if(call) {
				println "found the call"
				caller = call.caller
			}


			c.seq = customer.seq
			c.top = customer.topCustomer
			c.fsdName = customer.fsdName
			c.fsdTitle = customer.fsdTitle
			c.district = customer.district
			c.bakes = customer.hasBakery
			c.missingProducts = total
			c.caller = caller?.username
			c.callTime = call?.dateCreated

			export << c
			}


		}

		List fields = ["seq", "top", "fsdName", "fsdTitle", "district", "bakes", "missingProducts", "caller", "callTime"]

        Map labels = ["seq": "seq", "top": "Top Customer", "name": "Name", "title": "Title", "district": "District", "bakes": "Has Bakery", "missingProducts": "Missing Products", "caller":"Caller", "callTime" : "Date Called/Ordered"]

        Map formatters = [:]
        Map parameters = [:]

		export = export.unique()

        response.contentType = ConfigurationHolder.config.grails.mime.types["excel"]
        response.setHeader("Content-disposition", "attachment; filename=Incomplete_Orders.xls")

        exportService.export("excel", response.outputStream, export, fields, labels, formatters, parameters)

	}



    def exportCustomers = {
		println "exporting customers..."

		def startTime = new Date().time
        def withAssessments = params.withAssessments

		if(withAssessments) println "with assessments..."

        def thatWhichIsContainedInOurExportation = []

        def prods = Product.findAllByLiveProduct(true, [sort:'sortOrder'])
		println ("After Product.list - ${new Date().time - startTime}")
		Customer.list(sort: "seq").each {customer ->
			if(!customer.deleted) {
				def productIds = customer.customerOrder?.products?.collect {customer.id}
				def contactTime = "${customer.fall ? 'Fall, ' : ''}${customer.spring ? 'Spring, ' : ''}${customer.am ? 'AM, ' : ''}${customer.pm ? 'PM' : ''}"


				def m = [:]
				m.id = customer.id
				m.lastUpdated = customer.lastUpdated
				m.source = customer.source
				m.fsdName = customer.fsdName
				m.fsdTitle = customer.fsdTitle
				m.district = customer.district
				m.address = new Expando()
				m.address.street = customer.address?.street
				m.address.street2 = customer.address?.street2
				m.address.city = customer.address?.city
				m.address.state = customer?.address?.state
				m.address.zip = customer.address?.zip
				m.phone = customer.phone
				m.fax = customer.fax
				m.email = customer.email
				m.deliveryAddress = new Expando()
				m.deliveryAddress.street = customer.deliveryAddress?.street
				m.deliveryAddress.street2 = customer.deliveryAddress?.street2
				m.deliveryAddress.city = customer.deliveryAddress?.city
				m.deliveryAddress.state = customer?.address?.state
				m.deliveryAddress.zip = customer.deliveryAddress?.zip
				m.studentsInDistrict = customer.studentsInDistrict

				m.studentsParticipate = customer.studentsParticipate
				m.lookForAlliance = customer.lookForAlliance ? "YES" : "NO"

				m.facilities = customer.facilities
				m.breakfastsServed = customer.breakfastsServed
				m.lunchesServed = customer.lunchesServed
				m.snacksServed = customer.snacksServed
				m.hasBakery = customer.hasBakery ? "YES" : "NO"

                m.monthlyFlourUsage = customer.monthlyFlourUsage
                m.localBakeries = customer.localBakeries

                m.startLooking = customer.startLooking
                m.startBidding = customer.startBidding
                m.readyFor2013 = customer.readyFor2013
                m.readyFor2014 = customer.readyFor2014
                m.wholeGrainChallenge = customer.wholeGrainChallenge
                m.wantedProducts = customer.wantedProducts
                m.biggestFoodserviceConcern = customer.biggestFoodserviceConcern
                m.biggestFoodserviceConcern = customer.biggestFoodserviceConcern

                m.usedUltragrainSustagrainProducts = customer.usedUltragrainSustagrainProducts
                m.doNotReceiveAdditionalInformation = customer.doNotReceiveAdditionalInformation
                m.useUltragrainFlour = customer.useUltragrainFlour ? "YES" : "NO"
                m.buyCommodityFlour = customer.buyCommodityFlour ? "YES" : "NO"
                m.useWholeWheatFlour = customer.useWholeWheatFlour ? "YES" : "NO"
                m.coOpMember = customer.coOpName ? "YES" : "NO"
                m.coOpSamples = customer.coOpSamples ? "YES" : "NO"
                m.coOpName = customer.coOpName
                m.coOpAddress = customer.coOpAddress
                m.contractManaged = customer.contractManaged ? "YES" : "NO"
                m.contractManager = customer.contractManager
				m.otherComments = customer.otherComments
				m.seq = customer.seq
				m.topCustomer = customer.topCustomer ? "YES" : "NO"
				m.pastParticipant = customer.pastParticipant ? "YES" : "NO"
				m.callerBrokers = customer.callerBrokers

				m.notes = customer.opNotes
				m.contact = contactTime

				def order = customer.customerOrder
				prods.each {prod ->
					m."${prod.name}" = order?.products?.find {it?.product?.id == prod?.id} ? "Ordered : " + order?.orderType : ''
				}

				m.order = new Expando()
				m.order.shippingDate = customer.customerOrder?.shippingDate

                Sponsor.findAllByInactive(false).sort {it.name}.each { sponsor ->
                    m."${sponsor.name}" = customer.contactManufacturers?.contains(sponsor) ? "YES" : "NO"
                }

				if (withAssessments == 'true') {

					for (prod in prods) {
						Assessment assessment = customer?.assessments?.find { it?.product?.id == prod.id }

						def orderedProduct = customer?.customerOrder?.products?.find { it?.product?.id == prod.id }

						if (orderedProduct) {

							if (!orderedProduct?.received) {
								m."${prod.name}_Q1" = "Did Not Receive"
								m."${prod.name}_Q2" = "Did Not Receive"
								m."${prod.name}_Q3" = "Did Not Receive"
							} else if (!orderedProduct?.sampled) {
								m."${prod.name}_Q1" = "Did Not Sample"
								m."${prod.name}_Q2" = "Did Not Sample"
								m."${prod.name}_Q3" = "Did Not Sample"
							} else if (assessment){
								m."${prod.name}_Q1" = assessment?.likeRating
								m."${prod.name}_Q2" = assessment?.likeComment
								m."${prod.name}_Q3" = assessment?.changeComment
								m.type = assessment.type
								if(prod?.id == 23) {
									m."${prod.name}_Q4" = assessment.favorite
								}
							} else {
                                println "something when wrong here..."
                            }
						}
					}

				   	def rA =  customer?.assessments?.find {it}

					m.assessmentOrigin = rA?.type
					m.programFeedback = customer.programFeedback
					m.reformulations = customer.reformulations
					m.otherProducts = customer.otherProducts

				}

                println "$m.id: $m.district $m.fsdName"


				thatWhichIsContainedInOurExportation << m
			}

		}

		println ("After Customer.list - ${new Date().time - startTime}")

        List fields = ["id",
                "seq",
                "topCustomer",
                "lastUpdated",
                "source",
                "fsdName",
                "fsdTitle",
                "district",
                "address.street",
                "address.street2",
                "address.city",
                "address.state",
                "address.zip",
                "phone",
                "fax",
                "email",
                "deliveryAddress.street",
                "deliveryAddress.street2",
                "deliveryAddress.city",
                "deliveryAddress.state",
                "deliveryAddress.zip",
                "studentsInDistrict",
                "studentsParticipate",
                "lookForAlliance",
                "facilities",
                "breakfastsServed",
                "lunchesServed",
                "snacksServed",
                "hasBakery",
                "monthlyFlourUsage",
                "localBakeries",
                "startLooking",
                "startBidding",
                "readyFor2013",
                "readyFor2014",
                "wholeGrainChallenge",
                "wantedProducts",
                "biggestFoodserviceConcern",

                "usedUltragrainSustagrainProducts",
                "doNotReceiveAdditionalInformation",
                "useUltragrainFlour",
                "buyCommodityFlour",
                "useWholeWheatFlour",
                "coOpMember",
                "coOpSamples",
                "coOpName",
                "coOpAddress",
                "contractManaged",
                "contractManager",

                "otherComments",
                "pastParticipant",
                "callerBrokers",
                //"brokerName",
                //"brokerEmail",
                //"brokerPhone",
                //"brokerFax",
                //"brokerStreet",
                //"brokerStreet2",
                //"brokerCity",
                //"brokerState",
                //"brokerZip",
                "notes" ,
                "contact"]
		for (prod in prods) {
			def foo = prod.name
			if (!prod.parent) {
				fields << foo
			}
		}

        Sponsor.findAllByInactive(false).sort {it.name}.each { sponsor ->
            fields << sponsor.name
        }


		println ("After prods.each - ${new Date().time - startTime}")


        fields << "order.shippingDate"

        Map labels = ["id": "Id",
                "seq": "New Seq",
                "topCustomer": "Top 100",
                "lastUpdated": "Last Updated",
                "source": "Classification",
                "fsdName": "FSD Name",
                "fsdTitle": "FSD Title",
                "district": "School District",
                "address.street": "Address",
                "address.street2": "Address 2",
                "address.city": "City",
                "address.state": "State",
                "address.zip": "Zip",
                "phone": "Phone",
                "fax": "Fax",
                "email": "Email",
                "deliveryAddress.street": "Delivery Address",
                "deliveryAddress.street2": "Delivery Address 2",
                "deliveryAddress.city": "Delivery City",
                "deliveryAddress.state": "Delivery State",
                "deliveryAddress.zip": "Delivery Zip",
                "studentsInDistrict": "Students in District",
                "studentsParticipate": "Participating Students",
                "lookForAlliance": "Look for foods that meet Alliance Guidelines",
                "facilities": "Facilities",
                "breakfastsServed": "Breakfasts Served",
                "lunchesServed": "Lunches Served",
                "snacksServed": "Snacks Served",
                "hasBakery": "Bake from Scratch",
                "monthlyFlourUsage": "Monthly Flour Usage",
                "localBakeries": "Local Bakeries to Contact",

                "startLooking": "Start Looking",
                "startBidding": "Start Bidding",
                "readyFor2013": "Ready for 2013",
                "readyFor2014": "Ready for 2014",
                "wholeGrainChallenge": "Challenges",
                "wantedProducts": "Wanted Products",
                "biggestFoodserviceConcern": "Biggest Foodservice Concern",

                "usedUltragrainSustagrainProducts": "Ultragrain/Sustagrain products in use",
                "useUltragrainFlour": "Use Ultragrain Flour",
                "buyCommodityFlour": "Buy Commodity Flour",
                "useWholeWheatFlour": "Use Commodity Flour",
                "coOpMember":"Member of a Co-op",
                "coOpSamples": "Send Samples to Co-op",
                "coOpName": "Co-op Name",
                "coOpAddress": "Co-op Address",
                "contractManaged": "Contract Managed",
                "contractManager": "Contractor",

                "pastParticipant": "Previous Participant",
                "callerBrokers":"Who are your primary foodservice distributors",
                "doNotReceiveAdditionalInformation": "Opted out of additional information",
                //"brokerName":"Distributor Name",
                //"brokerEmail":"Distributor Email",
                //"brokerPhone":"Distributor Phone",
                //"brokerFax":"Distributor Fax",
                //"brokerStreet":"Distributor Street",
                //"brokerStreet2":"Distributor Street 2",
                //"brokerCity":"Distributor City",
                //"brokerState":"Distributor State",
                //"brokerZip":"Distributor Zip",
                "notes":"Operator Comments",
                "contact": "Contact Times"]

		for (prod in prods) {
			if (!prod.parent) {
				labels."${prod.name}" = prod.name
			}
		}

        Sponsor.findAllByInactive(false).sort {it.name}.each { sponsor ->
            labels."${sponsor.name}" = sponsor.name
        }

		println ("After prods.each 2 - ${new Date().time - startTime}")

        def bar = "order.shippingDate"
        labels."${bar}" = "Req'd Ship Date"

        if(withAssessments) {

            def assessFields = []
            def assessLabels = [:]



			assessLabels.programFeedback = "General Feedback"
			assessLabels.reformulations = "Reformulations"
			assessLabels.otherProducts = "Other Products"
			assessLabels.assessmentOrigin = "Assessment Origin"


			assessFields << "programFeedback"
			assessFields << "reformulations"
			assessFields << "otherProducts"
			assessFields << "assessmentOrigin"


			for (prod in prods) {
				if (!Product.findByParent(prod)) {
					assessFields << "${prod.name}_Q1"
					assessFields << "${prod.name}_Q2"
					assessFields << "${prod.name}_Q3"


					assessLabels."${prod.name}_Q1" = "Interest in ${prod.name}"
					assessLabels."${prod.name}_Q2" = "${prod.name} Like Comments"
					assessLabels."${prod.name}_Q3" = "${prod.name} Change Comment"


					if(prod.id == 23) {
						assessFields << "${prod.name}_Q4"
						assessLabels."${prod.name}_Q4" = "${prod.name} Favorite Pasta"
					}


				}
			}


			println ("After prods.each 3 - ${new Date().time - startTime}")
            labels = labels + assessLabels
            fields = fields + assessFields
        }

        def upperCase = { domain, value ->
            return value.toUpperCase()
        }

        Map formatters = [:]		
        Map parameters = [:]


		Date now = new Date()
		def df = new java.text.SimpleDateFormat('MM-dd-yyyy')
        String exDate = df.format(now)

/*
        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Customers-${exDate}.xls")
*/      
        def fileName = "SK_Customers-${exDate}.csv"
        def fileRoot = servletContext.getRealPath("/")
        def fos = new FileOutputStream("${fileRoot}/tmp/${fileName}")
        exportService.export('csv', fos, thatWhichIsContainedInOurExportation, fields, labels, formatters, parameters)
		println ("After export - ${new Date().time - startTime}")
		render view:'downloadDialog', model:[fileName:fileName, desc:'Customer Data']
    }

	def exportCalls = {
		println "Exporing Calls..."
		def startTime = new Date().time

        def calls = []

		Call.list(sort: "dateCreated").each {call ->
			if(!call?.customer?.deleted) {

				def sdf = new java.text.SimpleDateFormat('MM/dd/yyyy')
				def sdf2 = new java.text.SimpleDateFormat('h:mm a z')
				def dateCreated = sdf.format(call?.dateCreated)
				def timeCreated = sdf2.format(call?.dateCreated)

				def m = [:]
				m.id = call.id
				m.dateCreated = dateCreated
				m.timeCreated = timeCreated
				m.customer = call?.customer?.district
				m.caller = call?.caller?.username
				m.result = call?.result
				calls << m
			}
		}

		println ("After Calls.list - ${new Date().time - startTime}")

 	    List fields = ["id", "dateCreated", "timeCreated", "customer", "caller", "result"]

        Map labels = ["id": "Id", "dateCreated": "Date", "timeCreated": "Time", "customer": "Customer", "caller": "Caller", "result": "Result"]

        Map formatters = [:]
        Map parameters = [:]

		Date now = new Date()
		def df = new java.text.SimpleDateFormat('MM-dd-yyyy')
        String exDate = df.format(now)

        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Calls-${exDate}.csv")

        exportService.export(params.format, response.outputStream, calls, fields, labels, formatters, parameters)
		println ("After export - ${new Date().time - startTime}")
    }

	def exportDNRCustomers = {
		println "Exporting DNR Customers...."
		def startTime = new Date().time

        def customers = []

		def c = Customer.createCriteria()

		c.list(sort: "seq") {
				eq 'didNotReceiveMailing', true
		}.each {customer ->
			if(!customer.deleted) {
				def m = [:]
				m.id = customer.id
				m.district = customer?.district
				m.fsdName = customer?.fsdName
				m.email = customer?.email
				m.address = customer?.address

				customers << m
			}
		}

		println ("After Customers.list - ${new Date().time - startTime}")

 	    List fields = ["id", "district", "fsdName", "email", "address"]

        Map labels = ["id": "Id", "district": "School District", "fsdName": "FSD", "email": "Email", "address": "Address"]

        Map formatters = [:]
        Map parameters = [:]

		Date now = new Date()
		def df = new java.text.SimpleDateFormat('MM-dd-yyyy')
        String exDate = df.format(now)


        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_DNRMailing-${exDate}.csv")




        exportService.export(params.format, response.outputStream, customers, fields, labels, formatters, parameters)
		println ("After export - ${new Date().time - startTime}")
    }

	def exportPotentialParticipants = {
		println "Exporting Potential Paticipants Customers...."

        def customers = []

		def c = Customer.createCriteria()

		c.list(sort: "seq") {
			eq 'duplicate', false
			eq 'invalidEmail', false
			eq 'deleted', false
			eq 'hasPlacedCurrentOrder', true
			eq 'hasCompletedCurrentAssessment', false
			lastCall {
					not { eq('result', CallResult.REFUSED) }
					not { eq('result', CallResult.NOT_QUALIFIED) }
					not { eq('result', CallResult.QUALIFIED) }
			}
		}.each {customer ->
				def m = [:]
				m.id = customer.id
				m.district = customer?.district
				m.fsdName = customer?.fsdName
				m.email = customer?.email
				m.address = customer?.address


				customers << m

		}

 	    List fields = ["id", "district", "fsdName", "email", "address"]

        Map labels = ["id": "Id", "district": "School District", "fsdName": "FSD", "email": "Email", "address": "Address"]

        Map formatters = [:]
        Map parameters = [:]

		Date now = new Date()
		def df = new java.text.SimpleDateFormat('MM-dd-yyyy')
        String exDate = df.format(now)

        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Potential_Participants-${exDate}.xls")

        exportService.export(params.format, response.outputStream, customers, fields, labels, formatters, parameters)
    }


}
