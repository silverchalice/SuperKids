package com.superkids

import com.superkids.domain.*

class CallService {

	def springSecurityService

    static transactional = true

    def getNextCustomerForOrderCall() {
		def customerList = Customer.readyForOrder.list(max:1, sort:'district')
        def customer = Customer.get(customerList[0].id)

        customer.status = CustomerStatus.IN_CALL
        if (customer.save()) return customer   
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
