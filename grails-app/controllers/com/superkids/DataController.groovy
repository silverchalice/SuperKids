package com.superkids

import com.superkids.domain.Customer

class DataController {

    def dataService

    def index = { }
    
	def customerUpload = {
	
	}
	
	def loadCustomerData = {
	    def file = request.getFile('cust_data')
	    if (file && !file.isEmpty())
	        dataService.importCustomers(file)
	    redirect(controller:'customer', action:'list')
	}

	def customerDNRUpdate = {

	}

	def processDNRUpdate = {
		println "in processDNRUpdate for DataController"
	    def file = request.getFile('cust_data')
	    if (file && !file.isEmpty())
			println "about to call dataService"
	        dataService.processDNRUpdate(file)
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
