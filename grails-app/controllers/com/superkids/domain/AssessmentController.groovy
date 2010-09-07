package com.superkids.domain

import com.superkids.domain.*

class AssessmentController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [assessmentInstanceList: Assessment.list(params), assessmentInstanceTotal: Assessment.count()]
    }

    def create = {
        def assessmentInstance = new Assessment()
        assessmentInstance.properties = params
        return [assessmentInstance: assessmentInstance]
    }

    def save = {
        def assessmentInstance = new Assessment(params)
        if (assessmentInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'assessment.label', default: 'Assessment'), assessmentInstance.id])}"
            redirect(action: "show", id: assessmentInstance.id)
        }
        else {
            render(view: "create", model: [assessmentInstance: assessmentInstance])
        }
    }

    def show = {
        def assessmentInstance = Assessment.get(params.id)
        if (!assessmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assessment.label', default: 'Assessment'), params.id])}"
            redirect(action: "list")
        }
        else {
            [assessmentInstance: assessmentInstance]
        }
    }

    def edit = {
        def assessmentInstance = Assessment.get(params.id)
        if (!assessmentInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assessment.label', default: 'Assessment'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [assessmentInstance: assessmentInstance]
        }
    }

    def update = {
        def assessmentInstance = Assessment.get(params.id)
        if (assessmentInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (assessmentInstance.version > version) {
                    
                    assessmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'assessment.label', default: 'Assessment')] as Object[], "Another user has updated this Assessment while you were editing")
                    render(view: "edit", model: [assessmentInstance: assessmentInstance])
                    return
                }
            }
            assessmentInstance.properties = params
            if (!assessmentInstance.hasErrors() && assessmentInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'assessment.label', default: 'Assessment'), assessmentInstance.id])}"
                redirect(action: "show", id: assessmentInstance.id)
            }
            else {
                render(view: "edit", model: [assessmentInstance: assessmentInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assessment.label', default: 'Assessment'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def assessmentInstance = Assessment.get(params.id)
        if (assessmentInstance) {
            try {
                assessmentInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'assessment.label', default: 'Assessment'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'assessment.label', default: 'Assessment'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assessment.label', default: 'Assessment'), params.id])}"
            redirect(action: "list")
        }
    }

    def start = {
        if(springSecurityService.loggedIn) {
            def user = User.get(springSecurityService.principal.id)
            def userRole = Role.findByAuthority("ROLE_USER")
            def products = []
            if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                def customer = Customer.get(springSecurityService.principal.id)
                def assessmentInstance = new Assessment()
                assessmentInstance.properties = params
                println "the customer's products are: "
                customer.order.products.each {
                    println it
                }
                println "the products we'll return are: "
                customer.order.products.each{
                    if(!Assessment.findByCustomerAndProduct(customer, it)){
                        products << it
                    }
                }
                products.each{ println it }
                return [assessmentInstance: assessmentInstance, products:products]       
            } else {
                flash.message = "Did you order anything yet?"
                redirect controller:"home", action:"index"
            }
        } else {
            flash.message = "Please log in.."
            redirect controller:"home", action:"index"
        }
    }

    def lc = {
        def user = Customer.get(springSecurityService.principal.id)
        def assessmentInstance = new Assessment(customer:user)
        assessmentInstance.properties = params
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance]
    }

    def cc = {
        def assessmentInstance = Assessment.get(params.id)
        assessmentInstance.likeComment = params.likeComment
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance]
    }

    def ir = {
        def assessmentInstance = Assessment.get(params.id)
        assessmentInstance.changeComment = params.changeComment
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance]
    }

    def complete = {
        def assessmentInstance = Assessment.get(params.id)
        assessmentInstance.interestRating = params.interestRating
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance]
    }

}
