package com.superkids

import com.superkids.domain.*

class DataService {

    static transactional = true

    def springSecurityService

    def importCustomers(file) {
		def i = 0
		def is = file.inputStream
                def userRole = Role.findByAuthority("ROLE_USER")
		new ExcelBuilder(is).eachLine([labels:true]) {
			i++
			println "Customer ${i} - ${School_District}"

               def customer = new Customer()
			customer.with {
				district = School_District
				address = new Address(street: Address, street2:Address_2, city:City, state:State, zip:Zip)
				deliveryAddress = new Address(street:Delivery_Address, street2:Delivery_Address_2, city:Deliver_City, state:Delivery_State, zip:Delivery_Zip)
				status = CustomerStatus.HAS_NOT_ORDERED
				phone = Phone
				fax = Fax
				fsdName = FSD_Name
				fsdTitle = FSD_Title
				studentsInDistrict = Students_in_District ? Students_in_District.toInteger() : 0
				facilities = Facilities ? Facilities : 0
				breakfastsServed = Breakfasts_Served ? Breakfasts_Served : 0
				lunchesServed = Lunches_Served ? Lunches_Served : 0
				snacksServed = Snacks_Served ? Snacks_Served : 0
				hasBakery = Make_our_own_bread_products == 'YES' ? true : false
				purchaseFrozenBread = Purchase_frozen_bread_products == 'YES' ? true : false
				purchaseFreshBread = Purchase_fresh_bread_products == 'YES' ? true : false
				purchasePreparedFood = Purchase_prepared_foods == 'YES' ? true : false
				purchaseFrozenFood = Purchase_frozen_foods == 'YES' ? true : false
				topCustomer = (Top_100 && Top_100 != '')
			}
                        def no = "0"
                        customer.password = springSecurityService.encodePassword("superkids")
                        if(Email){
                            customer.username = Email
                            customer.fsdEmail = Email
                            customer.email = Email
                        } else {
                           customer.username = "no-email@no-email${i}.com"
                           customer.email = "no-email@no-email${i}.com"
                           customer.fsdEmail = "no-email@no-email${i}.com"
                        }
			if (!customer.save()) {
				customer.errors.each {println it}
			}
                        UserRole.create customer, userRole, true
                        customer.enabled = true
                        customer.accountExpired = false
                        customer.accountLocked = false
                        customer.passwordExpired = false
		}
	}
}
