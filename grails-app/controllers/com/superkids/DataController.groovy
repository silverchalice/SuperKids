package com.superkids

import com.superkids.domain.Customer
import com.superkids.domain.IncompleteOrder
import com.superkids.domain.Product
import com.superkids.domain.ProductOrder
import com.superkids.domain.Address

class DataController {

    def dataService

    def index = { }
    
	def customerUpload = {
	
	}

    def cleanupZips = {

        Address.list().each {

            if(it.zip.size() > 2) {
                if(it.zip[-2..-1] == '.0') {
                    it.zip = it.zip[0..-3]
                    it.save(flush:true)
                    println it.zip
                }
            }

        }

        redirect(uri: '/')
    }


	def updateIncompleteOrders = {
		println "in updateIncompleteOrders for DataController"
	    def file = request.getFile('cust_data')
	    if (file && !file.isEmpty())
			println "about to call dataService"
	        dataService.updateIncompleteOrders(file)
	    redirect(controller:'customer', action:'list')
	}

	def trimFields = {
	   Customer.list().each { customer ->
		  String fax = customer?.fax

		  def faxArray = fax?.split(',')


		  println "$customer.fsdName with old fax $customer.fax"
		  println "faxArray is $faxArray"

		  def tempFax = faxArray.find{it}
		  println "tempFax is $tempFax"

		  def students = customer?.studentsInDistrict?.split(',')
		  def tempStudents = students.find{it}
		   println "old students is $customer.studentsInDistrict"
		   println "tempStudents is $tempStudents"

		   customer.studentsInDistrict = tempStudents

		   customer.fax = tempFax




	   }
	}


	def repairIncompleteOrders = {


		def customers = Customer.findAllByDuplicate(false)

		def incomplete = []

		customers.each { c->

			if(c.customerOrder) {
				def total = 0

				c.customerOrder.products.each {
					if(!it.product) {
						total++
					}
				}

				if(total == 5) {
					println "this customer ordered all problem products"
					def order = c.customerOrder

					def toRemove = []

					order.products.each { pO ->
						if(!pO.product)
						  toRemove << pO
					}

					toRemove.each {
						order.removeFromProducts(it)
					}
					order.save()

					def p1 = new ProductOrder(order:order, product: Product.get(14))
					order.addToProducts(p1)
					println "saved first pO, product is $p1.product"

					def p2 = new ProductOrder(order:order, product: Product.get(17))
					order.addToProducts(p2)
					println "saved first po, product is $p2.product"

					def p3 = new ProductOrder(order:order, product: Product.get(19))
					order.addToProducts(p3)
					println "saved first po, product is $p3.product"

					def p4 = new ProductOrder(order:order, product: Product.get(20))
					order.addToProducts(p4)
					println "saved first pO, product is $p4.product"

					def p5 = new ProductOrder(order:order, product: Product.get(23))
					order.addToProducts(p5)
					println "saved first pO, product is $p5.product"

					order.save()

					println "saved order"

					c.save()

					println "saved customer"
				} else {
					println "this will be an incomplete order"

					def incompleteOrder = new IncompleteOrder(customer:c)
					if(incompleteOrder.save()){
						println "saved incomplete order for $c"
					}

				}
			}

		}
	}

	def loadCustomerData = {
	    def file = request.getFile('cust_data')
	    if (file && !file.isEmpty())
	        dataService.importCustomers(file)
	    redirect(controller:'customer', action:'list')
	}

	def processDNRUpdate = {
		println "in processDNRUpdate for DataController"
	    def file = request.getFile('cust_data')
	    if (file && !file.isEmpty())
			println "about to call dataService"
	        dataService.processDNRUpdate(file)
	    redirect(controller:'customer', action:'list')
	}

	def processFSDTitleUpdate = {
		println "in processFSDTitleUpdate for DataController"
	    def file = request.getFile('cust_data')
	    if (file && !file.isEmpty())
			println "about to call dataService"
	        dataService.addFSDTitles(file)
	    redirect(controller:'customer', action:'list')
	}


    def invalidEmail = { }

    def markEmail = {
	   def file = request.getFile('cust_data')
	   if (file && !file.isEmpty()){
		   dataService.markEmailsInvalid(file)
    } else {
		   println "there was no file."
	   }
    }

	def opNoteTransfer = {
		Customer.list().each { c ->
			if(c.notes && (c.notes)) {
				println "$c notes = $c.notes"
				c.opNotes = c.notes
				c.save(flush:true)
			}
		}

		flash.message = "Notes Transfered"
		println flash.message
		redirect controller: 'customer', action: 'list'
	}
}
