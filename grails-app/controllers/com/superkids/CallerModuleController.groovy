package com.superkids

import com.superkids.domain.*

class CallerModuleController {

	def springSecurityService

    def index = {
		[ caller: springSecurityService.principal ]
	 }

	def mockup = { }

	def start = {
		def caller = springSecurityService.principal

		def customerInstance = Customer.get(1)
		def callInstance = new Call(customer:customerInstance, caller:caller)

		[ customerInstance: customerInstance, callInstance: callInstance ]
	 }

	}
