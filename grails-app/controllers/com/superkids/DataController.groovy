package com.superkids

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

       def invalidEmail = {

       }

       def markEmail = {
           def file = request.getFile('cust_data')
           if (file && !file.isEmpty()){
               dataService.markEmailsInvalid(file)
	   } else {
               println "there was no file."
           }
       }

}
