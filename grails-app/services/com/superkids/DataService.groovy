package com.superkids

import com.superkids.domain.*

class DataService {

    static transactional = true

    def springSecurityService

    def importCustomers(file) {
		def i = 0
		def is = file.inputStream
		new ExcelBuilder(is).eachLine([labels:true]) {
            println "Loading row $i..."
			i++

            def yo
            50000000.each { no -> yo = cell(no) ? yo + "; ${cell(no)}" : yo }
            println yo

            def customer = new Customer()
            println "email " + cell(14)

			customer.with {
//(0)
                seq= cell(1)
                topCustomer = (cell(2) == 'TOP 100')
                source = cell(3)
                fsdName = cell(4) ?: " "
                fsdTitle = cell(5)
                district = cell(6) ?: "[none given]"
				address = new Address(
                        street: cell(7) ?: " ",
                        street2: cell(8) ?: " ",
                        city: cell(9) ?: " ",
                        state: cell(10) ?: " ",
                        zip: cell(11) ?: " ")
                phone = cell(12)
                fax = cell(13) ?: " "
                if(!cell(14) || Customer.findByUsername(cell(14))){
                    customer.username = "no-email@no-email0${i}.com"
                    customer.email = "no-email@no-email0${i}.com"
                } else {
                    customer.username = cell(14)
                    customer.email = cell(14)
                }

                deliveryAddress = new Address(street: cell(15) ?: " ", street2: cell(16) ?: " ", city: cell(17) ?: " ", state: cell(18) ?: " ", zip: cell(19) ?: " ")

                status = CustomerStatus.HAS_NOT_ORDERED

				studentsInDistrict = cell(20) ?: 0
				studentsParticipate = cell(21) ?: 0
				lookForAlliance = (cell(22) == "YES")
				hasBakery = (cell(23) == "YES") ? true : null
                coOpMember = (cell(24) == 'YES') ? true : null

                contractManaged = (cell(25) == 'YES') ? true : null
                contractManager = cell(26) ?: ""
                otherComments = cell(27) ?: ""
                pastParticipant = (cell(28) == 'YES') ? true : null
                callerBrokers = cell(29) ?: ""
				//timezone = cell(30) ?: " "

			}
			customer.password = springSecurityService.encodePassword("superkids")
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



}
