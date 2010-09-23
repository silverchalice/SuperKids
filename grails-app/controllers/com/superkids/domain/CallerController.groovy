package com.superkids.domain

class CallerController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [callerInstanceList: Caller.list(params), callerInstanceTotal: Caller.count()]
    }

    def create = {
        def callerInstance = new Caller()
        callerInstance.properties = params
        return [callerInstance: callerInstance]
    }

    def save = {
        def callerInstance = new Caller(params)
        callerInstance.password = springSecurityService.encodePassword(params.password)
        def callerRole = Role.findByAuthority("ROLE_CALLER")
        if (callerInstance.save(flush: true)) {
            UserRole.create callerInstance, callerRole, true
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'caller.label', default: 'Caller'), callerInstance.id])}"
            redirect(action: "show", id: callerInstance.id)
        }
        else {
            render(view: "create", model: [callerInstance: callerInstance])
        }
    }

    def show = {
        def callerInstance = Caller.get(params.id)
        if (!callerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caller.label', default: 'Caller'), params.id])}"
            redirect(action: "list")
        }
        else {
            [callerInstance: callerInstance]
        }
    }

    def edit = {
        def callerInstance = Caller.get(params.id)
        if (!callerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caller.label', default: 'Caller'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [callerInstance: callerInstance]
        }
    }

    def update = {
        def callerInstance = Caller.get(params.id)
        if (callerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (callerInstance.version > version) {
                    
                    callerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'caller.label', default: 'Caller')] as Object[], "Another user has updated this Caller while you were editing")
                    render(view: "edit", model: [callerInstance: callerInstance])
                    return
                }
            }
            callerInstance.properties = params
            if(params.password){
                if(params.password == params.confirmpassword){
                    callerInstance.password = springSecurityService.encodePassword(params.password)
                } else {
                    flash.message = "New passwords do not match."
                    render(view: "edit", model: [callerInstance: callerInstance])
                    return
                }
            }
            if (!callerInstance.hasErrors() && callerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'caller.label', default: 'Caller'), callerInstance.id])}"
                redirect(action: "show", id: callerInstance.id)
            }
            else {
                render(view: "edit", model: [callerInstance: callerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caller.label', default: 'Caller'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def callerInstance = Caller.get(params.id)
        if (callerInstance) {
            try {
                callerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'caller.label', default: 'Caller'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'caller.label', default: 'Caller'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'caller.label', default: 'Caller'), params.id])}"
            redirect(action: "list")
        }
    }
}
