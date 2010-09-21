package com.superkids

import com.superkids.domain.*

class DataService {

    static transactional = true

    def importCustomers(file) {
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
			i++
			println "Customer ${i} - ${School_District}"

               def customer = new Customer()
			customer.with {
				district = School_District
				address = new Address(street: Address, street2:Address_2, city:City, state:State, zip:Zip)
				deliveryAddress = new Address(street:Delivery_Address, street2:Delivery_Address_2, city:Deliver_City, state:Delivery_State, zip:Delivery_Zip)
				email = Email
				Date dateCreated = new Date()
				status = CustomerStatus.HAS_NOT_ORDERED
				phone = Phone
				fax = Fax
				fsdName = FSD_Name
				fsdTitle = FSD_Title
				studentsInDistrict = Students_in_District ? Students_in_District.toInteger() : 0
				facilities = Facilities ? Facilities.toInteger() : 0
				breakfastsServed = Breakfasts_Served ? Breakfasts_Served.toInteger() : 0
				lunchesServed = Lunches_Served ? Lunches_Served.toInteger() : 0
				snacksServed = Snacks_Served ? Snacks_Served.toInteger() : 0
				bakesOwnBread = Make_our_own_bread_products == 'YES' ? true : false
				purchaseFrozenBread = Purchase_frozen_bread_products == 'YES' ? true : false
				purchaseFreshBread = Purchase_fresh_bread_products == 'YES' ? true : false
				purchasePreparedFood = Purchase_prepared_foods == 'YES' ? true : false
				purchaseFrozenFood = Purchase_frozen_foods == 'YES' ? true : false
				topCustomer = (Top_100 && Top_100 != '')
			}
			if (!customer.save()) {
				customer.errors.each {println it}
			}
		}
	}
}
