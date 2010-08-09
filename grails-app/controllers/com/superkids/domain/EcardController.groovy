package com.superkids.domain

class EcardController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ecardInstanceList: Ecard.list(params), ecardInstanceTotal: Ecard.count()]
    }

    def create = {
        def ecardInstance = new Ecard()
        ecardInstance.properties = params
        return [ecardInstance: ecardInstance]
    }

    def save = {
        def ecardInstance = new Ecard(params)
        if (ecardInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ecard.label', default: 'Ecard'), ecardInstance.id])}"
            redirect(action: "show", id: ecardInstance.id)
        }
        else {
            render(view: "create", model: [ecardInstance: ecardInstance])
        }
    }

    def show = {
        def ecardInstance = Ecard.get(params.id)
        if (!ecardInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ecardInstance: ecardInstance]
        }
    }

    def edit = {
        def ecardInstance = Ecard.get(params.id)
        if (!ecardInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ecardInstance: ecardInstance]
        }
    }

    def update = {
        def ecardInstance = Ecard.get(params.id)
        if (ecardInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ecardInstance.version > version) {
                    
                    ecardInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ecard.label', default: 'Ecard')] as Object[], "Another user has updated this Ecard while you were editing")
                    render(view: "edit", model: [ecardInstance: ecardInstance])
                    return
                }
            }
            ecardInstance.properties = params
            if (!ecardInstance.hasErrors() && ecardInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ecard.label', default: 'Ecard'), ecardInstance.id])}"
                redirect(action: "show", id: ecardInstance.id)
            }
            else {
                render(view: "edit", model: [ecardInstance: ecardInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ecardInstance = Ecard.get(params.id)
        if (ecardInstance) {
            try {
                ecardInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
            redirect(action: "list")
        }
    }
}
