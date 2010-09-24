package com.superkids.domain

class AdminController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [adminInstanceList: Admin.list(params), adminInstanceTotal: Admin.count()]
    }

    def create = {
        def adminInstance = new Admin()
        adminInstance.properties = params
        return [adminInstance: adminInstance]
    }

    def save = {
        def adminInstance = new Admin(params)
        if (adminInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])}"
            redirect(action: "show", id: adminInstance.id)
        }
        else {
            render(view: "create", model: [adminInstance: adminInstance])
        }
    }

    def show = {
        def adminInstance = Admin.get(params.id)
        if (!adminInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
            redirect(action: "list")
        }
        else {
            [adminInstance: adminInstance]
        }
    }

    def edit = {
        def adminInstance = Admin.get(params.id)
        if (!adminInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [adminInstance: adminInstance]
        }
    }

    def update = {
        def adminInstance = Admin.get(params.id)
        if (adminInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (adminInstance.version > version) {
                    
                    adminInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'admin.label', default: 'Admin')] as Object[], "Another user has updated this Admin while you were editing")
                    render(view: "edit", model: [adminInstance: adminInstance])
                    return
                }
            }
            adminInstance.properties = params
            if (!adminInstance.hasErrors() && adminInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'admin.label', default: 'Admin'), adminInstance.id])}"
                redirect(action: "show", id: adminInstance.id)
            }
            else {
                render(view: "edit", model: [adminInstance: adminInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def adminInstance = Admin.get(params.id)
        if (adminInstance) {
            try {
                adminInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'admin.label', default: 'Admin'), params.id])}"
            redirect(action: "list")
        }
    }

    def other_delete = {
        if(springSecurityService.isLoggedIn()){
            if(Admin.get(springSecurityService.principal.id)){
                def adminInstance = Admin.get(params.id)
                def adminRole = Role.findByAuthority("ROLE_ADMIN")
                if (adminInstance) {
                    if(adminInstance.id == springSecurityService.principal.id){
                        println "adminInstance.id: " + adminInstance.id + "; springSecurityService.principal.id: " + springSecurityService.principal.id
                        flash.message = "You cannot delete yourself. Please log in as another admin and try again."
                        redirect action:"list"
                    } else {
                        UserRole.findByUserAndRole(adminInstance, adminRole).delete()
                        try {
                            adminInstance.delete(flush: true)
                            flash.message = "Deleted this admin."
                            redirect(action: "list")
                        }
                        catch (org.springframework.dao.DataIntegrityViolationException e) {
                            flash.message = "This administrator record could not be deleted."
                            redirect action: "list"
                        }
                    }
                }
                else {
                    flash.message = "Administrator record not found."
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
}
