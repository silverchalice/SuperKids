package com.superkids.domain

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ReportController {

    def exportService

    def index = { }


	def incompleteOrders = {
		println "exporting incomplete orders"

		def incomplete = []

		def customers = Customer.list(sort:'seq').each { c ->
			if(c.order) {
				println "$c has placed order"
				def order =  c.order
				c.order.products.each {
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

			customer.order.products.each {
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
			c.fsdName = customer.fsdName
			c.fsdTitle = customer.fsdTitle
			c.district = customer.district
			c.missingProducts = total
			c.caller = caller?.username
			c.callTime = call?.dateCreated

			export << c
			}


		}

		List fields = ["seq", "fsdName", "fsdTitle", "district", "missingProducts", "caller", "callTime"]

        Map labels = ["id": "seq", "name": "Name", "title": "Title", "district": "District", "missingProducts": "Missing Products", "caller":"Caller", "callTime" : "Date Called/Ordered"]

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

        def prods = Product.list(sort:'sortOrder')
		println ("After Product.list - ${new Date().time - startTime}")
		Customer.list(sort: "seq").each {customer ->
			if(!customer.deleted) {
				def productIds = customer.order?.products.collect {customer.id}
				def m = [:]
				m.id = customer.id
				m.lastUpdated = customer.lastUpdated
				m.fsdName = customer.fsdName
				m.fsdTitle = customer.fsdTitle
				m.district = customer.district
				m.address = new Expando()
				m.address.street = customer.address?.street
				m.address.street2 = customer.address?.street2
				m.address.city = customer.address?.city
				m.address.state = customer.address?.state
				m.address.zip = customer.address?.zip
				m.phone = customer.phone
				m.fax = customer.fax
				m.email = customer.email
				m.deliveryAddress = new Expando()
				m.deliveryAddress.street = customer.deliveryAddress?.street
				m.deliveryAddress.street2 = customer.deliveryAddress?.street2
				m.deliveryAddress.city = customer.deliveryAddress?.city
				m.deliveryAddress.state = customer.deliveryAddress?.state
				m.deliveryAddress.zip = customer.deliveryAddress?.zip
				m.studentsInDistrict = customer.studentsInDistrict
				m.facilities = customer.facilities
				m.breakfastsServed = customer.breakfastsServed
				m.lunchesServed = customer.lunchesServed
				m.snacksServed = customer.snacksServed
				m.hasBakery = customer.hasBakery ? "YES" : "NO"
				m.purchaseFrozenBread = customer.purchaseFrozenBread ? "YES" : "NO"
				m.purchasePreparedFood = customer.purchasePreparedFood ? "YES" : "NO"
				m.purchaseFrozenFood = customer.purchaseFrozenFood ? "YES" : "NO"
				m.purchaseFreshBread = customer.purchaseFreshBread ? "YES" : "NO"
				m.otherComments = customer.otherComments
				m.seq = customer.seq
				m.topCustomer = customer.topCustomer ? "YES" : "NO"
				m.pastParticipant = customer.pastParticipant ? "YES" : "NO"
				m.callerBrokers = customer.callerBrokers
				m.notes = customer.notes
				def order = customer.order
				prods.each {prod ->
					m."${prod.name}" = order?.products.find {it?.product?.id == prod?.id} ? "Ordered : " + order?.orderType : ''
				}
				m.order = new Expando()
				m.order.shippingDate = customer.order?.shippingDate

				if (withAssessments == 'true') {

					for (prod in prods) {
						def assessment = customer?.assessments.find { it?.product?.id == prod.id }
						def orderedProduct = customer?.order?.products?.find {it?.product?.id == prod.id}
						if (orderedProduct) {
							if (!orderedProduct?.received) {
								m."${prod.name}_Q1" = "Did Not Receive"
								m."${prod.name}_Q2" = "Did Not Receive"
								m."${prod.name}_Q3" = "Did Not Receive"
								m."${prod.name}_Q4" = "Did Not Receive"
							} else if (assessment) {
								m."${prod.name}_Q1" = assessment ? assessment.likeRating : ''
								m."${prod.name}_Q2" = assessment ? assessment.iRating : ''
								m."${prod.name}_Q3" = assessment ? assessment.likeComment : ''
								m."${prod.name}_Q4" = assessment ? assessment.changeComment : ''
							}
						}
					}


				}


				thatWhichIsContainedInOurExportation << m
			}

		}

		println ("After Customer.list - ${new Date().time - startTime}")

        List fields = ["id", "seq", "topCustomer", "lastUpdated", "fsdName", "fsdTitle", "district", "address.street", "address.street2", "address.city", "address.state", "address.zip", "phone", "fax", "email", "deliveryAddress.street", "deliveryAddress.street2", "deliveryAddress.city", "deliveryAddress.state", "deliveryAddress.zip", "studentsInDistrict", "facilities", "breakfastsServed", "lunchesServed", "snacksServed", "hasBakery", "purchaseFrozenBread", "purchasePreparedFood", "purchaseFrozenFood", "purchaseFreshBread", "otherComments", "pastParticipant", "callerBrokers", "notes"]
		for (prod in prods) {
			def foo = prod.name
			if (!prod.parent) {
				fields << foo
			}
		}
		println ("After prods.each - ${new Date().time - startTime}")


        fields << "order.shippingDate"

        Map labels = ["id": "Id", "seq": "New Seq", "topCustomer": "Top 100", "lastUpdated": "Last Updated", "fsdName": "FSD Name", "fsdTitle": "FSD Title", "district": "School District", "address.street": "Address", "address.street2": "Address 2", "address.city": "City", "address.state": "State", "address.zip": "Zip", "phone": "Phone", "fax": "Fax", "email": "Email", "deliveryAddress.street": "Delivery Address", "deliveryAddress.street2": "Delivery Address 2", "deliveryAddress.city": "Delivery City", "deliveryAddress.state": "Delivery State", "deliveryAddress.zip": "Delivery Zip", "studentsInDistrict": "Students in District", "facilities": "Facilities", "breakfastsServed": "Breakfasts Served", "lunchesServed": "Lunches Served", "snacksServed": "Snacks Served", "hasBakery": "Make our own bread products", "purchaseFrozenBread": "Purchase frozen bread products", "purchasePreparedFood": "Purchase prepared foods", "purchaseFrozenFood": "Purchase frozen foods", "purchaseFreshBread": "Purchase fresh bread products", "otherComments": "Other", "pastParticipant": "Previous Participant", "callerBrokers":"Who are your primary foodservice distributors", "notes":"Operator Comments"]

		for (prod in prods) {
			if (!prod.parent) {
				labels."${prod.name}" = prod.name
			}
		}
		println ("After prods.each 2 - ${new Date().time - startTime}")

        def bar = "order.shippingDate"
        labels."${bar}" = "Req'd Ship Date"

        if(withAssessments) {

            def assessFields = []
            def assessLabels = [:]

			for (prod in prods) {
				if (!Product.findByParent(prod)) {
					assessFields << "${prod.name}_Q1"
					assessFields << "${prod.name}_Q2"
					assessFields << "${prod.name}_Q3"
					assessFields << "${prod.name}_Q4"

					assessLabels."${prod.name}_Q1" = "${prod.name}_Like_Rating"
					assessLabels."${prod.name}_Q2" = "${prod.name}_Interest_Rating"
					assessLabels."${prod.name}_Q3" = "${prod.name}_Like_Comment"
					assessLabels."${prod.name}_Q4" = "${prod.name}_Change_Comment"
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

        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Customers-${exDate}.xls")

        exportService.export(params.format, response.outputStream, thatWhichIsContainedInOurExportation, fields, labels, formatters, parameters)
		println ("After export - ${new Date().time - startTime}")
    }


	def exportCalls = {
		println "Exporing Calls..."
		def startTime = new Date().time

        def calls = []

		Call.list(sort: "dateCreated").each {call ->
			if(!call?.customer?.deleted) {
				def m = [:]
				m.id = call.id
				m.dateCreated = call?.dateCreated
				m.customer = call?.customer?.district
				m.caller = call?.caller?.username
				m.result = call?.result
				calls << m
			}
		}

		println ("After Calls.list - ${new Date().time - startTime}")

 	    List fields = ["id", "dateCreated", "customer", "caller", "result"]

        Map labels = ["id": "Id", "dateCreated": "Date", "customer": "Customer", "caller": "Caller", "result": "Result"]

        Map formatters = [:]
        Map parameters = [:]

		Date now = new Date()
		def df = new java.text.SimpleDateFormat('MM-dd-yyyy')
        String exDate = df.format(now)

        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Calls-${exDate}.xls")

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
        response.setHeader("Content-disposition", "attachment; filename=SK_DNRMailing-${exDate}.xls")




        exportService.export(params.format, response.outputStream, customers, fields, labels, formatters, parameters)
		println ("After export - ${new Date().time - startTime}")
    }






}
