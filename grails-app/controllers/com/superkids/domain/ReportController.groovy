package com.superkids.domain

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import com.superkids.domain.Customer
import com.superkids.domain.CustomerOrder
import com.superkids.domain.Product

class ReportController {

    def exportService

    def index = { }

    def exportCustomers = {

        def thatWhichIsContainedInOurExportation = []

        def prods = Product.list()

        Customer.list().each { customer ->
            def productIds = customer.order?.products.collect{customer.id}
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
            m.purchaseFrozenBread =  customer.purchaseFrozenBread ? "YES" : "NO"
            m.purchasePreparedFood = customer.purchasePreparedFood ? "YES" : "NO"
            m.purchaseFrozenFood = customer.purchaseFrozenFood ? "YES" : "NO"
            m.purchaseFreshBread = customer.purchaseFreshBread ? "YES" : "NO"
            m.otherComments = customer.otherComments
            def order  = customer.order
            prods.each{prod ->
                m."${prod.name}" = order?.products.find{it.id == prod.id} ? "Ordered : " + order.orderType : ''
            }
            m.order = new Expando()
            m.order.shippingDate = customer.order?.shippingDate
            println m
            thatWhichIsContainedInOurExportation << m
        }

        List fields = ["id", "lastUpdated", "fsdName", "fsdTitle", "district", "address.street", "address.street2", "address.city", "address.state", "address.zip", "phone", "fax", "email", "deliveryAddress.street", "deliveryAddress.street2", "deliveryAddress.city", "deliveryAddress.state", "deliveryAddress.zip", "studentsInDistrict", "facilities", "breakfastsServed", "lunchesServed", "snacksServed", "hasBakery", "purchaseFrozenBread", "purchasePreparedFood", "purchaseFrozenFood", "purchaseFreshBread", "otherComments"]

        prods.each{prod ->
            def foo = prod.name
            fields << foo
        }

        fields << "order.shippingDate"

        Map labels = ["id": "Id", "lastUpdated": "Last Updated", "fsdName": "FSD Name", "fsdTitle": "FSD Title", "district": "School District", "address.street": "Address", "address.street2": "Address 2", "address.city": "City", "address.state": "State", "address.zip": "Zip", "phone": "Phone", "fax": "Fax", "email": "Email", "deliveryAddress.street": "Delivery Address", "deliveryAddress.street2": "Delivery Address 2", "deliveryAddress.city": "Delivery City", "deliveryAddress.state": "Delivery State", "deliveryAddress.zip": "Delivery Zip", "studentsInDistrict": "Students in District", "facilities": "Facilities", "breakfastsServed": "Breakfasts Served", "lunchesServed": "Lunches Served", "snacksServed": "Snacks Served", "hasBakery": "Make our own bread products", "purchaseFrozenBread": "Purchase frozen bread products", "purchasePreparedFood": "Purchase prepared foods", "purchaseFrozenFood": "Purchase frozen foods", "purchaseFreshBread": "Purchase fresh bread products", "otherComments": "Other"]

        prods.each{prod ->
            labels."${prod.name}" = prod.name
        }

        def bar = "order.shippingDate"
        labels."${bar}" = "Req'd Ship Date"

        def upperCase = { domain, value ->
            return value.toUpperCase()
        }

        Map formatters = [:]		
        Map parameters = [:]


        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Customers.xls")

        exportService.export(params.format, response.outputStream, thatWhichIsContainedInOurExportation, fields, labels, formatters, parameters)
    }
}
