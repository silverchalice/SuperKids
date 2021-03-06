package com.superkids.domain

import java.text.DateFormat
import java.text.SimpleDateFormat

class CallController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService
    def callService
    def userService

    static List<String> states = ['AL', 'AK', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'FL', 'GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME',
                  'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA',
                  'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV', 'WI', 'WY']

    static List<String> timezones = ['Eastern', 'Mountain', 'Central', 'Pacific', 'Alaska', 'Hawaii']


    private Date seventyTwoHoursAgo() { new Date(new Date().time - 259200000) }
    private Date fortyEightHoursAgo() { new Date(new Date().time - 172800000) }
    private Date twentyFourHoursAgo() { new Date(new Date().time - 86400000) }

    def index = {

        if (springSecurityService.isLoggedIn()) {

            def caller = Caller.get(springSecurityService.principal.id)
            [caller: caller]
        }


    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 50, 50)
        params.sort = params?.sort ?: "dateCreated"
        params.order = params?.order ?: "desc"

        [callInstanceList: Call.list(params), callInstanceTotal: Call.count()]
    }

    def create = {
        def callInstance = new Call()
        callInstance.properties = params
        return [callInstance: callInstance]
    }

    def save_order_call = {
        println "In Save_Order_Call for CallController"

        def caller = Caller.get(springSecurityService.principal.id)
        def customer = Customer.get(params.id)

        def currentTimezone
        if (params?.timezone) {
            println params.timezone
            currentTimezone = params?.timezone
        } else if (params?.currentTimezone) {
            println params.currentTimezone
            currentTimezone = params?.currentTimezone
        } else {
            println "we have no timezone!"
        }




        if ((!params.result) || (params.result == null) || (params.result == 'null')) {
            println "CallResult of Null"
            customer.inCall = null
            if (params.single) {
                if (params?.search == 'true') {
                    println "This call was made from a search results page - redirecting back to results"
                    def query = params?.query
                    redirect action: 'findCustomer', params: [query: query]
                    return
                } else if (params?.cb) {
                    println "This call was made from the Callback list - redirecting back to CB List"
                    redirect action: 'call_back_list'
                    return
                } else if (params?.ocl) {
                    println "This call was made from the Order Call list - redirecting back to OC List"
                    redirect action: 'order_list'
                    return
                } else {
                    println "This call was made without a return param - returning home"
                    redirect action: 'index', caller: springSecurityService.principal
                    return
                }
            } else redirect action: 'next_order_call', id: customer.id, params: [currentTimezone: currentTimezone, queue: params?.queue, states: states]
            return
        }

        if (customer) {

            //customer.inCall = null
            println "$caller is saving order call for customer " + customer.fsdName
            customer.properties = userService.bindParams(params)

            def user = User.get(params.id)
            user.username = params.email


            if (customer.save(flush: true) && user.save(flush: true)) {

                def call = new Call(params)
                println "1"

                call.caller = caller
                call.customer = customer
                call.result = CallResult.valueOf(params.result)

                println "the call result from " + caller + "'s order call for customer " + customer + " was " + call.result

                if (call.result == CallResult.CALLBACK) {
                    println "CallResult of Callback"
                    if (params.callbackDateString) {
                        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
                        call.callbackDate = df.parse(params.callbackDateString);
                        call.callbackTime = params.callbackTime
                    } else {
                        println "No callback string"
                    }
                } else if (call.result == CallResult.DUPLICATE) {
                    println "$caller found a duplicate..."
                    customer?.duplicate = true
                    customer.save()
                } else if (call.result == CallResult.QUALIFIED) {
                    println "Call Result for " + caller + "'s call with customer " + customer + " was QUALIFIED - saving order..."
                    def order = new CustomerOrder(params['order'])
                    order.orderType = OrderType.PHONE

                    def shippingDate = ShippingDate.findByShipDate(params.shippingDate)

                    order.shippingDate = shippingDate
                    order.customer = customer

                    params.each { key, val ->
                        if (key.size() > 5 && key[0..5] == 'order_' && val == 'on') {
                            def productId = key[6..-1]

                            println "product is $productId"

                            def product = Product.get(productId)

                            println "product looked up is $product?.name"

                            def pOrder = new ProductOrder(product: product, order: order)
                            if (product) {
                                if (Product.findAllByParent(product)) {
                                    def subProducts = Product.findAllByParent(product)

                                    subProducts.each { sp ->
                                        def po = new ProductOrder(product: sp, order: order, received: true)
                                        order.addToProducts(po)
                                    }
                                }

                                if (!pOrder.save()) {
                                    pOrder.errors.allErrors.each { println it }
                                }
                            }
                        }
                    }

                    if (order.save(flush: true)) {
                        println "w00t! $caller saved order for customer " + order.customer.fsdName
                        customer.status = CustomerStatus.HAS_ORDERED
                        customer.hasPlacedCurrentOrder = true
                        customer.customerOrder = order
                    } else {
                        println "oops... $caller had problems saving order for customer " + customer?.fsdName
                        order.errors.allErrors.each { println it }
                        flash.message = "Invalid Order - please check input"
                        render view: 'order_call_form', model: [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                            it.sortOrder
                        }, call                                                 : call, queue: params?.queue, currentTimezone: currentTimezone, states: states]
                    }
                } else {
                    call.result = CallResult.valueOf(params.result)
                }

                println "3"

                customer.addToCalls(call)
                caller.addToCalls(call)

                if (!call.save()) {
                    call.errors.allErrors.each { println it }
                }

                println "4"
                if (!customer.save(flush: true)) {
                    customer.errors.allErrors.each { println it }
                }

                if (!caller.save(flush: true)) {
                    caller.errors.allErrors.each { println it }
                }


                customer.inCall = null
                customer.lastCall = call
                if (!customer.save(flush: true)) {
                    println "Unable to save call for $customer"
                    customer.errors.allErrors.each { println it }
                }
                println "The customer's last call result is now $customer.lastCall.result"

                if (params?.single) {
                    println "This is a non-queued call"
                    if (params?.search) {
                        println "$caller made this call from a search results page - redirecting back to results"
                        def query = params?.query
                        customer.inCall = null
                        if (!customer.save(flush: true)) {
                            println "Unable to save call for $customer"
                            customer.errors.allErrors.each { println it }
                        }
                        flash.message = "Call saved"
                        redirect action: 'findCustomer', params: [query: query]
                        return
                    } else if (params?.cb) {
                        println "This call was made from the Callback list - redirecting back to CB List"
                        customer.inCall = null
                        if (!customer.save(flush: true)) {
                            println "Unable to save call for $customer"
                            customer.errors.allErrors.each { println it }
                        }
                        flash.message = "Call saved"
                        redirect action: 'call_back_list'
                        return
                    } else if (params?.ocl) {
                        customer.inCall = null
                        if (!customer.save(flush: true)) {
                            println "Unable to save call for $customer"
                            customer.errors.allErrors.each { println it }
                        }
                        println "This call was made from the Order Call list - redirecting back to OC List"
                        flash.message = "Call saved"
                        redirect action: 'order_list'

                        return
                    } else {
                        println "no return param - heading home"
                        flash.message = "Call saved"
                        redirect action: 'index', caller: springSecurityService.principal
                    }
                } else
                    redirect action: 'next_order_call', id: customer.id, params: [currentTimezone: currentTimezone, queue: params?.queue]
            } else {
                println "$caller could not save customer " + customer.fsdName

                if (customer.errors.getFieldError("username")?.code == "unique") {
                    flash.message = 'Another Customer is already using this email address - this is probably a duplicate. If you are using a noemail@noemail.com address, please try adding some numbers to make the address unique'
                    println "$caller used a duplicate customer email for customer " + customer.fsdName
                } else {
                    customer.errors.allErrors.each { println it }
                    flash.message = 'invalid customer data'
                }

                def model = [:]

                def checkedProducts = []

                params.each { key, val ->
                    if (key.size() > 5 && key[0..5] == 'order_' && val == 'on') {
                        def productId = key[6..-1]

                        println "checkedProduct id is $productId"
                        def product = Product.get(productId)

                        if (product) {
                            println "product checked is $product?.name"
                            checkedProducts.add(product)
                        }
                    }
                }

                if (params?.single) {
                    println "This is a non-queue call"
                    if (params?.search) {
                        println "$caller made this call from a search results page - storing the query before rendering"
                        model = [customerInstance: customer, search: 'true', single: 'true', query: params?.query, currentTimezone: currentTimezone, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                            it.sortOrder
                        }, checkedProducts       : checkedProducts, states: states]
                    } else if (params?.cb) {
                        println "This call was made from the Callback list - redirecting back to CB List"
                        model = [customerInstance: customer, single: 'true', cb: params?.cb, currentTimezone: currentTimezone, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                            it.sortOrder
                        }, checkedProducts       : checkedProducts, states: states]
                    } else if (params?.ocl) {
                        println "This call was made from the Order Call list - redirecting back to OC List"
                        model = [customerInstance: customer, single: 'true', olc: params?.ocl, currentTimezone: currentTimezone, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                            it.sortOrder
                        }, checkedProducts       : checkedProducts, states: states]
                    } else {
                        model = [customerInstance: customer, single: 'true', currentTimezone: currentTimezone, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                            it.sortOrder
                        }, checkedProducts       : checkedProducts, states: states]
                    }
                } else {
                    model = [customerInstance: customer, queue: params?.queue, currentTimezone: currentTimezone, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                        it.sortOrder
                    }, checkedProducts       : checkedProducts, states: states]
                }
                render view: 'order_call_form', model: model
            }
        } else {
            flash.message = "Customer not found"
            redirect action: 'index', caller: springSecurityService.principal
        }

    }

    def finish_call = {
        def customer = Customer.get(params.id)

        if (customer) {
            customer.inCall = null
            customer.save(flush: true)
        }

        redirect action: 'index'


    }

    def show = {
        def callInstance = Call.get(params.id)
        if (!callInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
            redirect(action: "list")
        } else {
            [callInstance: callInstance]
        }
    }


    def edit = {
        def callInstance = Call.get(params.id)
        if (!callInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
            redirect(action: "list")
        } else {
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
            } else {
                render(view: "edit", model: [callInstance: callInstance])
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def callInstance = Call.get(params.id)
        if (callInstance) {
            try {

                def customer = callInstance?.customer
                def caller = callInstance?.caller

                if (customer) {
                    customer.removeFromCalls(callInstance)

                    if (customer.lastCall == callInstance) {
                        println "this was a lastCall"
                        customer.lastCall = null
                        if (customer?.calls?.size() > 0) {
                            println "found another call - bumping it up to lastCall"
                            customer.lastCall = customer.calls.getAt(-1)
                        }

                    }

                    if (!customer.save(flush: true)) {
                        customer.errors.allErrors.each { println it }
                    }
                }
                if (caller) {
                    caller.removeFromCalls(callInstance)
                    caller.save(flush: true)
                }
                println "deleting a call"
                callInstance.delete()


                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        } else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'call.label', default: 'Call'), params.id])}"
            redirect(action: "list")
        }
    }

    def start_order_call = {

        render view: 'order_call_form', model: [products: Product.findAllByLiveProductAndParentIsNull(true).sort {
            it.sortOrder
        }, timezones                                    : timezones, queue: params?.queue, start: 'start', states: states]
    }


    def next_order_call = {
        def caller
        if (Caller.get(springSecurityService.principal.id))
            caller = Caller.get(springSecurityService.principal.id)
        println "$caller is in next_order_call for CallController"
        //make sure the last customer is no longer 'in call'
        def currentCustomer = Customer.get(params?.id)

        Long currentId

        if (currentCustomer) {
            currentCustomer.inCall = null
            currentCustomer.save(flush: true)

            currentId = currentCustomer.id

        } else {
            currentId = 0
        }
        def order = new CustomerOrder()
        def call = new Call()

        def currentTimezone
        if (params?.timezone)
            currentTimezone = params?.timezone
        else
            currentTimezone = params?.currentTimezone


        def c = Customer.createCriteria()
        def c2 = Customer.createCriteria()

        //order calls are all customers with out a current order AND who are not being called atm
        def customer = c.list(sort: 'id') {
            eq 'timezone', currentTimezone
            or {
                eq 'status', CustomerStatus.HAS_NOT_ORDERED
                eq 'hasPlacedCurrentOrder', false
            }

            isNull 'inCall'
            eq 'doNotCall', false

            if (params?.queue == "new") {
                println "$caller is using the new calls queue"
                isNull "lastCall"
                not {
                    eq('customerRanking', 1)
                }
            } else if (params?.queue == "top100") {
                println "$caller is using the top100 calls queue"
                eq('customerRanking', 1)

            } else {
                println "$caller is using the prev calls queue"
                not {
                    eq('customerRanking', 1)
                }
                lastCall {
                    ne('result', CallResult.REFUSED)
                    ne('result', CallResult.QUALIFIED)
                    ne('result', CallResult.NOT_QUALIFIED)
                    ne('result', CallResult.CALLBACK)

                    le('dateCreated', fortyEightHoursAgo()

                    )

                }
            }

            or {
                eq('duplicate', false)
                isNull('duplicate')
            }

            gt('id', currentId)

            maxResults(1)
        }.getAt(0)

        if (customer && customer?.inCall == null) {
            customer.inCall = new Date()

            def saveResult
            try {
                saveResult = customer.save(flush: true)
            }
            catch (ex) {
                log.error(ex.message)
                log.error(ex.stackTrace)
                saveResult = false
            }
            if (saveResult) {
                println "$caller is calling $customer?.fsdName"
                render view: 'order_call_form', model: [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                    it.sortOrder
                }, call                                                 : call, order: order, queue: params?.queue, currentTimezone: currentTimezone, states: states]
            } else {
                customer.errors.allErrors.each { println it }
                flash.message = "Oops! An error occured"
                redirect action: next_order_call, params: [id: params?.id]
            }

        } else {
            customer = c2.list(max: 1, sort: 'id') {
                eq 'timezone', currentTimezone
                eq 'status', CustomerStatus.HAS_NOT_ORDERED
                isNull 'inCall'
                eq 'doNotCall', false
                if (params?.queue == "new") {
                    println "$caller is using the new calls queue"
                    not {
                        eq('customerRanking', 1)
                    }
                    isNull "lastCall"
                } else if (params?.queue == "top100") {
                    println "$caller is using the top100 calls queue"
                    eq('customerRanking', 1)
//					or {
//						isNull "lastCall"
//						lastCall {
//							//le('dateCreated', twentyFourHoursAgo())
//							ne('result', CallResult.REFUSED)
//						}

                    //}
                } else {
                    println "$caller is using the prev calls queue"
                    not {
                        eq('customerRanking', 1)
                    }
                    lastCall {
                        le('dateCreated', fortyEightHoursAgo())
                        ne('result', CallResult.REFUSED)
                    }
                }
                or {
                    eq('duplicate', false)
                    isNull('duplicate')
                }

            }.getAt(0)


            if (customer) {
                customer.inCall = new Date()
                if (customer.save(flush: true)) {
                    println "$caller is calling $customer?.fsdName"
                    render view: 'order_call_form', model: [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                        it.sortOrder
                    }, call                                                 : call, order: order, queue: params?.queue, currentTimezone: currentTimezone, states: states]
                } else {
                    println "Unable to retrieve $customer"
                    customer.errors.allErrors.each { println it }
                    flash.message = "Oops! An error occured"
                    redirect action: next_order_call, params: [id: params?.id]
                }

            } else {
                println "$caller reached the end of the customer list for timezone $currentTimezone"
                flash.message = "No more Customers in the $currentTimezone Timezone!"
                redirect action: index
            }
        }
    }

    def prev_order_call = {
        def caller
        if (Caller.get(springSecurityService.principal.id))
            caller = Caller.get(springSecurityService.principal.id)
        println "$caller is in prev_order_call for CallController"

        //make sure the last customer is no longer 'in call'
        def currentCustomer = Customer.get(params.id)
        if (currentCustomer) {
            currentCustomer.inCall = null
            currentCustomer.save(flush: true)
        }

        def order = new CustomerOrder()
        def call = new Call()

        //order calls are all customers with out a current order AND who are not being called atm
        def c = Customer.createCriteria()
        def customer = c.list(max: 1, sort: 'id', order: 'desc') {
            eq 'status', CustomerStatus.HAS_NOT_ORDERED
            isNull 'inCall'
            eq 'doNotCall', false
            lt 'id', currentCustomer.id
        }.getAt(0)

        if (customer) {
            customer.inCall = new Date()
            render view: 'order_call_form', model: [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                it.sortOrder
            }, call                                                 : call, order: order, queue: 'true', timezone: params?.timezone, states: states]
        } else {
            customer = Customer.findByStatusAndInCall(CustomerStatus.HAS_NOT_ORDERED, null)
            customer.inCall = new Date()
            customer.save(flush: true)
            render view: 'order_call_form', model: [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                it.sortOrder
            }, call                                                 : call, order: order, queue: 'true', states: states]
        }
    }


    def get_order_call = {
        def caller
        if (Caller.get(springSecurityService.principal.id))
            caller = Caller.get(springSecurityService.principal.id)
        println "$caller is in get_order_call for CallController"
        println params

        def customer = Customer.get(params?.id)

        if (customer) {
            def order = new CustomerOrder()
            def call = new Call()

            customer.inCall = new Date()

            def model = [:]

            if (params?.search) model = [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                it.sortOrder
            }, call                                      : call, order: order, single: true, search: true, query: params?.query, states: states]
            else if (params?.cb) model = [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                it.sortOrder
            }, call                                       : call, order: order, single: true, cb: params?.cb, states: states]
            else if (params?.ocl) model = [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                it.sortOrder
            }, call                                        : call, order: order, single: true, ocl: params?.ocl, states: states]
            else model = [customerInstance: customer, products: Product.findAllByLiveProductAndParentIsNull(true).sort {
                    it.sortOrder
                }, call                   : call, order: order, single: true, states: states]

            render view: 'order_call_form', model: model

        } else {
            redirect action: 'list'
        }
    }

    def next_assess_call = {
        def caller = Caller.get(springSecurityService.principal.id)
        println "$caller is in next_assess_call for CallController"
        //make sure the last customer is no longer 'in call'
        def currentCustomer = Customer.get(params?.id)

        Long currentId

        if (currentCustomer) {
            currentCustomer.inCall = null
            currentCustomer.save(flush: true)

            currentId = currentCustomer.id

        } else {
            currentId = 0
        }
        def call = new Call()


        def currentTimezone
        if (params?.timezone)
            currentTimezone = params?.timezone
        else
            currentTimezone = params?.currentTimezone


        println "timezone: $currentTimezone"

        def c = Customer.createCriteria()
        def c2 = Customer.createCriteria()

        def now = new Date()
        //assess calls are all customers with a current order AND who are not being called atm
        Customer customer = c.list(sort: 'id') {
            eq 'timezone', currentTimezone
            eq 'hasCompletedCurrentAssessment', false

            //TODO: Remove to enable Feb orders
			//customerOrder {
			//	eq 'shippingDate', ShippingDate.get(4)
			//}

            or {
                eq 'status', CustomerStatus.HAS_ORDERED
                eq 'hasPlacedCurrentOrder', true
            }
            eq 'doNotCall', false
            isNull 'inCall'

            if (params?.queue == "new") {
                println "$caller is using the new calls queue"
                or {
                    lastCall {
                        eq('result', CallResult.QUALIFIED)
                    }
                    isNull "lastCall"
                }
            } else {
                println "$caller is using the prev calls queue"
                lastCall {
                    ne('result', CallResult.REFUSED)
                    ne('result', CallResult.NOT_QUALIFIED)
                    ne('result', CallResult.CALLBACK)

                    le('dateCreated', fortyEightHoursAgo())

                }
            }

            or {
                eq('duplicate', false)
                isNull('duplicate')
            }

            gt('id', currentId)
            maxResults(1)
        }.getAt(0)

        if (customer) {
            println "$caller got $customer from the assess queue"

            //TODO: Need to figure out why these fields are getting set, for now manually reset them:

            println "$customer: doNotCall: ${customer.doNotCall}; passwordExpired: ${customer.passwordExpired}, completed: ${customer.hasCompletedCurrentAssessment}"


            customer.with {
                doNotCall = false
                passwordExpired = false
                accountExpired = false
                accountLocked = false
                deleted = false
                hasCompletedCurrentAssessment = false
                inCall = new Date()
            }

            if (customer.save(flush: true)) {
                println "$caller is calling ${customer}:${customer?.fsdName}"
                println "$customer: doNotCall: ${customer.doNotCall}; passwordExpired: ${customer.passwordExpired}, completed: ${customer.hasCompletedCurrentAssessment}"

                render view: 'assess_call_form', model: [customerInstance: customer, call: call, queue: params?.queue, currentTimezone: currentTimezone, timezones: timezones, states: states]
            } else {
                customer.errors.allErrors.each { println it }
                flash.message = "Oops! An error occurred"
                redirect action: index
                return
            }

        } else {


            customer = c2.list(max: 1, sort: 'id') {
                eq 'timezone', currentTimezone
                eq 'status', CustomerStatus.HAS_ORDERED

                //TODO: Remove to enable Feb orders
				//customerOrder {
				//	eq 'shippingDate', ShippingDate.get(4)
				//}

                isNull 'inCall'
                eq 'doNotCall', false

                or {
                    eq('duplicate', false)
                    isNull('duplicate')
                }

            }.getAt(0)

            if (customer) {
                println "$caller is coming around the end of the assess list"

                customer.with {
                    doNotCall = false
                    passwordExpired = false
                    accountExpired = false
                    accountLocked = false
                    deleted = false
                    hasCompletedCurrentAssessment = false
                    inCall = new Date()
                }

                if (customer.save(flush: true)) {
                    println "$caller is calling $customer?.fsdName"
                    render view: 'assess_call_form', model: [customerInstance: customer, call: call, queue: params?.queue, currentTimezone: currentTimezone, timezones: timezones, states: states]
                } else {
                    customer.errors.allErrors.each { println it }
                    flash.message = "Oops! An error occured"
                    redirect action: index
                    return
                }

            } else {
                println "$caller reached the end of the assess customer list for timezone $currentTimezone"
                flash.message = "No more Customers in this Timezone!"
                redirect action: index
                return
            }
        }
    }

    def prev_assess_call = {
        def caller
        if (Caller.get(springSecurityService.principal.id))
            caller = Caller.get(springSecurityService.principal.id)
        println "$caller is in prev_assess_call for CallController"

        //make sure the last customer is no longer 'in call'
        def currentCustomer = Customer.get(params.id)
        if (currentCustomer) {
            currentCustomer.inCall = null
            currentCustomer.save(flush: true)
        }

        def call = new Call()

        //order calls are all customers with out a current order AND who are not being called atm
        def c = Customer.createCriteria()
        def customer = c.list(max: 1, sort: 'id', order: 'desc') {
            eq 'status', CustomerStatus.HAS_ORDERED
            isNull 'inCall'
            eq 'doNotCall', false
            lt 'id', currentCustomer.id
        }.getAt(0)

        if (customer) {
            customer.inCall = new Date()
            render view: 'assess_call_form', model: [customerInstance: customer, call: call, queue: 'true', states: states]
        } else {
            customer = Customer.findByStatusAndInCall(CustomerStatus.HAS_ORDERED, null)
            customer.inCall = new Date()
            customer.save(flush: true)
            render view: 'assess_call_form', model: [customerInstance: customer, call: call, queue: 'true', states: states]
        }
    }

    def start_assess_call = {
        render view: 'assess_call_form', model: [timezones: timezones, queue: params?.queue, start: 'start', states: states]
    }


    def get_assess_call = {
        def caller
        if (Caller.get(springSecurityService.principal.id))
            caller = Caller.get(springSecurityService.principal.id)
        println "$caller is in get_assess_call for CallController"

        //make sure the last customer is no longer 'in call'
        def customer = Customer.get(params?.id)
        if (customer) {
            def order = new CustomerOrder()
            def call = new Call()
            def model = [:]
            customer.inCall = new Date()
            if (params?.search) model = [customerInstance: customer, order: order, call: call, single: true, search: true, query: params?.query, states: states]
            else if (params?.cb) model = [customerInstance: customer, call: call, order: order, single: true, cb: params?.cb, states: states]
            else if (params?.acl) model = [customerInstance: customer, call: call, order: order, single: true, acl: params?.acl, states: states]
            render view: 'assess_call_form', model: model
        } else {
            redirect action: list
            return
        }
    }


    def save_assess_call = {

        def caller = Caller.get(springSecurityService.principal.id)
        def customer = Customer.get(params.id)

        println "$caller is in save_assess_call for CallController, customer $customer"
//        params.each { key, val ->
//            println "$key = $val"
//        }

        def currentTimezone
        if (params?.timezone)
            currentTimezone = params?.timezone
        else
            currentTimezone = params?.currentTimezone


        if ((!params.result) || (params.result == null) || (params.result == 'null')) {
            println "$caller with $customer got a CallResult of Null"
            customer.inCall = null

            if (params.single) {
                if (params?.search == 'true') {
                    println "This call was made from a search results page - redirecting back to results"
                    def query = params?.query
                    redirect action: 'findCustomer', params: [query: query]
                    return
                } else if (params?.cb) {
                    println "This call was made from the Callback list - redirecting back to CB List"
                    redirect action: 'call_back_list'
                    return
                } else if (params?.acl) {
                    println "This call was made from the Assess Call list - redirecting back to AC List"
                    redirect action: 'assess_list'
                    return
                } else {
                    println "This call was made without a return param - returning home"
                    redirect action: 'index', caller: springSecurityService.principal
                    return
                }
            } else {
                println "In-queue call... redirecting..."
                redirect action: 'next_assess_call', id: customer.id, params: [currentTimezone: currentTimezone, queue: params?.queue, states: states]
                return
            }
        }

        if (customer) {
            println "$caller is saving assess call for customer " + customer.fsdName
            customer.properties = userService.bindParams(params)

            if (params.broker?.name) {
                def broker1 = Broker.findByName(params.broker?.name)
                if (!broker1)
                    broker1 = new Broker(params['broker'])
                else if (params.broker?.name)
                    broker1.properties = params['broker']

                customer.addToBrokers(broker1)
            }

            if (params.broker2?.name) {
                def broker2 = Broker.findByName(params.broker2?.name)
                if (!broker2)
                    broker2 = new Broker(params['broker2'])
                else if (params.broker2?.name)
                    broker2.properties = params['broker2']

                customer.addToBrokers(broker2)
            }

            println "$customer: doNotCall: ${customer.doNotCall}; passwordExpired: ${customer.passwordExpired}, completed: ${customer.hasCompletedCurrentAssessment}"
            if (customer.save(flush: true)) {
                def call = new Call(params)
                call.caller = caller
                call.customer = customer
                call.result = CallResult.valueOf(params.result)

                if (call.result == CallResult.CALLBACK) {
                    println "$caller has a Callback..."
                    if (params.callbackDateString) {
                        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
                        call.callbackDate = df.parse(params.callbackDateString);
                        call.callbackTime = params.callbackTime
                    }
                } else if (call.result == CallResult.QUALIFIED || call.result == CallResult.INCOMPLETE) {
                    println "The CallResult for " + caller + "'s call with customer " + customer + " was QUALIFIED - saving assessments"

                    Product.list(sort: 'sortOrder').each { product ->

                        if (params.assessment?."${product.id}") {

                            if (params.assessment."${product.id}".didNotReceive) {
                                println "did not receive"
                                def po = ProductOrder.findByOrderAndProduct(customer.customerOrder, product)
                                po.received = false
                                if (!po.save()) {
                                    println "wow. There were errors with saving this productOrder:"
                                    po.errors.allErrors.each {
                                        println it
                                    }
                                }
                            } else if (params.assessment."${product.id}".didNotSample) {
                                println "did not sample"
                                def po = ProductOrder.findByOrderAndProduct(customer.customerOrder, product)
                                po.sampled = false
                                po.save()
                            } else {

                                println "$caller is saving customer " + customer.fsdName + "'s assessment of " + product
                                println params?.assessment?."${product.id}".likeRating
                                println params?.assessment?."${product.id}".likeComment
                                println params?.assessment?."${product.id}".changeComment

                                def assessment = new Assessment(
                                        likeRating: params?.assessment?."${product.id}".likeRating,
                                        likeComment: params?.assessment?."${product.id}".likeComment,
                                        changeComment: params?.assessment?."${product.id}".changeComment,
                                        favorite: params?.assessment?."${product.id}".favorite ?: null,
                                        product: product,
                                        type: OrderType.PHONE,
                                        completed: true
                                )

                                if (assessment?.likeRating && assessment?.likeComment && assessment?.changeComment) {
                                    println "assessment was completed"
                                    assessment.completed = true
                                }

                                if (customer.addToAssessments(assessment)) {
                                    println "added assessment"
                                } else {
                                    println "surprise! something went wrong"
                                }

                                if (!customer.save()) {
                                    println "\n\n\n\n\n\ncouldn't save customer\n\n\n\n\n\n"
                                }

                            }
                        }
                    }

                    println "Now we save final questions"
                    customer.otherProducts = params?.otherProducts
                    params.reformulations?.each { key, value ->
                        println "adding a reformulation..."
                        println value
                        if (value && customer.reformulations) {
                            customer.reformulations += value
                            customer.reformulations += "<br/> "
                        } else {
                            customer.reformulations = value
                            customer.reformulations += "<br/> "
                        }
                    }
                    println customer.reformulations


                } else {
                    call.result = CallResult.valueOf(params.result)
                }


                if (call.result == CallResult.DUPLICATE) {
                    println "$caller had a CallResult of Duplicate"
                    customer?.duplicate = true
                }

                println "3"
                customer.addToCalls(call)
                if (!customer.save(flush: true)) {
                    customer.errors.allErrors.each { println it }
                }
                println "4"

                caller.addToCalls(call)
                if (!caller.save(flush: true)) {
                    caller.errors.allErrors.each { println it }
                }


                if (call.result == CallResult.QUALIFIED) {
                    customer.status = CustomerStatus.QUALIFIED
                    customer.hasCompletedCurrentAssessment = true
                }

                if (!customer.save()) {
                    println "$caller had errors saving customer " + customer.fsdName + "'s assessment of " + product
                    customer.errors.allErrors.each { println it }
                    flash.message = "Error saving the Assessment"
                    redirect action: index
                    return
                }

                println "$customer: doNotCall: ${customer.doNotCall}; passwordExpired: ${customer.passwordExpired}, completed: ${customer.hasCompletedCurrentAssessment}"

                customer.inCall = null
                customer.lastCall = call

                if (!customer.save(flush: true)) {
                    customer.errors.allErrors.each { println it }
                }

                if (params?.single) {
                    println "This is a non-queued call"
                    if (params?.search) {
                        println "$caller made this call from a search results page - redirecting back to results"
                        def query = params?.query
                        customer.inCall = null
                        if (!customer.save()) {
                            println "\n\n\n\n\n\nabout to redirect but we couldn't save the customer\n\n\n\n\n"
                        }
                        flash.message = "Call saved"
                        redirect action: 'findCustomer', params: [query: query]
                        return
                    } else if (params?.cb) {
                        println "This call was made from the Callback list - redirecting back to CB List"
                        customer.inCall = null
                        if (!customer.save()) {
                            println "\n\n\n\n\n\nabout to redirect (call back) but we couldn't save the customer\n\n\n\n\n"
                        }
                        flash.message = "Call saved"
                        redirect action: 'call_back_list'
                        return
                    } else if (params?.acl) {
                        customer.inCall = null
                        if (!customer.save()) {
                            println "\n\n\n\n\n\nabout to redirect (acl) but we couldn't save the customer\n\n\n\n\n"
                        }
                        println "This call was made from the Assess Call list - redirecting back to AC List"
                        flash.message = "Call saved"
                        redirect action: 'assess_list'

                        return
                    } else {
                        println "no return param - heading home"
                        flash.message = "Call saved"
                        redirect action: 'index', caller: springSecurityService.principal
                    }
                } else {
                    redirect action: 'next_assess_call', id: customer.id, params: [currentTimezone: currentTimezone, queue: params?.queue, states: states]
                    return
                }

            } else {
                customer.errors.allErrors.each { println it }
                flash.message = "An error occurred while we were trying to save this customer record."
                redirect action: 'index'
            }
        } else {
            flash.message = "no customer"
            redirect action: 'index'
        }

    }

    def assess_list = {
        def max = params.max ?: 35
        def offset = params.offset ?: 0
        def sort = params.sort ?: "customerRanking"
        def customers = Customer.findAllByStatus(CustomerStatus.HAS_ORDERED, [max: max, offset: offset, sort: sort])

        [customerInstanceList: customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_ORDERED)]
    }

    def order_list = {
        def max = params.max ?: 35
        def offset = params.offset ?: 0
        def sort = params.sort ?: "customerRanking"
        def customers = Customer.findAllByStatus(CustomerStatus.HAS_NOT_ORDERED, [max: max, offset: offset, sort: sort])

        [customerInstanceList: customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_NOT_ORDERED)]
        [customerInstanceList: customers, customerInstanceTotal: Customer.countByStatus(CustomerStatus.HAS_NOT_ORDERED)]

    }

    def call_back_list = {

        def currentUser = springSecurityService.principal

        def customers = Customer.createCriteria().list {

            lastCall {

                eq('result', CallResult.CALLBACK)
                isNotNull("callbackDate")
            }

        }
        customers.sort { a, b ->
            if (a.lastCall.callbackDate == b.lastCall.callbackDate) {
                if (a.lastCall.caller.username == currentUser)
                    return -1
                else if (a.lastCall.caller.username == currentUser)
                    return 1
                else return a.lastCall.caller.username <=> b.lastCall.caller.username
            } else return a.lastCall.callbackDate <=> b.lastCall.callbackDate
        }

        [customerInstanceList: customers, customerInstanceTotal: customers.size(), caller: springSecurityService.principal]

    }


    def unlock_customer = {
        def caller
        if (Caller.get(springSecurityService.principal.id))
            caller = Caller.get(springSecurityService.principal.id)
        def customer = Customer.get(params.id)
        if (customer) {
            println "$caller is unlocking customer " + customer.fsdName
            customer.inCall = null
            flash.message = "Customer unlocked"

            if (params?.search) {
                def query = params?.query
                redirect action: 'findCustomer', params: [query: query]
                return
            } else if (params?.type == 'cb') {
                redirect action: 'call_back_list'
                return
            }

            redirect action: "${params.type}_list"
            return
        } else {
            redirect action: 'index'
        }
    }

    def findCustomer = {
        def caller
        if (Caller.get(springSecurityService.principal.id))
            caller = Caller.get(springSecurityService.principal.id)
        println "$caller is in findCustomer action of CallController"

        def currentCustomer = Customer.get(params.id)

        if (currentCustomer) {
            currentCustomer.inCall = null
        }

        if (params.query) {
            println "$caller is searching for '" + params.query + "'"
            def customers = []

            Customer.search(params?.query, [max: 100]).results?.each {
                def customer = Customer.get(it.id)
                if (customer && !customer.doNotCall) {
                    customers << customer
                }

            }

            if (customers) {
                println "found " + customers?.size() + " results"
                return [customerInstanceList: customers, query: params?.query]
            } else {
                println "$caller found no results for query '" + params.query + "'"
                flash.message = "No results found for \"${params.query}.\""
                return
            }
        } else {
            flash.message = "Please enter a name or email to search for."
            if (session.currentAction) {
                redirect action: currentAction
            } else {
                redirect action: "index"
            }
        }
    }

}
