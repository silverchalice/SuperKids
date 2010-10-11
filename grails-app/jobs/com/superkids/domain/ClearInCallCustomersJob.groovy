package com.superkids.domain

class ClearInCallCustomersJob {

	static triggers = {
		simple name: 'mySimpleTrigger', startDelay: 2700000, repeatInterval: 2700000
	}

	def group = "MyGroup"

	def execute(){
		println "In ClearInCallCustomers job..."
		def hourOldDate = new Date(new Date().time - 2700000)
		def customers = Customer.findAllByInCallLessThan(hourOldDate)

		println "There are $customers.size customers in this list to be cleared..."
		customers.each { customer ->
			customer.inCall = null
			customer.save()
			println "$customer.district cleared"
		}
	}

/*    static triggers = {
   		cron name: 'clearInCall', cronExpression: "0 0/5 0 * * ?"
    }

    def execute() {
				println "In ClearInCallCustomers job..."
        def hourOldDate = new Date(new Date().time - 300000)
        def customers = Customer.findAllByInCallLessThan(hourOldDate)

		println "There are $customers.size() customers in this list to be cleared..."
        customers.each{customer ->
            customer.inCall = null
            customer.save()
			println "$customer.district cleared"
        }
    }*/
}
