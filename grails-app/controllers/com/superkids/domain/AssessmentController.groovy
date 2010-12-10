package com.superkids.domain

class AssessmentController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {

		def customers = []

		Customer.findAllByStatus(CustomerStatus.HAS_ORDERED).each{ c ->
 			customers << c
		}
		Customer.findAllByStatus(CustomerStatus.QUALIFIED).each{ qc ->
 			customers << qc
		}
		//customers << Customer.findAllByStatus(CustomerStatus.HAS_ORDERED)
		//customers << Customer.findAllByStatus(CustomerStatus.QUALIFIED)

        [customerInstanceList: customers, customerInstanceTotal: customers.size()]
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

	def viewAssessment = {
		println "in ViewAssessment for AssessmentController"
		println params
		def customer = Customer.get(params.id)
		def assessments = Assessment.findAllByCustomerAndCompleted(customer, true)
		assessments.each { println "Assessment for product it.product"}

		println "$customer has $assessments.size() assessments"

		[ customer: customer, assessments: assessments ]
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
        def products = []
        def customer = Customer.get(springSecurityService.principal.id)
        if(customer.order){
            def product = Product.get(params.id)
            println "customer " + customer?.fsdName + "is assessing " + product
            if(customer.order.products*.product.collect{it.id}.contains(product.id)){
                def assessmentInstance = new Assessment(product:product)
                customer.order.products.findAll{ it.received == true }.each{
                    def p = Product.get(it.product.id)
                    if(!Assessment.findByCustomerAndProduct(customer, p) && !Product.findByParent(p)){
                        products << p
                    }
                }
                if(products){
                    println "the assessmentInstance is " + assessmentInstance + ", and the id is " + params.id
                    return [id:params.id, products:products.sort{ it.id }, customerId:customer.id, product: product]       
                } else {
                    flash.message = "You have assessed all of the products that you ordered."
                    redirect controller:"home", action:"assess"
                }
            } else {
                flash.message = "You didn't order ${product.name}."
                redirect controller:"home", action:"assess"
            }
        } else {
            flash.message = "Did you order anything yet?"
            redirect controller:"home", action:"assess"
        }
    }

    def lc = {
         def customer = Customer.get(params.customerId)
         def product = Product.get(params.productId?.toInteger())
         def products = []
         if(customer.order){
             customer.order.products.findAll{ it.received == true }.each{
                 def p = Product.get(it.product.id)
                 if(!Assessment.findByCustomerAndProduct(customer, p) && !Product.findByParent(p)){
                     products << p
                 }
             }
         }
         def assessmentInstance = new Assessment(likeRating:params.likeRating, product:product, type:OrderType.WEB)
         Assessment.findAllByCompleted(false).each{
             if(it.id != assessmentInstance.id){
                 try {
                     it.delete(flush: true)
                 }
                 catch (org.springframework.dao.DataIntegrityViolationException e) {
                     log.error e
                 }
             }
         }
         assessmentInstance.properties = params
         customer.addToAssessments(assessmentInstance)
         customer.save(failOnError:true)
         return [assessmentInstance: assessmentInstance, products:products.sort{ it.id }]
    }

    def cc = {
         def products = []
         def assessmentInstance = Assessment.get(params.id)
         Assessment.findAllByCompleted(false).each{
             if(it.id != assessmentInstance.id){
                 try {
                     it.delete(flush: true)
                 }
                 catch (org.springframework.dao.DataIntegrityViolationException e) {
                     log.error e
                 }
             }
         }
         def customer = Customer.get(springSecurityService.principal.id)
         if(customer.order){
             customer.order.products.findAll{ it.received == true }.each{
                 def p = Product.get(it.product.id)
                 if(p.id == assessmentInstance.product.id || !Assessment.findByCustomerAndProduct(customer, p) && !Product.findByParent(p)){
                     products << p
                 }
             }
         }
        assessmentInstance.likeComment = params.likeComment
        customer.save(failOnError:true)
        return [assessmentInstance: assessmentInstance, products:products.sort{ it.id }]
    }

