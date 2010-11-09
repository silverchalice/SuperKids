package com.superkids

import com.superkids.domain.*
import com.superkids.domain.UserRole


class DataService {

    static transactional = true

    def springSecurityService

    def importCustomers(file) {
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
			i++
			println "Customer ${i} - ${School_District}"

               def customer = new Customer()
			customer.with {
				district = School_District ?: null
				address = new Address(street: Address_1 ?: " ", street2:Address_2 ?: " ", city:City ?: " ", state:State ?: " ", zip:Zip ?: " ")
				deliveryAddress = new Address(street:Delivery_Address ?: " ", street2:Delivery_Address_2 ?: " ", city:Deliver_City ?: " ", state:Delivery_State ?: " ", zip:Delivery_Zip ?: " ")
				status = CustomerStatus.HAS_NOT_ORDERED
				phone = Phone
				fax = Fax ?: " "
				fsdName = FSD_Name ?: " "
				fsdTitle = FSD_Title
				studentsInDistrict = Q1_No_of_Students_in_District ?: 0
				facilities = Facilities ? Q2_No_of_Facilities : 0
				breakfastsServed = Q3_No_of_Breakfasts_Served ? Q3_No_of_Breakfasts_Served : 0
				lunchesServed = Q4_of_Lunches_Served ? Q4_of_Lunches_Served : 0
				snacksServed = Q5_No_of_Snacks_Served ? Q5_No_of_Snacks_Served : 0
				hasBakery = Q6a_Make_our_own_bread_products_from_scratch == 'Yes' ? true : false
				purchaseFrozenBread = Q6b_Purchase_frozen_bread_products_or_bread_mixes_and_bake_them == 'Yes' ? true : false
				purchaseFreshBread = Q6e_Purchase_fresh_bakery_and_bread_products == 'Yes' ? true : false
				purchasePreparedFood = Purchase_prepared_foods == 'Yes' ? true : false
				purchaseFrozenFood = Purchase_frozen_foods == 'Yes' ? true : false
                                otherComments = Q7_Other ?: ""
				topCustomer = (Top_100 && Top_100 != '')
			}
                        def no = "0"
                        customer.password = springSecurityService.encodePassword("superkids")
                        if(FSD_Email && !Customer.findByUsername(FSD_Email)){
                            customer.username = FSD_Email
                            customer.fsdEmail = FSD_Email
                            customer.email = FSD_Email
                        } else {
                           customer.username = "no-email@no-email${i}.com"
                           customer.email = "no-email@no-email${i}.com"
                           customer.fsdEmail = "no-email@no-email${i}.com"
                        }
                        customer.enabled = true
                        customer.accountExpired = false
                        customer.accountLocked = false
                        customer.passwordExpired = false
			if (!customer.save()) {
				customer.errors.each {println it}
			}
                        def userRole = Role.findByAuthority("ROLE_USER")
                        if(!userRole){
                            userRole = new Role(authority:"ROLE_USER").save(failOnError:true)
                        }
                        println "the customer is " + customer + ", and the role is " + userRole
                        UserRole.create customer, userRole, true
		}
	}
}
