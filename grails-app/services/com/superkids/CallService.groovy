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

    def saveOrderCall(call, customer, caller, order) {

      call.customer = customer
      call.caller = caller

      caller.addToCalls(call)
      customer.addToCalls(call)
      customer.addToOrders(order)

      customer.hasPlacedCurrentOrder = true
      customer.status = CustomerStatus.HAS_ORDERED


    }

}
