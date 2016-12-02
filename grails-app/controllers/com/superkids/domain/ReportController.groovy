package com.superkids.domain

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class ReportController {

    def servletContext
    def exportService

    def index = {}


    def incompleteOrders = {
        println "exporting incomplete orders"

        def incomplete = []

        def customers = Customer.list(sort: 'seq').each { c ->
            if (c.customerOrder) {
                println "$c has placed order"
                def order = c.customerOrder
                c.customerOrder.products.each {
                    println "checking $it.product"
                    if (!it.product) {
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
                if (!it.product) {
                    total++
                }
            }

            if (total < 5) {
                def caller
                def call = Call.findByCustomerAndResult(customer, CallResult.QUALIFIED)
                println "looking for the call"
                if (call) {
                    println "found the call"
                    caller = call.caller
                }

                c.seq = customer.seq
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

        List fields = ["seq", "fsdName", "fsdTitle", "district", "bakes", "missingProducts", "caller", "callTime"]

        Map labels = ["seq": "seq", "name": "Name", "title": "Title", "district": "District", "bakes": "Has Bakery", "missingProducts": "Missing Products", "caller": "Caller", "callTime": "Date Called/Ordered"]

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

        if (withAssessments) println "with assessments..."

        def thatWhichIsContainedInOurExportation = []

        def prods = Product.findAllByLiveProduct(true, [sort: 'sortOrder'])
        println("After Product.list - ${new Date().time - startTime}")
        Customer.list(sort: "seq").each { customer ->
            if (!customer.deleted) {
                def productIds = customer.customerOrder?.products?.collect { customer.id }

                def m = [:]
                m.id = customer.id
                m.lastUpdated = customer.lastUpdated
                m.source = customer.source
                m.fsdName = customer.fsdName
                m.fsdTitle = customer.fsdTitle
                m.district = customer.district
                m.recipientAgency = customer.recipientAgency
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
                m.callerBrokers = customer.callerBrokers
                m.hasBakery = (customer.hasBakery == null) ? "N/A" : customer.hasBakery ? "YES" : "NO"
                m.useUltragrainFlour = (customer.useUltragrainFlour == null) ? "N/A" : customer.useUltragrainFlour ? "YES" : "NO"
                m.useUltragrainWhiteFlour = (customer.useUltragrainWhiteFlour == null) ? "N/A" : customer.useUltragrainWhiteFlour ? "YES" : "NO"
                m.otherFlours = customer.otherFlours
                m.otherFlourIssues = customer.otherFlourIssues
                m.addedPastItemsToMenu = (customer.addedPastItemsToMenu == null) ? "N/A" : customer.addedPastItemsToMenu ? "YES" : "NO"
                m.pastItemsAddedToMenu = customer.pastItemsAddedToMenu
                m.lookForUltragrain = (customer.lookForUltragrain == null) ? "N/A" : customer.lookForUltragrain ? "YES" : "NO"
                m.participateWaivers = customer.participateWaivers
                m.participateWaiversItems = customer.participateWaiversItems

                m.pastParticipant = (customer.pastParticipant == null) ? "N/A" : customer.pastParticipant ? "YES" : "NO"
                m.doNotReceiveAdditionalInformation = (customer.doNotReceiveAdditionalInformation == null) ? "N/A" : customer.doNotReceiveAdditionalInformation ? "YES" : "NO"
                m.didNotReceiveMailing = (customer.didNotReceiveMailing == null) ? "N/A" : customer.didNotReceiveMailing ? "YES" : "NO"
                m.seq = customer.seq
                m.customerRanking = customer.ranking
                m.notes = customer.opNotes

                def order = customer.customerOrder
                prods.each { prod ->
                    m."${prod.name}" = order?.products?.find {
                        it?.product?.id == prod?.id
                    } ? "Ordered : " + order?.orderType : ''
                }

                m.order = new Expando()
                m.order.shippingDate = customer.customerOrder?.shippingDate

                if (withAssessments == 'true') {

                    for (prod in prods) {
                        Assessment assessment = Assessment.findByCustomerAndProduct(customer, prod)
                        def orderedProduct = ProductOrder.findByOrderAndProduct(customer.customerOrder, prod)

                        if (orderedProduct) {
                            if (!orderedProduct?.received) {
                                m."${prod.name}_Q1" = "Did Not Receive"
                                m."${prod.name}_Q2" = "Did Not Receive"
                                m."${prod.name}_Q3" = "Did Not Receive"
                            } else if (!orderedProduct?.sampled) {
                                m."${prod.name}_Q1" = "Did Not Sample"
                                m."${prod.name}_Q2" = "Did Not Sample"
                                m."${prod.name}_Q3" = "Did Not Sample"
                            } else if(assessment) {
                                m."${prod.name}_Q1" = assessment?.likeRating
                                m."${prod.name}_Q2" = assessment?.likeComment
                                m."${prod.name}_Q3" = assessment?.changeComment
                                m.type = assessment.type
                            } else {
                                println "something when wrong here..."
                                println "product: ${prod?.id}, customer ${customer.id} assessment: ${assessment})"
                                println "${customer.assessments.collect { it.id + '-' + it.product?.id }.join(',')}"
                            }
                        }

                    }

                    def rA = customer?.assessments?.find { it }

                    m.assessmentOrigin = rA?.type
                    m.overallPerceptions = customer.overallPerceptions ?: ""
                    m.programFeedback = customer.programFeedback
                    m.addedPastItemsToMenuA = (customer.addedPastItemsToMenuA == null) ? "N/A" : customer.addedPastItemsToMenuA ? "YES" : "NO"


                }

                println "$m.id: $m.district $m.fsdName"


                thatWhichIsContainedInOurExportation << m
            }
        }

        println("After Customer.list - ${new Date().time - startTime}")

        List fields = ["id",
                       "seq",
                       "customerRanking",
                       "lastUpdated",
                       "source",
                       "fsdName",
                       "fsdTitle",
                       "district",
                       "recipientAgency",
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
                       "callerBrokers",
                       "hasBakery",
                       "useUltragrainFlour",
                       "useUltragrainWhiteFlour",
                       "otherFlours",
                       "otherFlourIssues",
                       "addedPastItemsToMenu",
                       "pastItemsAddedToMenu",
                       "lookForUltragrain",
                       "participateWaivers",
                       "participateWaiversItems",

                       "pastParticipant",
                       "doNotReceiveAdditionalInformation",
                       "didNotReceiveMailing",
                       "notes"]

        for (prod in prods) {
            def foo = prod.name
            if (!prod.parent) {
                fields << foo
            }
        }

        println("After prods.each - ${new Date().time - startTime}")

        fields << "order.shippingDate"

        Map labels = ["id"                               : "Id",
                      "seq"                              : "New Seq",
                      "customerRanking"                  : "Customer Rank",
                      "lastUpdated"                      : "Last Updated",
                      "source"                           : "Classification",
                      "fsdName"                          : "FSD Name",
                      "fsdTitle"                         : "FSD Title",
                      "district"                         : "School District",
                      "recipientAgency"                  : "Recipient Agency #",
                      "address.street"                   : "Address",
                      "address.street2"                  : "Address 2",
                      "address.city"                     : "City",
                      "address.state"                    : "State",
                      "address.zip"                      : "Zip",
                      "phone"                            : "Phone",
                      "fax"                              : "Fax",
                      "email"                            : "Email",
                      "deliveryAddress.street"           : "Delivery Address",
                      "deliveryAddress.street2"          : "Delivery Address 2",
                      "deliveryAddress.city"             : "Delivery City",
                      "deliveryAddress.state"            : "Delivery State",
                      "deliveryAddress.zip"              : "Delivery Zip",

                      "studentsInDistrict"               : "Students in District",
                      "studentsParticipate"              : "Participating Students",
                      "callerBrokers"                    : "Primary foodservice distributors",
                      "hasBakery"                        : "Bake from Scratch",
                      "useUltragrainFlour"               : "Use Ultragrain 100% whole wheat flour",
                      "useUltragrainWhiteFlour"          : "Use Ultragrain T2% whole wheat flour",
                      "otherFlours"                      : "What other flours do you use? ",
                      "otherFlourIssues"                 : "Do you experience any issues with the flours? ",
                      "addedPastItemsToMenu"             : "Added previous items to menu",
                      "pastItemsAddedToMenu"             : "Past items added to menu",
                      "lookForUltragrain"                : "Look for 'Ultragrain' when trying new foods",
                      "participateWaivers"              : "Waiver programs participated in",
                      "participateWaiversItems"         : "Waiver programs for items",

                      "pastParticipant"                  : "Previous Participant",
                      "doNotReceiveAdditionalInformation": "Opted out of additional information",
                      "didNotReceiveMailing"             : "Did not receive mailing",
                      "notes"                            : "Operator Comments"]

        for (prod in prods) {
            if (!prod.parent) {
                labels."${prod.name}" = prod.name
            }
        }

        println("After prods.each 2 - ${new Date().time - startTime}")

        def bar = "order.shippingDate"
        labels."${bar}" = "Req'd Ship Date"

        if (withAssessments) {
            def assessFields = []
            def assessLabels = [:]

            assessLabels.programFeedback = "General Feedback"
            assessLabels.addedPastItemsToMenuA = "Added any of the items sampled to menu"
            assessLabels.overallPerceptions = "Overall Perceptions"
            assessLabels.assessmentOrigin = "Assessment Origin"

            assessFields << "programFeedback"
            assessFields << "addedPastItemsToMenuA"
            assessFields << "overallPerceptions"
            assessFields << "assessmentOrigin"

            for (prod in prods) {
                if (!Product.findByParent(prod)) {
                    assessFields << "${prod.name}_Q1"
                    assessFields << "${prod.name}_Q2"
                    assessFields << "${prod.name}_Q3"

                    assessLabels."${prod.name}_Q1" = "Interest in ${prod.name}"
                    assessLabels."${prod.name}_Q2" = "${prod.name} Like Comments"
                    assessLabels."${prod.name}_Q3" = "${prod.name} Change Comment"

                    /*if(prod.id == 23) {
                      assessFields << "${prod.name}_Q4"
                      assessLabels."${prod.name}_Q4" = "${prod.name} Favorite Pasta"
                    }*/
                }
            }

            println("After prods.each 3 - ${new Date().time - startTime}")
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

        def fileName = "SK_Customers-${exDate}.csv"


        response.setHeader "Content-disposition", "attachment; filename=${fileName}"
        response.contentType = 'text/csv'
        exportService.export('csv', response.outputStream, thatWhichIsContainedInOurExportation, fields, labels, formatters, parameters)
        response.outputStream.flush()
    }

    def exportCalls = {
        println "Exporing Calls..."
        def startTime = new Date().time

        def calls = []

        Call.list(sort: "dateCreated").each { call ->
            if (!call?.customer?.deleted) {

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

        println("After Calls.list - ${new Date().time - startTime}")

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
        println("After export - ${new Date().time - startTime}")
    }

    def exportDNRCustomers = {
        println "Exporting DNR Customers...."
        def startTime = new Date().time

        def customers = []

        def c = Customer.createCriteria()

        c.list(sort: "seq") {
            eq 'didNotReceiveMailing', true
        }.each { customer ->
            if (!customer.deleted) {
                def m = [:]
                m.id = customer.id
                m.district = customer?.district
                m.fsdName = customer?.fsdName
                m.email = customer?.email
                m.address = customer?.address

                customers << m
            }
        }

        println("After Customers.list - ${new Date().time - startTime}")

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
        println("After export - ${new Date().time - startTime}")
    }

    def exportPotentialParticipants = {
        println "Exporting Potential Paticipants Customers...."

        def customers = []

        def c = Customer.createCriteria()

        c.list(sort: "seq") {
            eq 'duplicate', false
            eq 'invalidEmail', false
            eq 'deleted', false
            eq 'hasPlacedCurrentOrder', false
            eq 'hasCompletedCurrentAssessment', false
            lastCall {
                not { eq('result', CallResult.REFUSED) }
                not { eq('result', CallResult.NOT_QUALIFIED) }
                not { eq('result', CallResult.QUALIFIED) }
            }
        }.each { customer ->
            def m = [:]
            m.id = customer.id
            m.top = customer.topCustomer
            m.district = customer?.district
            m.fsdName = customer?.fsdName
            m.email = customer?.email
            m.address = customer?.address


            customers << m

        }

        List fields = ["id", "top", "district", "fsdName", "email", "address"]

        Map labels = ["id": "Id", "top": "Top 100", "district": "School District", "fsdName": "FSD", "email": "Email", "address": "Address"]

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
