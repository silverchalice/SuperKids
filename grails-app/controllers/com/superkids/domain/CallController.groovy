package com.superkids.domain

import com.superkids.domain.CustomerStatus
import java.text.SimpleDateFormat

class CallController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	def callService
	
    def index = {
        [ caller: springSecurityService.principal ]
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [callInstanceList: Call.list(params), callInstanceTotal: Call.count()]
    }

    def create = {
        def callInstance = new Call()
        callInstance.properties = params
        return [callInstance: callInstance]
    }

    def save_order_call = {
		println "In Save_"
		println params

        def customer = Customer.get(params.id)

		if(customer) {
			println 'Got the customer...' + customer.district
			customer.properties = params

			if(customer.save(flush:true)){

				def call = new Call(params)
				def caller = Caller.get(springSecurityService.principal.id)

				call.caller = caller
				call.customer = customer

				caller.addToCalls(call)
				caller.save(flush:true)

				if(call.result == CallResult.QUALIFIED) {
					println "Call Result was QUALIFIED - saving order..."
					def order = new CustomerOrder(params['order'])
					order.orderType = OrderType.PHONE

					def shippingDate = ShippingDate.findByShipDate(params.shippingDate)

					order.shippingDate = shippingDate
					order.customer = customer

					params.each { key, val ->
						if (key.size() > 5 && key[0..5] == 'order_' && val == 'on'){
							def productName = key[6..-1]
							def product = Product.findByName(productName)
							order.addToProducts(product)
						}
					}

					if(order.save()) {
						println "saved order " + order.customer.district
						customer.status = CustomerStatus.HAS_ORDERED
						customer.order = order
						println 'Saved the customer'
					} else {
						println "order did not save"
						order.errors.allErrors.each { println it }
						flash.message = "Invalid Order - please check input"
						render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, queue: 'true']
					}
				} else {
					println "Call Result was " + call.result

					if(params.result != 'null') {
						call.result = CallResult.valueOf(params.result)
					}
				}

				call.save(flush:true)
				customer.inCall = null
				customer.save(flush:true)
				redirect action: 'next_order_call', id: customer.id
			}
		} else {
			println "we didn't get anything?"
			flash.message = "Customer not found"
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, queue: 'true']
		}

    }

    def show = {
        def callInstance = Call.get(params.id)
        if (!callInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ callInstance: callInstance ]
        }
    }

    def edit = {
        def callInstance = Call.get(params.id)
        if (!callInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [callInstance: callInstance]
        }
    }

    def update = {
        def callInstance = Call.get(params.id)
        if (callInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (callInstance.version > version) {
                    
                    callInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'call.label', default: 'Call')] as Object[], "Another user has updated this Call while you were editing")
                    render(view: "edit", model: [callInstance: callInstance])
                    return
                }
            }
            callInstance.properties = params
            if (!callInstance.hasErrors() && callInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'call.label', default: 'Call'), callInstance.id])}"
                redirect(action: "show", id: callInstance.id)
            }
            else {
                render(view: "edit", model: [callInstance: callInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def callInstance = Call.get(params.id)
        if (callInstance) {
            try {
                callInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
            redirect(action: "list")
        }
    }

	def start_order_call = {
		render view:'order_call_form', model: [products: Product.list()]
	}


	def next_order_call = {
		println "in next_Order_Call for CallController"
		println params

		//make sure the last customer is no longer 'in call'
		def currentCustomer = Customer.get(params?.id)
		if(currentCustomer) {
			currentCustomer.inCall = null
			currentCustomer.save(flush:true)
		}
		def order = new CustomerOrder()
		def call = new Call()

		println "About to create criteria"
		def c = Customer.createCriteria()

		//order calls are all customers with out a current order AND who are not being called atm
		def customer = c.list(max: 1, sort: 'id') {
			eq 'status', CustomerStatus.HAS_NOT_ORDERED
			isNull 'inCall'
			gt 'id', currentCustomer?.id
		}.getAt(0)

		if(customer) {
			customer.inCall = new Date()
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order, queue: 'true']
		} else {
			customer = Customer.findByStatusAndInCall(CustomerStatus.HAS_NOT_ORDERED, null)
			if(customer) {
				customer.inCall = new Date()
				customer.save(flush:true)
				render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order, queue: 'true']
			} else redirect action:index
		}
	}

	def prev_order_call = {
		println "in prev_Order_Call for CallController"
		println params

		//make sure the last customer is no longer 'in call'
		def currentCustomer = Customer.get(params.id)
		if(currentCustomer) {	
			currentCustomer.inCall = null
			currentCustomer.save(flush:true)
		}

		def order = new CustomerOrder()
		def call = new Call()

		//order calls are all customers with out a current order AND who are not being called atm
		def c = Customer.createCriteria()
		def customer = c.list(max: 1, sort: 'id', order:'desc') {
			eq 'status', CustomerStatus.HAS_NOT_ORDERED
			isNull 'inCall'
			lt 'id', currentCustomer.id
		}.getAt(0)

		if(customer) {
			customer.inCall = new Date()
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order, queue: 'true']
		} else {
			customer = Customer.findByStatusAndInCall(CustomerStatus.HAS_NOT_ORDERED, null)
			customer.inCall = new Date()
			customer.save(flush:true)
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order, queue: 'true']
		}
	}


	def get_order_call = {
		println "in Get_Order_Call for CallController"
		println params

		//make sure the last customer is no longer 'in call'
		def customer = Customer.get(params?.id)
		if(customer) {
			def order = new CustomerOrder()
			def call = new Call()

			customer.inCall = new Date()
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order]
		}
		else {
			redirect action:list
		}
	}

 	def next_assess_call = {
		println "in next_Assess_Call for CallController"
		println params

		//make sure the last customer is no longer 'in call'
		def currentCustomer = Customer.get(params?.id)
		if(currentCustomer) {
			currentCustomer.inCall = null
			currentCustomer.save(flush:true)
		}
		def order = new CustomerOrder()
		def call = new Call()

		println "About to create criteria"
		def c = Customer.createCriteria()

		//order calls are all customers with out a current order AND who are not being called atm
		def customer = c.list(max: 1, sort: 'id') {
			eq 'status', CustomerStatus.HAS_ORDERED
			isNull 'inCall'
			gt 'id', currentCustomer?.id
		}.getAt(0)

		if(customer) {
			customer.inCall = new Date()
			render view:'assess_call_form', model: [customerInstance: customer, call: call, order: order, queue: 'true']
		} else {
			customer = Customer.findByStatusAndInCall(CustomerStatus.HAS_ORDERED, null)
			if(customer) {
				customer.inCall = new Date()
				customer.save(flush:true)
				render view:'assess_call_form', model: [customerInstance: customer, call: call, order: order, queue: 'true']
			} else redirect action:index
		}
	}

	def prev_assess_call = {
		println "in prev_Assess_Call for CallController"
		println params

		//make sure the last customer is no longer 'in call'
		def currentCustomer = Customer.get(params.id)
		if(currentCustomer) {
			currentCustomer.inCall = null
			currentCustomer.save(flush:true)
		}

		def call = new Call()

		//order calls are all customers with out a current order AND who are not being called atm
		def c = Customer.createCriteria()
		def customer = c.list(max: 1, sort: 'id', order:'desc') {
			eq 'status', CustomerStatus.HAS_ORDERED
			isNull 'inCall'
			lt 'id', currentCustomer.id
		}.getAt(0)

		if(customer) {
			customer.inCall = new Date()
			render view:'assess_call_form', model: [customerInstance: customer, call: call, queue: 'true']
		} else {
			customer = Customer.findByStatusAndInCall(CustomerStatus.HAS_ORDERED, null)
			customer.inCall = new Date()
			customer.save(flush:true)
			render view:'assess_call_form', model: [customerInstance: customer, call: call, queue: 'true']
		}
	}

	def start_assess_call = {
		render view:'assess_call_form', model: [products: Product.list()]
	}


	def get_assess_call = {
		println "in Get_Assess_Call for CallController"
		println params

		//make sure the last customer is no longer 'in call'
		def customer = Customer.get(params?.id)
		if(customer) {
			def order = new CustomerOrder()
			def call = new Call()

			customer.inCall = new Date()
			render view:'assess_call_form', model: [customerInstance: customer, call: call, order: order]
		}
		else {
			redirect action:list
		}
	}



    def assess_list = {
		def max = params.max ?: 20
		def offset = params.offset ?: 0
		def customers = Customer.findAllByStatus(CustomerStatus.HAS_ORDERED, [max:max, offset:offset])

        [customerInstanceList:customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_ORDERED)]
   }

    def order_list = {
		def max = params.max ?: 20
		def offset = params.offset ?: 0
		def customers = Customer.findAllByStatus(CustomerStatus.HAS_NOT_ORDERED, [max:max, offset:offset])

        [customerInstanceList:customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_NOT_ORDERED)]

    }

    def call_back_list = {
        def customers = []
        Customer.list().each {
            if(it.status == CustomerStatus.CALL_AGAIN){
                customers << it
            }
        }
        [customerInstanceList:customers, customerInstanceTotal: customers.size()]

    }
	
}
