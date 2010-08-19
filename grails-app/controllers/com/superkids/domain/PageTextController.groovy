package com.superkids.domain

class PageTextController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [pageTextInstanceList: PageText.list(params), pageTextInstanceTotal: PageText.count()]
    }

    def create = {
        def pageTextInstance = new PageText()
        pageTextInstance.properties = params
        return [pageTextInstance: pageTextInstance]
    }

    def save = {
        def pageTextInstance = new PageText(params)
        if (pageTextInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'pageText.label', default: 'PageText'), pageTextInstance.id])}"
            redirect(action: "show", id: pageTextInstance.id)
        }
        else {
            render(view: "create", model: [pageTextInstance: pageTextInstance])
        }
    }

    def show = {
        def pageTextInstance = PageText.get(params.id)
        if (!pageTextInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pageText.label', default: 'PageText'), params.id])}"
            redirect(action: "list")
        }
        else {
            [pageTextInstance: pageTextInstance]
        }
    }

    def edit = {
        def pageTextInstance = PageText.get(params.id)
        if (!pageTextInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pageText.label', default: 'PageText'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [pageTextInstance: pageTextInstance]
        }
    }

    def update = {
        def pageTextInstance = PageText.get(params.id)
        if (pageTextInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (pageTextInstance.version > version) {
                    
                    pageTextInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'pageText.label', default: 'PageText')] as Object[], "Another user has updated this PageText while you were editing")
                    render(view: "edit", model: [pageTextInstance: pageTextInstance])
                    return
                }
            }
            pageTextInstance.properties = params
            if (!pageTextInstance.hasErrors() && pageTextInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'pageText.label', default: 'PageText'), pageTextInstance.id])}"
                redirect(action: "show", id: pageTextInstance.id)
            }
            else {
                render(view: "edit", model: [pageTextInstance: pageTextInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pageText.label', default: 'PageText'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def pageTextInstance = PageText.get(params.id)
        if (pageTextInstance) {
            try {
                pageTextInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'pageText.label', default: 'PageText'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'pageText.label', default: 'PageText'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'pageText.label', default: 'PageText'), params.id])}"
            redirect(action: "list")
        }
    }
}