    def ir = {
         def products = []
         def assessmentInstance = Assessment.get(params.id)
         Assessment.findAllByCompleted(false).each{
             if(it.id != assessmentInstance.id){
                 try {
                     it.delete(flush: true)
                 }
                 catch (org.springframework.dao.DataIntegrityViolationException e) {
                     log.error e
                 }
             }
         }
         def customer = Customer.get(springSecurityService.principal.id)
         if(customer.order){
             customer.order.products.findAll{ it.received == true }.each{
                 def p = Product.get(it.product.id)
                 if(p.id == assessmentInstance.product.id || !Assessment.findByCustomerAndProduct(customer, p) && !Product.findByParent(p)){
                     products << p
                 }
             }
          }
          assessmentInstance.changeComment = params.changeComment
          customer.save(failOnError:true)
          return [assessmentInstance: assessmentInstance, products:products.sort{ it.id }]
     }

    def complete = {
         def products = []
         def assessmentInstance = Assessment.get(params.id)
         Assessment.findAllByCompleted(false).each{
             if(it.id != assessmentInstance.id){
                 try {
                     it.delete(flush: true)
                 }
                 catch (org.springframework.dao.DataIntegrityViolationException e) {
                     log.error e
                 }
             }
         }
         def customer = Customer.get(springSecurityService.principal.id)
         if(customer.order){
             customer.order.products.findAll{ it.received == true }.each{
                 def p = Product.get(it.product.id)
                 if(!Assessment.findByCustomerAndProduct(customer, p) && !Product.findByParent(p)){
                     products << p
                 }
             }
         }
         assessmentInstance.iRating = params.iRating?.toInteger()
         assessmentInstance.completed = true
         customer.save(failOnError:true)
         if(products.size() > 0){
             return [assessmentInstance: assessmentInstance, products:products.sort{ it.id }]
         } else {
             redirect controller:"assessment", action:"broker_contact"
         }
    }

    def assess_process = {
         Assessment.findAllByCompleted(false).each{
             try {
                 it.delete(flush: true)
             }
             catch (org.springframework.dao.DataIntegrityViolationException e) {
                 log.error e
             }
         }
       def products = []
       if(springSecurityService.isLoggedIn()){
           def user = User.get(springSecurityService.principal.id)
           def userRole = Role.findByAuthority("ROLE_USER")
           if(user && UserRole.findByUserAndRole(user, userRole) && user.order){
               user.order.products.each{
                   def p = Product.get(it.product.id)
                   if(!Assessment.findByCustomerAndProduct(user, p) && it.received == true && !Product.findByParent(p)){
                       products << p
                   }
               }
           }
       }
       [products:products.sort{ it.id }]
    }

    def broker_contact = {
        def customerInstance = Customer.get(springSecurityService.principal.id)
        [customerInstance:customerInstance]
    }

    def feedback = {
        def customerInstance = Customer.get(springSecurityService.principal.id)
        customerInstance.properties = params
        customerInstance.save(failOnError:true)
        [customerInstance:customerInstance]
    }

    def reformulations = {
        def customerInstance = Customer.get(springSecurityService.principal.id)
        customerInstance.properties = params
        customerInstance.save(failOnError:true)
        [customerInstance:customerInstance]
    }

    def other_products = {
        def customerInstance = Customer.get(springSecurityService.principal.id)
        customerInstance.properties = params
        customerInstance.save(failOnError:true)
        [customerInstance:customerInstance]
    }

    def rewards = {
        def customerInstance = Customer.get(springSecurityService.principal.id)
        customerInstance.properties = params
		customerInstance.status = CustomerStatus.QUALIFIED
        customerInstance.save(failOnError:true)
        [customerInstance:customerInstance]
    }

    def finish = {
        if(springSecurityService.loggedIn){
            def user = Customer.get(springSecurityService.principal.id)
        }

        redirect controller:"home", action:"promote"
    }

    def dnr = {
        def products = []
        def customerInstance = Customer.get(springSecurityService.principal.id)
        def product = Product.get(params.id)
        println "customer " + customerInstance?.fsdName + " did not receive " + product
        def productOrder = ProductOrder.findByProductAndOrder(product, customerInstance.order)
        productOrder.received = false
        productOrder.save(failOnError:true)
        customerInstance.order.products.findAll{ it.received == true }.each{
            def p = Product.get(it.product.id)
            if(!Assessment.findByCustomerAndProduct(customerInstance, p) && !Product.findByParent(p)){
                products << p
            }
        }
        if(products.size() > 0){
            redirect controller:"assessment", action:"assess_process"
        } else {
            redirect controller:"assessment", action:"broker_contact"
        }
    }

}
