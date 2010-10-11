package com.superkids.domain

class FactoidController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [factoidInstanceList: Factoid.list(params), factoidInstanceTotal: Factoid.count()]
    }

    def create = {
        def factoidInstance = new Factoid()
        factoidInstance.properties = params
        return [factoidInstance: factoidInstance]
    }

    def save = {
        def factoidInstance = new Factoid(params)
        if (factoidInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'factoid.label', default: 'Factoid'), factoidInstance.id])}"
            redirect(action: "show", id: factoidInstance.id)
        }
        else {
            render(view: "create", model: [factoidInstance: factoidInstance])
        }
    }

    def show = {
        def factoidInstance = Factoid.get(params.id)
        if (!factoidInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'factoid.label', default: 'Factoid'), params.id])}"
            redirect(action: "list")
        }
        else {
            [factoidInstance: factoidInstance]
        }
    }

    def edit = {
        def factoidInstance = Factoid.get(params.id)
        if (!factoidInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'factoid.label', default: 'Factoid'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [factoidInstance: factoidInstance]
        }
    }

    def update = {
        def factoidInstance = Factoid.get(params.id)
        if (factoidInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (factoidInstance.version > version) {
                    
                    factoidInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'factoid.label', default: 'Factoid')] as Object[], "Another user has updated this Factoid while you were editing")
                    render(view: "edit", model: [factoidInstance: factoidInstance])
                    return
                }
            }
            factoidInstance.properties = params
            if (!factoidInstance.hasErrors() && factoidInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'factoid.label', default: 'Factoid'), factoidInstance.id])}"
                redirect(action: "show", id: factoidInstance.id)
            }
            else {
                render(view: "edit", model: [factoidInstance: factoidInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'factoid.label', default: 'Factoid'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def factoidInstance = Factoid.get(params.id)
        if (factoidInstance) {
            try {
                factoidInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'factoid.label', default: 'Factoid'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'factoid.label', default: 'Factoid'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'factoid.label', default: 'Factoid'), params.id])}"
            redirect(action: "list")
        }
    }

    def other_delete = {
        if(springSecurityService.isLoggedIn()){
            if(User.get(springSecurityService.principal.id).isAdmin()){
                def factoidInstance = Factoid.get(params.id)
                if (factoidInstance) {
                    try {
                        println "trying to delete factoid..."
                        factoidInstance.delete(flush: true)
                        println "...done"
                        flash.message = "Deleted this factoid."
                        redirect(action: "list")
                    }
                    catch (org.springframework.dao.DataIntegrityViolationException e) {
                        println "there was an exception; redirecting..."
                        flash.message = "This factoid could not be deleted."
                        redirect(action: "list")
                    }
                }
                else {
                    flash.message = "Factoid not found."
                    println "couldn't find factoid"
                    redirect(action: "list")
                }
            } else {
                flash.message = "You aren't allowed to access this page."
                redirect controller:"home", action:"index"
            }
        } else {
            flash.message = "Please log in.."
            redirect controller:"home", action:"index"
        }
    }

    def toggleLive = {
        def factoidInstance = Factoid.get(params.id)
        if (factoidInstance){
            factoidInstance.isLive = params.isLive == 'true'
            factoidInstance.save()
        }
        println "the factoidInstance's isLive is " + factoidInstance.isLive
        render ''
    }

}
