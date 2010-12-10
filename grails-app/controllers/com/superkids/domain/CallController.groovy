package com.superkids.domain

import java.text.DateFormat
import java.text.SimpleDateFormat

class CallController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	def callService

	def states=['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
			  'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
			  'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
			  'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
			  'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
			  'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
			  'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
			  'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
			  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
			  'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']

    def timezones=['Alaskan', 'Pacific', 'Mountain', 'Central', 'Eastern']


    def index = {
        [ caller: springSecurityService.principal ]
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 24, 100)

        [callInstanceList: Call.list(params), callInstanceTotal: Call.count()]
    }

    def create = {
        def callInstance = new Call()
        callInstance.properties = params
        return [callInstance: callInstance]
    }

    def save_order_call = {

		def caller = Caller.get(springSecurityService.principal.id)
        def customer = Customer.get(params.id)

        def currentTimezone
        if(params?.timezone)
            currentTimezone = params?.timezone
        else
            currentTimezone = params?.currentTimezone



		if((!params.result) || (params.result == null ) || (params.result == 'null')) {
			println "CallResult of Null"
			customer.inCall = null
            if(params.single)  {
				if(params?.search == 'true') {
					println "This call was made from a search results page - redirecting back to results"
					def query = params?.query
					redirect action:'findCustomer', params: [query:query]
					return
				} else if(params?.cb) {
					println "This call was made from the Callback list - redirecting back to CB List"
					redirect action:'call_back_list'
					return
				} else if(params?.ocl) {
					println "This call was made from the Order Call list - redirecting back to OC List"
					redirect action:'order_list'
					return
				} else {
					redirect action: 'index', caller: springSecurityService.principal
					return
				}
			}
            else redirect action: 'next_order_call', id: customer.id, params: [currentTimezone: currentTimezone, queue: params?.queue]
			return
		}

		if(customer) {
			//customer.inCall = null
			println "$caller is saving order call for customer " + customer.fsdName
			customer.properties = params

			def user = User.get(params.id)
			user.username = params.email


			if(customer.save(flush:true) && user.save(flush:true)){

				def call = new Call(params)
				println "1"
				
				call.caller = caller
				call.customer = customer
				call.result = CallResult.valueOf(params.result)

				println "the call result from " + caller + "'s order call for customer " + customer + " was " + call.result

				if(call.result == CallResult.CALLBACK) {
					println "CallResult of Callback"
					if(params.callbackDate) {
						DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
						call.callbackDate = df.parse(params.callbackDate);
						call.callbackTime = params.callbackTime
					} else {
                    	println " "
					}
				} else if(call.result == CallResult.DUPLICATE) {
					println "$caller found a duplicate..."
					customer?.duplicate = true
					customer.save()
				} else if(call.result == CallResult.QUALIFIED) {
					println "Call Result for " + caller + "'s call with customer " + customer + " was QUALIFIED - saving order..."
					def order = new CustomerOrder(params['order'])
					order.orderType = OrderType.PHONE

					def shippingDate = ShippingDate.findByShipDate(params.shippingDate)

					order.shippingDate = shippingDate
					order.customer = customer

					params.each { key, val ->
						if (key.size() > 5 && key[0..5] == 'order_' && val == 'on'){
							def productName = key[6..-1]
							def product = Product.findByName(productName)
							def pOrder = new ProductOrder(product:product, order:order)
                            if(product){
                                if(Product.findAllByParent(product)) {
                                    def subProducts = Product.findAllByParent(product)

                                    subProducts.each { sp ->
                                        def po =  new ProductOrder(product:sp, order:order, received:true)
                                        order.addToProducts(po)
                                    }
                                }
		            }
							pOrder.save()
						}
					}

					if(order.save(flush:true)) {
						println "w00t! $caller saved order for customer " + order.customer.fsdName
						customer.status = CustomerStatus.HAS_ORDERED
						customer.order = order
					} else {
						println "oops... $caller had problems saving order for customer " + customer?.fsdName
						order.errors.allErrors.each { println it }
						flash.message = "Invalid Order - please check input"
						render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call,  queue: params?.queue, currentTimezone: currentTimezone]
					}
				} else {
					call.result = CallResult.valueOf(params.result)
				}

				println "3"
				customer.addToCalls(call)
				println "4"
				if(!customer.save(flush:true)) {
					customer.errors.allErrors.each {println it}
				}

				println "5"
				if(!call.save()) {
					customer.errors.allErrors.each {println it}
				}

				caller.addToCalls(call)
				caller.save(flush:true)

				customer.inCall = null
				customer.lastCall = call
				if(!customer.save(flush:true)) {
					customer.errors.allErrors.each {println it}
				}
				println "The customer's last call result is now $customer.lastCall.result"

				if(params?.single) {
					println "This is a non-queued call"
					if(params?.search) {
						println "$caller made this call from a search results page - redirecting back to results"
						def query = params?.query
						customer.inCall = null
						customer.save()
						redirect action:'findCustomer', params: [query:query]
						return
					} else if(params?.cb) {
						println "This call was made from the Callback list - redirecting back to CB List"
						customer.inCall = null
						customer.save()
						redirect action:'call_back_list'
						return
					} else if(params?.ocl) {
						customer.inCall = null
						customer.save()
						println "This call was made from the Order Call list - redirecting back to OC List"
						redirect action:'order_list'

						return
					}else {
						redirect action: 'index', caller: springSecurityService.principal
					}
				} else
					redirect action: 'next_order_call', id: customer.id, params: [currentTimezone: currentTimezone, queue: 'true']
			}  else {
				println "$caller could not save customer " + customer.fsdName

				if(customer.errors.getFieldError("username").code == "unique") {
					flash.message = 'Another Customer is already using this email address - this is probably a duplicate. If you are using a noemail@noemail.com address, please try adding some numbers to make the address unique'
				    println "$caller used a duplicate customer email for customer " + customer.fsdName
				} else {
					println "invalid customer data"
					flash.message = 'invalid customer data'
				}

				def model = [:]

				if(params?.single) {
					println "This is a non-queue call"
					if(params?.search) {
						println "$caller made this call from a search results page - storing the query before rendering"
						model = [customerInstance: customer, products: Product.list(), search: 'true', single:'true', query: params?.query, currentTimezone: currentTimezone]
					} else if(params?.cb) {
						println "This call was made from the Callback list - redirecting back to CB List"
						model = [customerInstance: customer, products: Product.list(), single:'true', cb: params?.cb, currentTimezone: currentTimezone]
					} else if(params?.ocl) {
						println "This call was made from the Order Call list - redirecting back to OC List"
						model = [customerInstance: customer, products: Product.list(), single:'true', olc: params?.ocl, currentTimezone: currentTimezone]
					} else {
						model = [customerInstance: customer, products: Product.list(), single: 'true', currentTimezone: currentTimezone]
					}
				}
				render view:'order_call_form', model: model
			}
		} else {
			flash.message = "Customer not found"
			redirect action: 'index', caller: springSecurityService.principal
		}

    }

    def finish_call = {
		def customer = Customer.get(params.id)

		if(customer) {
			customer.inCall = null
			customer.save(flush:true)
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

				 def customer = callInstance.customer
				 customer.removeFromCalls(callInstance)
				 def caller = callInstance.caller
				 caller.removeFromCalls(callInstance)

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

		render view:'order_call_form', model: [ products: Product.findAllByParentIsNull(), timezones: timezones, queue: params?.queue, start:'start' ]
	}


	def next_order_call = {
            def caller
            if(Caller.get(springSecurityService.principal.id))
                caller = Caller.get(springSecurityService.principal.id)
	    println "$caller is in next_order_call for CallController"
	    //make sure the last customer is no longer 'in call'
	    def currentCustomer = Customer.get(params?.id)

            Integer currentSeq
            Long currentId

		if(currentCustomer) {
			currentCustomer.inCall = null
			currentCustomer.save(flush:true)

            currentSeq = currentCustomer.seq
            currentId = currentCustomer.id

		} else {
              currentSeq = 1
              currentId =  1
        }
		def order = new CustomerOrder()
		def call = new Call()

        def currentTimezone
        if(params?.timezone)
            currentTimezone = params?.timezone
        else
            currentTimezone = params?.currentTimezone


		def c = Customer.createCriteria()
		def c2 = Customer.createCriteria()


        def oldDate = new Date() - 3
		//order calls are all customers with out a current order AND who are not being called atm
		def customer = c.list(sort: 'seq') {
            eq 'timezone', currentTimezone
			eq 'status', CustomerStatus.HAS_NOT_ORDERED
			isNull 'inCall'


			if(params?.queue == "new") {
				println "$caller is using the new calls queue"
				isNull "lastCall"
			} else {
				println "$caller is using the prev calls queue"
					lastCall {
						gt('dateCreated', oldDate )
						ne('result', CallResult.REFUSED)
					}
			}


			or{
				eq('duplicate', false)
				isNull('duplicate')
			}

		  or{
              and {
                  eq('seq', currentSeq)
                  gt('id', currentId)
              }
              gt('seq', currentSeq)
            }
          maxResults(1)
		}.getAt(0)

		if(customer) {
			customer.inCall = new Date()
			render view:'order_call_form', model: [customerInstance: customer, products: Product.findAllByParentIsNull(), call: call, order: order, queue: params?.queue, currentTimezone: currentTimezone]
		} else {
			customer = c2.list(max: 1, sort: 'seq') {
                eq 'timezone', currentTimezone
			    eq 'status', CustomerStatus.HAS_NOT_ORDERED
			    isNull 'inCall'
		    }.getAt(0)


			if(customer) {
				customer.inCall = new Date()
				customer.save(flush:true)
				render view:'order_call_form', model: [customerInstance: customer, products: Product.findAllByParentIsNull(), call: call, order: order, queue: params?.queue, currentTimezone: currentTimezone]
			} else {
                println "$caller reached the end of the customer list for timezone $currentTimezone"
				flash.message = "No more Customers in this Timezone!"
				redirect action:index
			}
		}
	}

	def prev_order_call = {
            def caller
            if(Caller.get(springSecurityService.principal.id))
                caller = Caller.get(springSecurityService.principal.id)
            println "$caller is in prev_order_call for CallController"


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
			render view:'order_call_form', model: [ customerInstance: customer, products: Product.list(), call: call, order: order, queue: 'true', timezone: params?.timezone ]
		} else {
			customer = Customer.findByStatusAndInCall(CustomerStatus.HAS_NOT_ORDERED, null)
			customer.inCall = new Date()
			customer.save(flush:true)
			render view:'order_call_form', model: [ customerInstance: customer, products: Product.list(), call: call, order: order, queue: 'true' ]
		}
	}


	def get_order_call = {
		def caller
		if(Caller.get(springSecurityService.principal.id))
		caller = Caller.get(springSecurityService.principal.id)
		println "$caller is in get_order_call for CallController"
		println params

		def customer = Customer.get(params?.id)

		if(customer) {
			def order = new CustomerOrder()
			def call = new Call()

			customer.inCall = new Date()

			def model = [:]

			if(params?.search) 	model = [ customerInstance: customer, products: Product.findAllByParentIsNull(), call: call, order: order, single: true, search: true, query: params?.query ]
			else if(params?.cb) model = [ customerInstance: customer, products: Product.findAllByParentIsNull(), call: call, order: order, single: true, cb: params?.cb ]
			else if(params?.ocl) model = [ customerInstance: customer, products: Product.findAllByParentIsNull(), call: call, order: order, single: true, ocl: params?.ocl ]
			else model = [ customerInstance: customer, products: Product.findAllByParentIsNull(), call: call, order: order, single: true ]

			render view:'order_call_form', model:  model

		}
		else {
			redirect action:list
		}
	}

 	def next_assess_call = {
            def caller
            if(Caller.get(springSecurityService.principal.id))
                caller = Caller.get(springSecurityService.principal.id)
		println "$caller is in next_assess_call for CallController"
       //make sure the last customer is no longer 'in call'
       def currentCustomer = Customer.get(params?.id)

       Integer currentSeq
       Long currentId

       if(currentCustomer) {
           currentCustomer.inCall = null
           currentCustomer.save(flush:true)

           currentSeq = currentCustomer.seq
           currentId = currentCustomer.id

       } else {
             currentSeq = 1
             currentId =  1
       }
       def order = new CustomerOrder()
       def call = new Call()

       def currentTimezone
       if(params?.timezone)
           currentTimezone = params?.timezone
       else
           currentTimezone = params?.currentTimezone

		def c = Customer.createCriteria()
		def c2 = Customer.createCriteria()

		//assess calls are all customers with a current order AND who are not being called atm
		def customer = c.list(sort: 'seq') {
            eq 'timezone', currentTimezone
			eq 'status', CustomerStatus.HAS_ORDERED
			isNull 'inCall'
			or {
				lastCall {
					lt('dateCreated', oldDate )
				}
				isNull('lastCall')

			}

			or {
				eq('duplicate', false)
				isNull('duplicate')
			}
		   or{
              and {
                  eq('seq', currentSeq)
                  gt('id', currentId)
              }
              gt('seq', currentSeq)
            }
          maxResults(1)
		}.getAt(0)

		if(customer) {
			customer.inCall = new Date()

			def broker = customer?.brokers?.getAt(0)
			def broker2 = customer?.brokers?.size() > 0 ? customer?.brokers[-1] : null


			render view:'assess_call_form', model: [ customerInstance: customer, call: call, order: order, queue: 'true', states: states, broker: broker, broker2: broker2, currentTimezone: currentTimezone ]
		} else {
            customer = c2.list(max: 1, sort: 'seq') {
                eq 'timezone', currentTimezone
                eq 'status', CustomerStatus.HAS_ORDERED
                isNull 'inCall'
            }.getAt(0)

			if(customer) {

                customer.inCall = new Date()
				customer.save(flush:true)


				def broker = customer?.brokers?.getAt(0)
				def broker2 = customer?.brokers?.size() > 0 ? customer?.brokers?.getAt(-1) : null
				render view:'assess_call_form', model: [ customerInstance: customer, call: call, order: order, queue: 'true', states: states, broker: broker, broker2: broker2, currentTimezone: currentTimezone ]
			} else redirect action:index
		}
	}

	def prev_assess_call = {
            def caller
            if(Caller.get(springSecurityService.principal.id))
                caller = Caller.get(springSecurityService.principal.id)
		println "$caller is in prev_assess_call for CallController"

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
		render view:'assess_call_form', model: [timezones: timezones ]
	}


	def get_assess_call = {
            def caller
            if(Caller.get(springSecurityService.principal.id))
                caller = Caller.get(springSecurityService.principal.id)
	    println "$caller is in get_assess_call for CallController"

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
		def caller
		if(Caller.get(springSecurityService.principal.id))
			caller = Caller.get(springSecurityService.principal.id)
		println "$caller is in save_assess_call for CallController"
		def customer = Customer.get(params.id)

        def currentTimezone
        if(params?.timezone)
            currentTimezone = params?.timezone
        else
            currentTimezone = params?.currentTimezone


		if((!params.result) || (params.result == null ) || (params.result == 'null')) {
			println caller + "'s call got a CallResult of Null"
			customer.inCall = null
			redirect action: 'next_assess_call', id: customer.id,  params: [currentTimezone: currentTimezone, queue: 'true']
			return
		}

		if(customer) {
			println "$caller is saving assess call for customer " + customer.fsdName
			customer.properties = params

			def broker1 = Broker.findByName(params.broker.name)
			if(!broker1)
				broker1 = new Broker(params['broker'])
			else if(params.broker.name)
				broker1.properties = params['broker']

 			def broker2 = Broker.findByName(params.broker2.name)
			if(!broker2)
				broker2 = new Broker(params['broker2'])
			else if(params.broker2.name)
				broker2.properties = params['broker2']
			
			customer.addToBrokers(broker1)
			customer.addToBrokers(broker2)

			if(customer.save(flush:true)){
				def call = new Call(params)
                                call.caller = caller
				call.customer = customer
				call.result = CallResult.valueOf(params.result)

                if(call.result == CallResult.CALLBACK ) {
                    println "$caller has a Callback..."
					if(params.callbackDate) {
						DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
						call.callbackDate = df.parse(params.callbackDate);
						call.callbackTime = params.callbackTime
					} else {
					}
				} else if(call.result == CallResult.QUALIFIED) {
					println "The CallResult for " + caller + "'s call with customer " + customer + " was QUALIFIED - saving assessments"

					Product.list(sort:'sortOrder').each { product ->

						if(params.assessment."${product.name}") {

							if(params.assessment."${product.name}".didNotReceive) {
								def po = ProductOrder.findByOrderAndProduct(customer.order, product)
								po.received = false
								po.save()
							}
							else {
								println "$caller is saving customer " + customer.fsdName + "'s assessment of " + product
								def assessment = new Assessment(
										likeRating: params.assessment."${product.name}".likeRating,
										iRating: params.assessment."${product.name}".interestRating,
										likeComment: params.assessment."${product.name}".likeComment,
										changeComment: params.assessment."${product.name}".changeComment,
										product: product,
                                        type: OrderType.PHONE

								)

                                if(assessment.likeRating && assessment.iRating && assessment.likeComment && assessment.changeComment) {
                                    assessment.completed = true
                                }


								customer.addToAssessments(assessment)
								customer.status = CustomerStatus.QUALIFIED
                                customer.hasCompletedCurrentAssessment = true

								if (!customer.save()) {
									println "$caller had errors saving customer " + customer.fsdName + "'s assessment of " + product
									customer.errors.allErrors.each{println it}
                                    flash.message = "Error saving the Assessment"
                                    redirect action:index
								}
							}
						}
					}
				} else if(params.result != ('null' || null )) {
					call.result = CallResult.valueOf(params.result)
				}

				if(call.result == CallResult.DUPLICATE) {
					println "$caller had a CallResult of Duplicate"
					customer?.duplicate = true
				}

				println "3"
				customer.addToCalls(call)
				customer.save(flush:true)
				println "4"

				caller.addToCalls(call)
				caller.save(flush:true)

				customer.inCall = null
				customer.lastCall = call

				customer.save(flush:true)

				if(params?.single)
					redirect action: 'index', caller: springSecurityService.principal
				else
					redirect action: 'next_assess_call', id: customer.id, params: [currentTimezone: currentTimezone, queue: 'true']
			}
		}

		else {
			flash.message = "no customer"
			redirect action:'index'
		}

	}

    def assess_list = {
		def max = params.max ?: 35
		def offset = params.offset ?: 0
        def sort = params.sort ?: "seq"
		def customers = Customer.findAllByStatus(CustomerStatus.HAS_ORDERED, [max:max, offset:offset, sort: sort])

        [customerInstanceList:customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_ORDERED)]
   }

    def order_list = {
		def max = params.max ?: 35
		def offset = params.offset ?: 0
        def sort = params.sort ?: "seq"
		def customers = Customer.findAllByStatus(CustomerStatus.HAS_NOT_ORDERED, [max:max, offset:offset, sort:sort])

        [customerInstanceList:customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_NOT_ORDERED)]
        [customerInstanceList:customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_NOT_ORDERED)]
		                              
    }

    def call_back_list = {
		def max = params.max ?: 35
		def offset = params.offset ?: 0

        def currentUser = springSecurityService.principal

		def customers = Customer.createCriteria().list{
			lastCall{
				eq('result', CallResult.CALLBACK)
				isNotNull("callbackDate")
			}
		}
		customers.sort{a, b ->
          if (a.lastCall.callbackDate == b.lastCall.callbackDate){
              if (a.lastCall.caller.username == currentUser)
                  return -1
              else if (a.lastCall.caller.username == currentUser)
                  return 1
              else return a.lastCall.caller.username <=> b.lastCall.caller.username
         }

         else return a.lastCall.callbackDate <=> b.lastCall.callbackDate
        }

        [customerInstanceList:customers, customerInstanceTotal: customers.size(), caller: springSecurityService.principal]

    }


	def unlock_customer = {
            def caller
            if(Caller.get(springSecurityService.principal.id))
                caller = Caller.get(springSecurityService.principal.id)
	    def customer = Customer.get(params.id)
	    if(customer) {
                        println "$caller is unlocking customer " + customer.fsdName
			customer.inCall = null
			flash.message = "Customer unlocked"

			if(params?.search) {
				def query = params?.query
				redirect action:'findCustomer', params: [query:query]
			} else if(params?.type == 'cb') {
				redirect action: 'call_back_list'
			}


			redirect action:"${params.type}_list"
		} else {
			redirect action:'index'
		}
	}

        def findCustomer = {
            def caller
            if(Caller.get(springSecurityService.principal.id))
                caller = Caller.get(springSecurityService.principal.id)
            println "$caller is in findCustomer action of CallController"

			def currentCustomer = Customer.get(params.id)

			if(currentCustomer) {
				currentCustomer.inCall = null
			}

            if(params.query){
                println "$caller is searching for '" + params.query + "'"
                def customers = []

				Customer.search(params?.query, [max:100]).results?.each {
					def customer =	Customer.get(it.id)
					customers << customer
				}

                if(customers){
                    println "found " + customers?.size() + " results"
                    return [customerInstanceList:customers, query: params?.query ]
                } else {
                    println "$caller found no results for query '" + params.query + "'"
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
