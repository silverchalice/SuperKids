package com.superkids

import com.superkids.domain.*

class DataService {

	static transactional = true

	def springSecurityService

	def importCustomers(file) {
		def i = 0
		def is = file.inputStream
		def role = Role.findByAuthority("ROLE_USER")
		new ExcelBuilder(is).eachLine([labels:true]) {
			println "Loading row $i..."
			i++

			def customer = Customer.findByUsername(cell(15))
			if(customer) {
				println "updating ${customer.username}"
			} else {
				customer = new Customer()
			}
			println "email " + cell(15)

			customer.with {
				doNotCall = (cell(0) == "x")
				customerRanking = rankingString(cell(2))
				source = cell(3)
				fsdName = cell(4) ?: " "
				fsdTitle = cell(5)
				district = cell(6) ?: "[none given]"
				address = new Address(
						street: cell(8) ?: " ",
						street2: cell(9) ?: " ",
						city: cell(10) ?: " ",
						state: cell(11) ?: " ",
						zip: cell(12) ?: " ")
				phone = cell(13)
				fax = cell(14) ?: " "
				if(!cell(15)){
					customer.username = "no-email@no-email0${i}.com"
					customer.email = "no-email@no-email0${i}.com"
				} else {
					customer.username = cell(15)
					customer.email = cell(15)
				}

				deliveryAddress = new Address(
						street: cell(16) ?: " ",
						street2: cell(17) ?: " ",
						city: cell(18) ?: " ",
						state: cell(19) ?: " ",
						zip: cell(20) ?: " ")

				status = CustomerStatus.HAS_NOT_ORDERED

				studentsInDistrict = cell(21) != 'NA' ? cell(21) : 0
				studentsParticipate = cell(22) != 'NA' ? cell(22) : 0
				studentsParticipateBreakfast =  cell(23) != 'NA' ? cell(23) : 0
				studentsParticipateLunch =  cell(24) != 'NA' ? cell(24) : 0
				studentsParticipateAfterSchool =  cell(25) != 'NA' ? cell(25) : 0
				callerBrokers = cell(26) ?: ""
				hasBakery = (cell(27) == "YES") ? true : (cell(27) == 'NO') ? false : null
				useUltragrainFlour = (cell(28) == "YES") ? true : (cell(28) == 'NO') ? false : null
				useUltragrainWhiteFlour = (cell(29) == "YES") ? true : (cell(29) == 'NO') ? false : null
				buyCommodityFlour = (cell(30) == "YES") ? true : null
				otherFlours = cell(31) ?: ""
				otherMixes = cell(32) ?: ""
				bakingChallenges = (cell(33) == "YES") ? true : null
				otherFlourIssues = (cell(34) == "YES") ? true : null

				addedPastItemsToMenu = (cell(35) == "YES") ? true : (cell(32) == 'NO') ? false : null
				pastItemsAddedToMenu = (cell(36)) ?: ""

				lookForUltragrain = (cell(37) == "YES") ? true : (cell(37) == 'NO') ? false : null
				participateWaivers = cell(38) ?: ""
				participateWaiversItems = cell(39) ?: ""
				pastParticipant = (cell(40) == "YES") ? true : (cell(40) == 'NO') ? false : null
				doNotReceiveAdditionalInformation = (cell(41) == "YES") ? true : null
				didNotReceiveMailing = (cell(42) == "YES") ? true : null
				otherComments = cell(43) ?: ""
				timezone = cell(44) ?: ""
			}


			if(customer.customerRanking == 6 || customer.customerRanking == 7) {
				println "DO NOT CALL $customer - ${customer.customerRanking}"
				customer.doNotCall = true
			}

			customer.password = springSecurityService.encodePassword("superkids")
			customer.enabled = true
			customer.accountExpired = false
			customer.accountLocked = false
			customer.passwordExpired = false
			if (!customer.save()) {
				customer.errors.each {println it}
			}

			if(!UserRole.findByUser(customer)) {
				UserRole.create(customer, role, true)
			}
		}
	}



