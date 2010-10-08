package com.superkids.domain

import com.superkids.domain.CustomerStatus
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.text.ParseException
import java.util.Date


class CallController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	def callService
	
    def index = {
        [ caller: springSecurityService.principal ]
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 23, 100)
        [callInstanceList: Call.list(params), callInstanceTotal: Call.count()]
    }

    def create = {
        def callInstance = new Call()
        callInstance.properties = params
        return [callInstance: callInstance]
    }

    def save_order_call = {
		println "In Save_Order_Call"
		params.each { key, val ->
			println "$key = $val"
		}

        def customer = Customer.get(params.id)

		if((!params.result) || (params.result == null ) || (params.result == 'null')) {
			println "CallResult of Null"
			customer.inCall = null
			redirect action: 'next_order_call', id: customer.id
			return
		}


		if(customer) {
			println 'Got the customer...' + customer.district
			customer.properties = params

			if(customer.save(flush:true)){
				println 'Saved the Customer...'

				def call = new Call(params)
				def caller = Caller.get(springSecurityService.principal.id)
				println "1"
				
				call.caller = caller
				call.customer = customer
				call.result = CallResult.valueOf(params.result)

				println call.result

				if(call.result == CallResult.CALLBACK) {
					println "CallResult of Callback"
					if(params.callbackDate) {
						println "We have a Callback..."
						DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
						call.callbackDate = df.parse(params.callbackDate);
						call.callbackTime = params.callbackTime
						println "Callback Date = " + df.format(call.callbackDate)
						println "Callback Time = ${call.callbackTime}"
					} else {
						println "no date..."
					}
				}
				println "2"
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

					if(order.save(flush:true)) {
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
				}
				println "3"
				customer.addToCalls(call)
				customer.save(flush:true)
				println "4"
				call.save()
				println 'Saved the Call...'

				caller.addToCalls(call)
				caller.save(flush:true)
				println 'Saved the Caller...'

				customer.inCall = null
				customer.lastCall = call
				customer.save(flush:true)
				println 'Saved the Customer...'
				
				redirect action: 'next_order_call', id: customer.id
			}  else {
				println "Could not save the Customer..."
				customer.errors.allErrors.each { println it }
				flash.message = 'invalid customer data'
				render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), queue: 'true']
			}
		} else {
			println "we didn't get anything?"
			flash.message = "Customer not found"
			redirect action:'next_order_call', id: params.id 
		}

    }

    def finish_call = {
		def customer = Customer.get(params.id)

		if(customer) {
			customer.inCall = null
		}

		redirect action:'index'


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
		render view:'order_call_form', model: [ products: Product.list() ]
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

		def customer = Customer.get(params?.id)
		if(customer) {
			def order = new CustomerOrder()
			def call = new Call()

			customer.inCall = new Date()
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order, single: true]
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
			render view:'assess_call_form', model: [customerInstance: customer, call: call, order: order, single: true]
		}
		else {
			redirect action:list
		}
	}


	def save_assess_call = {
		println "in Save_Assess_Call for CallController"
		params.each { key,val ->
			println "$key = $val"
		}
		def customer = Customer.get(params.id)
		def caller = Caller.get(springSecurityService.principal.id)

		if((!params.result) || (params.result == null ) || (params.result == 'null')) {
			println "CallResult of Null"
			customer.inCall = null
			redirect action: 'next_assess_call', id: customer.id
			return
		}

		if(customer) {
			println 'Got the customer...' + customer.district
			customer.properties = params

			if(customer.save(flush:true)){
				println 'Updated the Customer'
				def call = new Call(params)

				if(call.result == CallResult.CALLBACK) {
					if(params.callbackDate) {
						println "We have a Callback..."
						DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
						call.callbackDate = df.parse(params.callbackDate);
						call.callbackTime = params.callbackTime
						println "Callback Date = " + df.format(call.callbackDate)
						println "Callback Time = ${call.callbackTime}"
					} else {
						println "no date..."
					}
				}

				if(call.result == CallResult.QUALIFIED) {
					println "The CallResult was QUALIFIED - saving assessments"

					Products.list().each { product ->
						assessment."${product.name}".each { key, val ->
							println "$key = $val"
						}

						if(params.assessment."${product.name}") {
							def assessment = new Assessment(
									likeRating: params.assessment."${product.name}".likeRating,
									interestRating: params.assessment."${product.name}".interestRating,
									likeComment: params.assessment."${product.name}".likeComment,
									changeComment: params.assessment."${product.name}".changeComment,
									product: product,
									customer: customer,
							).save()
						}
					}
				}

				if(params.result != ('null' || null )) {
					call.result = CallResult.valueOf(params.result)
				}

				println "3"
				customer.addToCalls(call)
				customer.save(flush:true)
				println "4"
				call.save()
				println 'Saved the Call...'

				caller.addToCalls(call)
				caller.save(flush:true)
				println 'Saved the Caller...'

				customer.inCall = null
				customer.lastCall = call
				customer.save(flush:true)
				println 'Saved the Customer...'
				
				redirect action:'next_assess_call', id: customer.id
				                                        
			}
		}

		else {
			flash.message = "no customer"
			println flash.message
			redirect action:'index'
		}

	}

    def assess_list = {
		def max = params.max ?: 35
		def offset = params.offset ?: 0
		def customers = Customer.findAllByStatus(CustomerStatus.HAS_ORDERED, [max:max, offset:offset])

        [customerInstanceList:customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_ORDERED)]
   }

    def order_list = {
		def max = params.max ?: 35
		def offset = params.offset ?: 0
		def customers = Customer.findAllByStatus(CustomerStatus.HAS_NOT_ORDERED, [max:max, offset:offset])

        [customerInstanceList:customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_NOT_ORDERED)]
        [customerInstanceList:customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_NOT_ORDERED)]
		                              
    }

    def call_back_list = {
		def max = params.max ?: 35
		def offset = params.offset ?: 0

		println "About to create criteria"
		
		def customers = Customer.createCriteria().list{
			lastCall{
				eq('result', CallResult.CALLBACK)
			}
		}
	    println 'break'
		customers.sort{a, b ->
			if (a.lastCall.callbackDate == b.lastCall.callbackDate)
				return a.lastCall.caller.username <=> b.lastCall.caller.username
			else
				return a.lastCall.callbackDate <=> b.lastCall.callbackDate
		}

        [customerInstanceList:customers, customerInstanceTotal: customers.size(), caller: springSecurityService.principal]

    }


	def unlock_customer = {
		def customer = Customer.get(params.id)
		if(customer) {
			customer.inCall = null
			flash.message = "Customer unlocked"
			redirect action:"${params.type}_list"
		} else {
			redirect action:'index'
		}


	}

        def findCustomer = {
            if(params.query){
                def customers = Customer.search(params.query).results
                if(customers){
                    return [customerInstanceList:customers]
                } else {
                    flash.message = "No results found for \"${params.query}.\""
                    return
                }
            } else {
                flash.message = "Please enter a name or email to search for."
                if(session.currentAction){
                    redirect action: currentAction
                } else {
                    redirect action: "index"
                }
            }
        }
	
}
