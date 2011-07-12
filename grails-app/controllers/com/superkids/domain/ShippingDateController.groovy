package com.superkids.domain

class ShippingDateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [shippingDateInstanceList: ShippingDate.list(params), shippingDateInstanceTotal: ShippingDate.count()]
    }

    def create = {
        def shippingDateInstance = new ShippingDate()
        shippingDateInstance.properties = params
        return [shippingDateInstance: shippingDateInstance]
    }

    def save = {
        def shippingDateInstance = new ShippingDate(params)
        if (shippingDateInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'shippingDate.label', default: 'ShippingDate'), shippingDateInstance.id])}"
            redirect(action: "show", id: shippingDateInstance.id)
        }
        else {
            render(view: "create", model: [shippingDateInstance: shippingDateInstance])
        }
    }

    def show = {
        def shippingDateInstance = ShippingDate.get(params.id)
        if (!shippingDateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shippingDate.label', default: 'ShippingDate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [shippingDateInstance: shippingDateInstance]
        }
    }

    def edit = {
        def shippingDateInstance = ShippingDate.get(params.id)
        if (!shippingDateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shippingDate.label', default: 'ShippingDate'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [shippingDateInstance: shippingDateInstance]
        }
    }

    def update = {
        def shippingDateInstance = ShippingDate.get(params.id)
        if (shippingDateInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (shippingDateInstance.version > version) {
                    
                    shippingDateInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'shippingDate.label', default: 'ShippingDate')] as Object[], "Another user has updated this ShippingDate while you were editing")
                    render(view: "edit", model: [shippingDateInstance: shippingDateInstance])
                    return
                }
            }
            shippingDateInstance.properties = params
            if (!shippingDateInstance.hasErrors() && shippingDateInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'shippingDate.label', default: 'ShippingDate'), shippingDateInstance.id])}"
                redirect(action: "show", id: shippingDateInstance.id)
            }
            else {
                render(view: "edit", model: [shippingDateInstance: shippingDateInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shippingDate.label', default: 'ShippingDate'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def shippingDateInstance = ShippingDate.get(params.id)
        if (shippingDateInstance) {
            try {
                shippingDateInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'shippingDate.label', default: 'ShippingDate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'shippingDate.label', default: 'ShippingDate'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'shippingDate.label', default: 'ShippingDate'), params.id])}"
            redirect(action: "list")
        }
    }
}
