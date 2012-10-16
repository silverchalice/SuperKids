package com.superkids.domain

class AssessmentController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        println "entering assessment:index..."
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
        println "entering assessment:save..."
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
		def dnrProducts = []
		customer.customerOrder.products.each{
			if(!it.received){ dnrProducts << it }
		}
		assessments.each { println "Assessment for product it.product"}

		println "$customer has $assessments.size() assessments"

		[ customer: customer, assessments: assessments, dnrProducts: dnrProducts ]
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
		println "in delete for AssessmentController"
        def assessmentInstance = Assessment.get(params.id)
        if (assessmentInstance) {
            try {
				println "deleting an assessment"
                def customer = assessmentInstance.customer
                customer.removeFromAssessments(assessmentInstance)

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
            println "Couldn't find assessment..."
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'assessment.label', default: 'Assessment'), params.id])}"
            redirect(action: "list")
        }
    }

    def start = {
        println "entering assessment:start..."
        if(springSecurityService.isLoggedIn()){

            def products = []
            def customer = Customer.get(springSecurityService.principal.id)

            if (!customer.hasCompletedCurrentAssessment) {
                if(customer?.customerOrder){
                    customer.customerOrder?.products?.each{
                        def p = Product.get(it?.product?.id)
                        if(!Assessment.findByCustomerAndProduct(customer, p) && it.received && !Product.findByParent(p)){
                            products << p
                        }
                    }
                    [products:products?.sort{ it.id }]
                }  else {
                    flash.message = "No order found"
                    redirect controller:"home", action:"assess"
                }
            } else {
                flash.message = "Your assessments have already been received - thank you for your feedback!"
                redirect controller:"home", action:"assess"
            }

        } else {
            redirect(uri: "/")
        }
    }

    def saveAssessments = {
        println "entering assessment:saveAssessments..."

        def customer = Customer.get(springSecurityService.principal.id)

        Product.list().each { product ->

            if (params.assessment."${product.id}") {

                if(params.assessment."${product.id}".didNotReceive) {
                    println "did not receive"
                    def po = ProductOrder.findByOrderAndProduct(customer.customerOrder, product)
                    po.received = false
                    po.save()
                } else if(params.assessment."${product.id}".didNotSample) {
                    println "did not sample"
                    def po = ProductOrder.findByOrderAndProduct(customer.customerOrder, product)
                    po.sampled = false
                    po.save()
                } else {

                    println customer.fsdName + " is saving an assessment of " + product
                    println params?.assessment?."${product.id}"?.likeRating
                    println params?.assessment?."${product.id}"?.likeComment
                    println params?.assessment?."${product.id}"?.changeComment

                    def assessment = new Assessment(
                            likeRating: params?.assessment?."${product.id}"?.likeRating,
                            likeComment: params?.assessment?."${product.id}"?.likeComment,
                            changeComment: params?.assessment?."${product.id}"?.changeComment,
                            favorite: params?.assessment?."${product.id}"?.favorite ?: null,
                            product: product,
                            type: OrderType.WEB,
                            completed: true
                    )

                    if(customer.addToAssessments(assessment)) {
                        println "added assessment"
                    } else {
                        println "surprise! something went wrong"
                    }
                }
            }
        }

        customer.status = CustomerStatus.QUALIFIED
        customer.hasCompletedCurrentAssessment = true
        customer.save(flush: true)

        redirect action: 'survey'

    }


    def survey = {


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
		customerInstance.hasCompletedCurrentAssessment = true
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
        def productOrder = ProductOrder.findByProductAndOrder(product, customerInstance.customerOrder)
        productOrder.received = false
        productOrder.save(failOnError:true)
        customerInstance.customerOrder.products.findAll{ it.received }.each{
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
