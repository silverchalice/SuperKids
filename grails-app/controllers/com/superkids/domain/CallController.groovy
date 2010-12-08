package com.superkids.domain

import java.text.DateFormat
import java.text.SimpleDateFormat
import com.superkids.domain.Product

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
        params.max = Math.min(params.max ? params.int('max') : 23, 100)

        [callInstanceList: Call.list(params), callInstanceTotal: Call.count()]
    }

    def create = {
        def callInstance = new Call()
        callInstance.properties = params
        return [callInstance: callInstance]
    }

    def save_order_call = {

        def customer = Customer.get(params.id)

        def currentTimezone
        if(params?.timezone)
            currentTimezone = params?.timezone
        else
            currentTimezone = params?.currentTimezone



		if((!params.result) || (params.result == null ) || (params.result == 'null')) {
			println "CallResult of Null"
			customer.inCall = null
            if(params.single)  redirect action: 'index', caller: springSecurityService.principal
            else               redirect action: 'next_order_call', id: customer.id, params: [currentTimezone: currentTimezone]
			return
		}

		if(customer) {
			println "saving order call for customer " + customer.fsdName
			customer.properties = params
                        if(params.email){
                            if(Customer.findByEmailOrUsername(params.email)){
                                flash.message = "Another customer is already using this email address -- this is probably a duplicate."
				render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), queue: 'true', currentTimezone: currentTimezone]
                                return
                            } else {
                                def u = User.get(params.id)
                                u.username = params.email
                                u.save(failOnError:true)
                            }
                        }

			if(customer.save(flush:true)){

				def call = new Call(params)
				def caller = Caller.get(springSecurityService.principal.id)
				println "1"
				
				call.caller = caller
				call.customer = customer
				call.result = CallResult.valueOf(params.result)

				println "the call result from order call for customer " + customer + " was " + call.result

				if(call.result == CallResult.CALLBACK) {
					println "CallResult of Callback"
					if(params.callbackDate) {
						DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
						call.callbackDate = df.parse(params.callbackDate);
						call.callbackTime = params.callbackTime
					} else {
                                                println " "
					}
				}
				println "2"


                                if(call.result == CallResult.DUPLICATE) {
                                    println "We have a duplicate..."
                                    customer?.duplicate = true
                                    customer.save()
                                }

				if(call.result == CallResult.QUALIFIED) {
					println "Call Result for customer " + customer + " was QUALIFIED - saving order..."
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
						println "w00t! saved order for customer " + order.customer.fsdName
						customer.status = CustomerStatus.HAS_ORDERED
						customer.order = order
					} else {
						println "oops... couldn't save order for customer " + customer?.fsdName
						order.errors.allErrors.each { println it }
						flash.message = "Invalid Order - please check input"
						render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, queue: 'true', currentTimezone: currentTimezone]
					}
				}
				println "3"
				customer.addToCalls(call)
				customer.save(flush:true)
				println "4"
				call.save()

				caller.addToCalls(call)
				caller.save(flush:true)

				customer.inCall = null
				customer.lastCall = call
				customer.save(flush:true)


				if(params?.single)
					redirect action: 'index', caller: springSecurityService.principal
				else
					redirect action: 'next_order_call', id: customer.id, params: [currentTimezone: currentTimezone, queue: 'true']
			}  else {
				flash.message = 'invalid customer data'
				render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), queue: 'true', currentTimezone: currentTimezone]
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

		render view:'order_call_form', model: [ products: Product.findAllByParentIsNull(), timezones: timezones ]
	}


	def next_order_call = {
		println "in next_order_call for CallController"
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


        def oldDate = new Date(new Date().time - 24000000)
		//order calls are all customers with out a current order AND who are not being called atm
		def customer = c.list(sort: 'seq') {
            eq 'timezone', currentTimezone
			eq 'status', CustomerStatus.HAS_NOT_ORDERED
			isNull 'inCall'

			or {
				lastCall {
					lt('dateCreated', oldDate )
				}
				isNull('lastCall')

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
			render view:'order_call_form', model: [customerInstance: customer, products: Product.findAllByParentIsNull(), call: call, order: order, queue: 'true', currentTimezone: currentTimezone]
		} else {
			customer = c2.list(max: 1, sort: 'seq') {
                eq 'timezone', currentTimezone
			    eq 'status', CustomerStatus.HAS_NOT_ORDERED
			    isNull 'inCall'
		    }.getAt(0)


			if(customer) {
				customer.inCall = new Date()
				customer.save(flush:true)
				render view:'order_call_form', model: [customerInstance: customer, products: Product.findAllByParentIsNull(), call: call, order: order, queue: 'true', currentTimezone: currentTimezone]
			} else redirect action:index
		}
	}

	def prev_order_call = {
		println "in prev_order_call for CallController"


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
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order, queue: 'true', timezone: params?.timezone]
		} else {
			customer = Customer.findByStatusAndInCall(CustomerStatus.HAS_NOT_ORDERED, null)
			customer.inCall = new Date()
			customer.save(flush:true)
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order, queue: 'true']
		}
	}


	def get_order_call = {
		println "in get_order_call for CallController"
		println params

		def customer = Customer.get(params?.id)
		if(customer) {
			def order = new CustomerOrder()
			def call = new Call()

			customer.inCall = new Date()
			render view:'order_call_form', model: [customerInstance: customer, products: Product.list(), call: call, order: order, single: true, ]
		}
		else {
			redirect action:list
		}
	}

 	def next_assess_call = {
		println "in next_assess_call for CallController"
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
		println "in prev_assess_call for CallController"

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
		println "in get_assess_call for CallController"

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
		println "in save_assess_call for CallController"
		def customer = Customer.get(params.id)
		def caller = Caller.get(springSecurityService.principal.id)



        def currentTimezone
        if(params?.timezone)
            currentTimezone = params?.timezone
        else
            currentTimezone = params?.currentTimezone


		if((!params.result) || (params.result == null ) || (params.result == 'null')) {
			println "CallResult of Null"
			customer.inCall = null
			redirect action: 'next_assess_call', id: customer.id,  params: [currentTimezone: currentTimezone, queue: 'true']
			return
		}

		if(customer) {
			println "saving assess call for customer " + customer.fsdName
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
                    println "We have a Callback..."
					if(params.callbackDate) {
						DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
						call.callbackDate = df.parse(params.callbackDate);
						call.callbackTime = params.callbackTime
					} else {
					}
				} else if(call.result == CallResult.QUALIFIED) {
					println "The CallResult for customer " + customer + " was QUALIFIED - saving assessments"

					Product.list(sort:'sortOrder').each { product ->

						if(params.assessment."${product.name}") {

							if(params.assessment."${product.name}".didNotReceive) {
								def po = ProductOrder.findByOrderAndProduct(customer.order, product)
								po.received = false
								po.save()
							}
							else {
								println "saving customer " + customer.fsdName + "'s assessment of " + product
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
									println "errors saving customer " + customer.fsdName + "'s assessment of " + product
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
					println "CallResult of Duplicate"
					println "We have a Dupe..."
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
            println "In findCustomer action of CallController"

			def currentCustomer = Customer.get(params.id)

			if(currentCustomer) {
				currentCustomer.inCall = null
			}

            if(params.query){
                println "searching for '" + params.query + "'"
                def customers = Customer.search(params.query).results

                if(customers){
                    println "found " + customers?.size() + " results"
                    return [customerInstanceList:customers]
                } else {
                    println "found no results"
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
