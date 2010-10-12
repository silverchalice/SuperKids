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
        println "params coming into the start action are: " + params
        if(springSecurityService.loggedIn) {
            def user = User.get(springSecurityService.principal.id)
            def userRole = Role.findByAuthority("ROLE_USER")
            def products = []
            if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                def product = Product.get(params.id)
                def customer = Customer.get(springSecurityService.principal.id)
                if(customer.order.products.collect{it.id}.contains(product.id)){
                    def assessmentInstance = new Assessment(product:product)
                    println "right after we created it, the assessmentInstance's id is already " + assessmentInstance.id
                    customer.order.products.each{
                        def p = Product.get(it.product.id)
                        if(!Assessment.findByCustomerAndProduct(customer, p)){
                            products << p
                        }
                    }
                    if(products){
                        println "the assessmentInstance is " + assessmentInstance + ", and the id is " + params.id
                        return [id:params.id, products:products.sort{ it.id }, customerId:user.id]       
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
         println "params coming into lc: " + params
         def customer = Customer.get(params.customerId)
         if(springSecurityService.isLoggedIn()){
             def product = Product.get(params.productId)
             def products = []
             def user = User.get(springSecurityService.principal.id)
             def userRole = Role.findByAuthority("ROLE_USER")
             if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                 customer.order.products.each{
                     def p = Product.get(it.product.id)
                     if(!Assessment.findByCustomerAndProduct(customer, p)){
                         products << p
                     }
                 }
            }
            def assessmentInstance = new Assessment(likeRating:params.likeRating, product:product)
            assessmentInstance.properties = params
            customer.addToAssessments(assessmentInstance)
            customer.save(failOnError:true)
            return [assessmentInstance: assessmentInstance, products:products.sort{ it.id }]
        } else {
            flash.message = "Please log in.."
            redirect controller:"home", action:"index"
        }
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
                     def p = Product.get(it.product.id)
                     if(p.id == assessmentInstance.product.id || !Assessment.findByCustomerAndProduct(customer, p)){
                         products << p
                     }
                 }
             }
         }
        assessmentInstance.likeComment = params.likeComment
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance, products:products.sort{ it.id }]
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
                     def p = Product.get(it.product.id)
                     if(p.id == assessmentInstance.product.id || !Assessment.findByCustomerAndProduct(customer, p)){
                         products << p
                     }
                 }
             }
         }
        assessmentInstance.changeComment = params.changeComment
        assessmentInstance.save()
        return [assessmentInstance: assessmentInstance, products:products.sort{ it.id }]
    }

    def complete = {
         println "params.iRating is " + params.iRating
         def products = []
         def assessmentInstance = Assessment.get(params.id)
         if(springSecurityService.isLoggedIn()){
             def user = User.get(springSecurityService.principal.id)
             def userRole = Role.findByAuthority("ROLE_USER")
             if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
                 def customer = Customer.get(springSecurityService.principal.id)
                 customer.order.products.each{
                     def p = Product.get(it.product.id)
                     if(p.id == assessmentInstance.id || !Assessment.findByCustomerAndProduct(customer, p)){
                         products << p
                     }
                 }
             }
         }
        assessmentInstance.iRating = params.iRating.toInteger()
        assessmentInstance.save()
        println "and now the assessmentInstance's iRating is " + assessmentInstance.iRating
        if(products.size() > 0){
            return [assessmentInstance: assessmentInstance, products:products.sort{ it.id }]
        } else {
            flash.message = "products < 0"
            redirect controller:"assessment", action:"broker_contact"
        }
    }

    def assess_process = {
       println "foo..."
       def products = []
       if(springSecurityService.isLoggedIn()){
           def user = User.get(springSecurityService.principal.id)
           def userRole = Role.findByAuthority("ROLE_USER")
           println "...bar..."
           if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
               println "...bas"
               def customer = Customer.get(springSecurityService.principal.id)
               customer.order.products.each{
                   def p = Product.get(it.product.id)
                   if(!Assessment.findByCustomerAndProduct(customer, p) && (it.received == true)){
                       products << p
                   }
               }
           }
       }
       [products:products.sort{ it.id }]
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

    def dnr = {
        println "in dnr action.."
        def customerInstance = Customer.get(springSecurityService.principal.id)
        println "the customer is " + customerInstance
        def product = Product.get(params.id)
        def productOrder = ProductOrder.findByProductAndOrder(product, customerInstance.order)
        println "the product is " + product + ", and the productOrder is " + productOrder
        if(productOrder){
            productOrder.received = false
        }
        productOrder.save(failOnError:true)
        redirect controller:"assessment", action:"assess_process"
    }

}
