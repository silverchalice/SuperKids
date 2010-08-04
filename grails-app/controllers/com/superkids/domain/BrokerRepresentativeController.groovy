package com.superkids.domain

class BrokerRepresentativeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [brokerRepresentativeInstanceList: BrokerRepresentative.list(params), brokerRepresentativeInstanceTotal: BrokerRepresentative.count()]
    }

    def create = {
        def brokerRepresentativeInstance = new BrokerRepresentative()
        brokerRepresentativeInstance.properties = params
        return [brokerRepresentativeInstance: brokerRepresentativeInstance]
    }

    def save = {
        def brokerRepresentativeInstance = new BrokerRepresentative(params)
        if (brokerRepresentativeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative'), brokerRepresentativeInstance.id])}"
            redirect(action: "show", id: brokerRepresentativeInstance.id)
        }
        else {
            render(view: "create", model: [brokerRepresentativeInstance: brokerRepresentativeInstance])
        }
    }

    def show = {
        def brokerRepresentativeInstance = BrokerRepresentative.get(params.id)
        if (!brokerRepresentativeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative'), params.id])}"
            redirect(action: "list")
        }
        else {
            [brokerRepresentativeInstance: brokerRepresentativeInstance]
        }
    }

    def edit = {
        def brokerRepresentativeInstance = BrokerRepresentative.get(params.id)
        if (!brokerRepresentativeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [brokerRepresentativeInstance: brokerRepresentativeInstance]
        }
    }

    def update = {
        def brokerRepresentativeInstance = BrokerRepresentative.get(params.id)
        if (brokerRepresentativeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (brokerRepresentativeInstance.version > version) {
                    
                    brokerRepresentativeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative')] as Object[], "Another user has updated this BrokerRepresentative while you were editing")
                    render(view: "edit", model: [brokerRepresentativeInstance: brokerRepresentativeInstance])
                    return
                }
            }
            brokerRepresentativeInstance.properties = params
            if (!brokerRepresentativeInstance.hasErrors() && brokerRepresentativeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative'), brokerRepresentativeInstance.id])}"
                redirect(action: "show", id: brokerRepresentativeInstance.id)
            }
            else {
                render(view: "edit", model: [brokerRepresentativeInstance: brokerRepresentativeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def brokerRepresentativeInstance = BrokerRepresentative.get(params.id)
        if (brokerRepresentativeInstance) {
            try {
                brokerRepresentativeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'brokerRepresentative.label', default: 'BrokerRepresentative'), params.id])}"
            redirect(action: "list")
        }
    }
}
