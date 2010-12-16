package com.superkids

import com.superkids.domain.*

class DataService {

    static transactional = true

    def springSecurityService

    def importCustomers(file) {
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
			i++
			println "    ${i}: ${School_District}"
                        println " "
                        /*def bar = []
                        for(o in 0..36) {
                            println "it is ${o}"
                            if(cell(o)){
                                println "here it is: ${cell(o)}"
                                bar << "${o}: ${cell(o)}, "
                            }
                        }
                        println "    Here is the full line: ${bar}"
                        println " "
                        println " "*/

               def customer = new Customer()
			customer.with {
				district = School_District ?: null
				address = new Address(street: Address_1 ?: " ", street2:Address_2 ?: " ", city:City ?: " ", state:State ?: " ", zip:Zip ?: " ")
				deliveryAddress = new Address(street:Delivery_Address ?: " ", street2:Delivery_Address_2 ?: " ", city:Deliver_City ?: " ", state:Delivery_State ?: " ", zip:Delivery_Zip ?: " ")
				status = CustomerStatus.HAS_NOT_ORDERED
				phone = Phone
				fax = Fax ?: " "
				fsdName = Name ?: " "
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
				topCustomer = (Top_100 == 'Yes' ? true : false)
				timezone = cell(34) ?: ""
				pastParticipant = cell(35) == 'Yes' ? true : false
				seq = cell(2)
				callerBrokers = Who_are_your_primary_foodservice_distributors ?: ""
			}
			def no = "0"
			customer.password = springSecurityService.encodePassword("superkids")
			if(!FSD_Email || Customer.findByUsername(FSD_Email)){
				customer.username = "no-email@no-email${i}.com"
				customer.email = "no-email@no-email${i}.com"
			} else {
				customer.username = FSD_Email
				customer.email = FSD_Email
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
			UserRole.create customer, userRole, true
		}
	}

        def markEmailsInvalid(file) {
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
		i++
		println "    ${i}: ${School_District}"
			println " "
			def customer = Customer.get(${Id})
			if(customer){
				customer.invalidEmail = true
				customer.save(failOnError:true)
			}
		}
	}


	def processDNRUpdate(file) {
		println "in processDNRUpdate"
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
			i++
			println "cell"
			println cell(0)
			def customer = Customer.get(cell(0))
			if(customer) {
				println customer?.district
				println "setting DNRMailing..."
				customer.didNotReceiveMailing = false

				customer.save(flush:true)
				println "saved the customer"
				println customer.didNotReceiveMailing
			}
		}
	 }


	def addFSDTitles(file) {
		println "in addFSDTitles"
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
			i++
			println "cell 5 & 6"
			println cell(5)
			println cell(6)
			if(cell(5)) {
				if(Customer.findByFsdName(cell(5))) {
					def customer = Customer.findByFsdName(cell(5))
					println customer?.fsdName
					println "setting fsdTitle..."
					customer.fsdTitle = cell(6)

					customer.save(flush:true)
					println "saved the customer"
					println customer.fsdTitle
				}
			}
		}
	}


}