	def updateTimezones(file) {
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
			println "Loading row $i..."
			i++

			def customer = Customer.findByEmail(cell(15))

			if(customer) {
				println "Got customer $customer! Updating timezone... ${cell(46)}"
				customer.timezone = cell(46)

				if(!customer.save(flush: true)) {
					customer.errors.allErrors.each { println it }
				}
			}

		}
	}


	def updateCustomerRanking(file) {
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
			println "Loading row $i..."
			i++

			def customer = Customer.findByEmail(cell(15))

			if(customer) {
				println "Got customer $customer! Updating customer ranking... ${cell(2)} (${rankingString(cell(2))})"
				customer.customerRanking = rankingString(cell(2))

				if(!customer.save(flush: true)) {
					customer.errors.allErrors.each { println it }
				}
			}

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

	def updateIncompleteOrders(file) {
		println "in updateIncompleteOrders"
		def i = 0
		def is = file.inputStream

		def dominoes = Product.get(14)
		//def sustagrain = Product.get(19)
		//def hotdogbuns = Product.get(17)
		//def ultragrainpasta = Product.get(23)

		new ExcelBuilder(is).eachLine([labels:true]) {
			i++
			if(cell(2)) {
				if(Customer.findByFsdName(cell(2))) {
					def customer = Customer.findByFsdName(cell(2))
					def order = customer.customerOrder

					println customer?.fsdName
					println cell(9)
					//println cell(10)
					//println cell(11)
					//println cell(12)


					if(order) {
						if(cell(9) == "x") {
							println "Adding Dominoes"
							order.addToProducts(new ProductOrder(product:dominoes, order:order))
							if(order.save()) removeOneNullProduct(order)
							order.products.each{
								println "$it.order with $it.product"
							}
						}
//						if(cell(10) == "X") {
//							println "Adding Sustagrain"
//							order.addToProducts(new ProductOrder(product:sustagrain, order:order))
//							if(order.save()) removeOneNullProduct(order)
//							order.products.each{
//								println "$it.order with $it.product"
//							}
//
//						}
//						if(cell(11) == "X") {
//							println "Adding Hot Dog Buns"
//							order.addToProducts(new ProductOrder(product:hotdogbuns, order:order))
//							if(order.save()) removeOneNullProduct(order)
//							order.products.each{
//								println "$it.order with $it.product"
//							}
//						}
//						if(cell(12) == "X") {
//							println "Adding Ultragrain Pasta"
//							order.addToProducts(new ProductOrder(product:ultragrainpasta, order:order))
//							if(order.save()) removeOneNullProduct(order)
//							order.products.each{
//								println "$it.order with $it.product"
//							}
//						}

						if(order.products.find {!it.product}) {
							println "still missing one product"
						} else {
							println "all products are accounted for"
							def iO = IncompleteOrder.findByCustomer(customer)
							if(iO) {
								iO.delete(flush: true)
								println "deleted IncompleteOrder"
							}

						}
					}
				}
			}
		}
	}

	def removeOneNullProduct(order) {
		println "in removeOneNullProduct for DataService"
		def nullPO = null
		order.products.each {
			if(!it.product && !nullPO) {
				println it
				nullPO = it
			}
		}
		if(nullPO) {
			order.removeFromProducts(nullPO)
			nullPO = null
			if(order.save()) {
				println "removed one null product"
			}
		}
	}


	def rankingString(String string) {
		println "${string}"

		switch (string) {
			case "Top 100":
				return 1
			case "20,000 - 49,000":
				return 2
			case "10,001 - 20,000":
				return 3
			case "10,000 - 19,999":
				return 4
			case "5,000 - 9,999":
				return 5
			case "3,000 - 4,999":
				return 6
			case "Under 3,000":
				return 7
			case "NA":
				return 8
			default:
				return null
		}


	}


}
