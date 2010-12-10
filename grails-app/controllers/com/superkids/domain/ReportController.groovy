package com.superkids.domain

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ReportController {

    def exportService

    def index = { }

    def exportCustomers = {
		def startTime = new Date().time
        def withAssessments = params.withAssessments

        def thatWhichIsContainedInOurExportation = []

        def prods = Product.list(sort:'sortOrder')
		println ("After Product.list - ${new Date().time - startTime}")
		Customer.list(sort: "seq").each {customer ->
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


        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Customers.xls")

        exportService.export(params.format, response.outputStream, thatWhichIsContainedInOurExportation, fields, labels, formatters, parameters)
		println ("After export - ${new Date().time - startTime}")
    }


	def exportCalls = {
		def startTime = new Date().time


        def calls = []

		Call.list(sort: "dateCreated").each {call ->

			def m = [:]
			m.id = call.id
			m.dateCreated = call?.dateCreated
			m.customer = call?.customer?.district
			m.caller = call?.caller?.username
			m.result = call?.result

			calls << m
		}

		println ("After Calls.list - ${new Date().time - startTime}")




        List fields = ["id", "dateCreated", "customer", "caller", "result"]

        Map labels = ["id": "Id", "dateCreated": "Date", "customer": "Customer", "caller": "Caller", "result": "Result"]




        Map formatters = [:]
        Map parameters = [:]


        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Calls.xls")

        exportService.export(params.format, response.outputStream, calls, fields, labels, formatters, parameters)
		println ("After export - ${new Date().time - startTime}")
    }

}
