package com.superkids

class CallService {

	def springSecurityService

    static transactional = true

    def nextCustomerForOrderCall() {
		def caller = Caller.get(springSecurityService.principal.id)

		def customers = Customer.readyForOrder.list()

		lookupDueCallbacks(caller, customers)

    }
	
	
	def lookupDueCallbacks(caller, customers) {

		def callerCallbacks

	}
}
