package com.superkids.domain

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import com.superkids.domain.Customer
import com.superkids.domain.CustomerOrder

class ReportController {

    def exportService

    def index = { }

    def exportCustomers = {
        response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
        response.setHeader("Content-disposition", "attachment; filename=SK_Customers.xls")

        List fields = ["id", "lastUpdated", "fsdName", "fsdTitle", "district", "address.street", "address.street2", "address.city", "address.state", "address.zip", "phone", "fax", "email", "deliveryAddress.street", "deliveryAddress.street2", "deliveryAdress.city", "deliveryAddress.state", "deliveryAddress.zip", "studentsInDistrict", "facilities", "breakfastsServed", "lunchesServed", "snacksServed", "hasBakery", "purchaseFrozenBread", "purchasePreparedFood", "purchaseFrozenFood", "purchaseFreshBread", "otherComments", "order.shippingDate"]

        Map labels = ["id": "Id", "lastUpdated": "Last Updated", "fsdName": "FSD_Name", "fsdTitle": "FSD_Title", "district": "School_District", "address.street": "Address", "address.street2": "Address_2", "address.city": "City", "address.state": "State", "address.zip": "Zip", "phone": "Phone", "fax": "Fax", "email": "Email", "deliveryAddress.street": "Delivery_Address", "deliveryAddress.street2": "Delivery_Address_2", "deliveryAdress.city": "Delivery_City", "deliveryAddress.state": "Delivery_State", "deliveryAddress.zip": "Delivery_Zip", "studentsInDistrict": "Students_in_District", "facilities": "Facilities", "breakfastsServed": "Breakfasts_Served", "lunchesServed": "Lunches_Served", "snacksServed": "Snacks_Served", "hasBakery": "Make_our_own_bread_products", "purchaseFrozenBread": "Purchase_frozen_bread_products", "purchasePreparedFood": "Purchase_prepared_foods", "purchaseFrozenFood": "Purchase_frozen_foods", "purchaseFreshBread": "Purchase_fresh_bread_products", "otherComments": "Other", "order.shippingDate": "Req'd Ship Date"]

        def upperCase = { domain, value ->
            return value.toUpperCase()
        }

        Map formatters = [:]		
        Map parameters = [title: "SK_Customers"]

        def report = exportService.export(params.format, response.outputStream, Customer.list(params), fields, labels, formatters, parameters)
        response.contentLength = report.size()
        response.outputStream.write(report)
        redirect controller:"customer", action:"list"
    }
}

/*Fields from spreadsheet

Top_100
Participated in 2006-2007
Participated in 2007-2008
Participated in 2008-2009
Participated in 2009-2010
Id
Last Updated
FSD_Name
FSD_Title
School_District
Address
Address_2
City
State
Zip
Phone
Fax
Email
Delivery_Address
Delivery_Address_2
Delivery_City
Delivery_State
Delivery_Zip
Students_in_District
Facilities
Breakfasts_Served
Lunches_Served
Snacks_Served
Make_our_own_bread_products
Purchase_frozen_bread_products
Purchase_prepared_foods
Purchase_frozen_foods
Purchase_fresh_bread_products
Other


Field per product


Req'd Ship Date
*/
