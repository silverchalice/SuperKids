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
                def product = Product.get(params.id)
                def customer = Customer.get(springSecurityService.principal.id)
                if(customer.order.products.collect{it.id}.contains(product.id)){
                    def assessmentInstance = new Assessment()
                    assessmentInstance.properties = params
                    customer.order.products.each{
                        if(!Assessment.findByCustomerAndProduct(customer, it)){
                            products << it
                        }
                    }
                    if(products){
                        return [assessmentInstance: assessmentInstance, id:params.id, products:products]       
                    } else {
                        flash.message = "You have assessed all of the products that you ordered."
                        redirect controller:"home", action:"index"
                    }
                } else {
                    flash.message = "You didn't order ${product.name}."
                    redirect controller:"home", action:"index"
                }
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
         def products = []
         if(springSecurityService.isLoggedIn()){
             def user = User.get(springSecurityService.principal.id)
             def userRole = Role.findByAuthority("ROLE_USER")
             if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                 def customer = Customer.get(springSecurityService.principal.id)
                 customer.order.products.each{
                     if(!Assessment.findByCustomerAndProduct(customer, it)){
                         products << it
                     }
                 }
             }
         }
        def user = Customer.get(springSecurityService.principal.id)
        def assessmentInstance = new Assessment(customer:user)
        assessmentInstance.properties = params
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance, products:products]
    }

    def cc = {
         def products = []
         def assessmentInstance = Assessment.get(params.id)
         if(springSecurityService.isLoggedIn()){
             def user = User.get(springSecurityService.principal.id)
             def userRole = Role.findByAuthority("ROLE_USER")
             if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                 def customer = Customer.get(springSecurityService.principal.id)
                 customer.order.products.each{
                     if(it.id == assessmentInstance.product.id || !Assessment.findByCustomerAndProduct(customer, it)){
                         products << it
                     }
                 }
             }
         }
        assessmentInstance.likeComment = params.likeComment
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance, products:products]
    }

    def ir = {
         def products = []
         def assessmentInstance = Assessment.get(params.id)
         if(springSecurityService.isLoggedIn()){
             def user = User.get(springSecurityService.principal.id)
             def userRole = Role.findByAuthority("ROLE_USER")
             if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                 def customer = Customer.get(springSecurityService.principal.id)
                 customer.order.products.each{
                     if(it.id == assessmentInstance.product.id || !Assessment.findByCustomerAndProduct(customer, it)){
                         products << it
                     }
                 }
             }
         }
        assessmentInstance.changeComment = params.changeComment
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance, products:products]
    }

    def complete = {
         def products = []
         def assessmentInstance = Assessment.get(params.id)
         if(springSecurityService.isLoggedIn()){
             def user = User.get(springSecurityService.principal.id)
             def userRole = Role.findByAuthority("ROLE_USER")
             if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                 def customer = Customer.get(springSecurityService.principal.id)
                 customer.order.products.each{
                     if(it.id == assessmentInstance.id || !Assessment.findByCustomerAndProduct(customer, it)){
                         products << it
                     }
                 }
             }
         }
        assessmentInstance.interestRating = params.interestRating
        assessmentInstance.save()
        if(products.size() > 0){
            return [assessmentInstance: assessmentInstance, products:products]
        } else {
            flash.message = "products < 0"
            redirect controller:"assessment", action:"broker_contact"
        }
    }

    def assess_process = {
       def products = []
       if(springSecurityService.isLoggedIn()){
           def user = User.get(springSecurityService.principal.id)
           def userRole = Role.findByAuthority("ROLE_USER")
           if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
               def customer = Customer.get(springSecurityService.principal.id)
               customer.order.products.each{
                   if(!Assessment.findByCustomerAndProduct(customer, it)){
                       products << it
                   }
               }
           }
       }
       [products:products]
    }

    def broker_contact = {

    }

    def feedback = {

    }

    def reformulations = {

    }

    def other_products = {

    }

    def rewards = {

    }

    def finish = {
        if(springSecurityService.loggedIn){
            def user = Customer.get(springSecurityService.principal.id)
        }
        flash.message = "All done!"
        redirect controller:"home", action:"index"
    }

}
