package com.superkids.domain

class BrokerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [brokerInstanceList: Broker.list(params), brokerInstanceTotal: Broker.count()]
    }

    def create = {
        def brokerInstance = new Broker()
        brokerInstance.properties = params
        return [brokerInstance: brokerInstance]
    }

    def save = {
        def brokerInstance = new Broker(params)
        if (brokerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'broker.label', default: 'Broker'), brokerInstance.id])}"
            redirect(action: "show", id: brokerInstance.id)
        }
        else {
            render(view: "create", model: [brokerInstance: brokerInstance])
        }
    }

    def show = {
        def brokerInstance = Broker.get(params.id)
        if (!brokerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
            redirect(action: "list")
        }
        else {
            [brokerInstance: brokerInstance]
        }
    }

    def edit = {
        def brokerInstance = Broker.get(params.id)
        if (!brokerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [brokerInstance: brokerInstance]
        }
    }

    def update = {
        def brokerInstance = Broker.get(params.id)
        if (brokerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (brokerInstance.version > version) {
                    
                    brokerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'broker.label', default: 'Broker')] as Object[], "Another user has updated this Broker while you were editing")
                    render(view: "edit", model: [brokerInstance: brokerInstance])
                    return
                }
            }
            brokerInstance.properties = params
            if (!brokerInstance.hasErrors() && brokerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'broker.label', default: 'Broker'), brokerInstance.id])}"
                redirect(action: "show", id: brokerInstance.id)
            }
            else {
                render(view: "edit", model: [brokerInstance: brokerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def brokerInstance = Broker.get(params.id)
        if (brokerInstance) {
            try {
                brokerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), params.id])}"
            redirect(action: "list")
        }
    }
}
