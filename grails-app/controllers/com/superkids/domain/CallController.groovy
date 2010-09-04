package com.superkids.domain

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

    def save = {
        def callInstance = new Call(params)
        def caller = springSecurityService.principle
        def customer = Customer.get(params.customer)


        if(params.callType == 'order' && params.order) {
          def order = new CustomerOrder(params['order'])

          if(callService.saveOrderCall(callInstance, customer, caller, order)) {
            println "call saved"
          }
        }
        else {
          def assessment = 'assessment'
        }

        if(params.nextCall == 'true') {
          println "do next call"
        }
        else {
          println "we're done"

        }


/*        if (callInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'call.label', default: 'Call'), callInstance.id])}"
            redirect(action: "show", id: callInstance.id)
        }
        else {
            render(view: "create", model: [callInstance: callInstance])
        }*/
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

	def start = {
		def caller = springSecurityService.principal
		def customerInstance = callService.getNextCustomerForOrderCall()

		def callInstance = new Call(customer:customerInstance, caller:caller)

		[ customerInstance: customerInstance, callInstance: callInstance ]
	}


   def mockup = {
 		def caller = springSecurityService.principal
		def customerInstance = Customer.get(2)

		def callInstance = new Call(customer:customerInstance, caller:caller)

		render(view: "start", model: [ customerInstance: customerInstance, callInstance: callInstance ])
   }
	
}
