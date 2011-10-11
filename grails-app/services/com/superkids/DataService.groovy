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
			println "    ${i}: ${cell(7)}"
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
				district = cell(7) ?: null
				address = new Address(street: cell(8) ?: " ", street2: cell(9) ?: " ", city: cell(10) ?: " ", state: cell(11) ?: " ", zip: cell(12) ?: " ")
				deliveryAddress = new Address(street: cell(16) ?: " ", street2: cell(17) ?: " ", city: cell(18) ?: " ", state: cell(19) ?: " ", zip: cell(20) ?: " ")
				status = CustomerStatus.HAS_NOT_ORDERED
				source = cell(0)
				phone = cell(13)
				fax = cell(14) ?: " "
				fsdName = cell(5) ?: " "
				fsdTitle = cell(6)
				studentsInDistrict = cell(21) ?: 0
				facilities = cell(22) ?: 0
				breakfastsServed = cell(23) ?: 0
				lunchesServed = cell(24) ?: 0
				snacksServed = cell(25) ?: 0
				hasBakery = (cell(26) == "Yes")
				purchaseFrozenBread = (cell(27) == "Yes")
				purchaseFreshBread = (cell(30) == "Yes")
				purchasePreparedFood = (cell(29) == "Yes")
				purchaseFrozenFood = (cell(29) == "Yes")
				otherComments = cell(34) ?: ""
				topCustomer = cell(3) ? true : false
				timezone = ""
				pastParticipant = (cell(35) == 'Yes')
				seq = cell(2)
				callerBrokers = cell(33) ?: ""
			}
			def no = "0"
			customer.password = springSecurityService.encodePassword("superkids")
			if(!cell(15) || Customer.findByUsername(cell(15))){
				customer.username = "no-email@no-email${i}.com"
				customer.email = "no-email@no-email${i}.com"
			} else {
				customer.username = cell(15)
				customer.email = cell(15)
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
					def order = customer.order

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



}
