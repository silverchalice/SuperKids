package com.superkids.domain

class ContactRequestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactRequestInstanceList: ContactRequest.list(params), contactRequestInstanceTotal: ContactRequest.count()]
    }

    def create = {
        def contactRequestInstance = new ContactRequest()
        contactRequestInstance.properties = params
        return [contactRequestInstance: contactRequestInstance]
    }

    def save = {
        def contactRequestInstance = new ContactRequest(params)
        if (contactRequestInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), contactRequestInstance.id])}"
            redirect(action: "show", id: contactRequestInstance.id)
        }
        else {
            render(view: "create", model: [contactRequestInstance: contactRequestInstance])
        }
    }

    def show = {
        def contactRequestInstance = ContactRequest.get(params.id)
        if (!contactRequestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactRequestInstance: contactRequestInstance]
        }
    }

    def edit = {
        def contactRequestInstance = ContactRequest.get(params.id)
        if (!contactRequestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactRequestInstance: contactRequestInstance]
        }
    }

    def update = {
        def contactRequestInstance = ContactRequest.get(params.id)
        if (contactRequestInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactRequestInstance.version > version) {
                    
                    contactRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contactRequest.label', default: 'ContactRequest')] as Object[], "Another user has updated this ContactRequest while you were editing")
                    render(view: "edit", model: [contactRequestInstance: contactRequestInstance])
                    return
                }
            }
            contactRequestInstance.properties = params
            if (!contactRequestInstance.hasErrors() && contactRequestInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), contactRequestInstance.id])}"
                redirect(action: "show", id: contactRequestInstance.id)
            }
            else {
                render(view: "edit", model: [contactRequestInstance: contactRequestInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def contactRequestInstance = ContactRequest.get(params.id)
        if (contactRequestInstance) {
            try {
                contactRequestInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
            redirect(action: "list")
        }
    }
}
