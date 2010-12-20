package com.superkids.domain

class CustomerOrderController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 23, 100)
		params.sort = params.sort ?: "dateCreated"
		params.order = params.order ?: "desc"

        [customerOrderInstanceList: CustomerOrder.list(params), customerOrderInstanceTotal: CustomerOrder.count()]
    }

    def create = {
        def customerOrderInstance = new CustomerOrder()
        customerOrderInstance.properties = params
        return [customerOrderInstance: customerOrderInstance]
    }

    def save = {
        def customerOrderInstance = new CustomerOrder(params)
        if (customerOrderInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), customerOrderInstance.id])}"
            redirect(action: "show", id: customerOrderInstance.id)
        }
        else {
            render(view: "create", model: [customerOrderInstance: customerOrderInstance])
        }
    }

    def show = {
        def customerOrderInstance = CustomerOrder.get(params.id)
		 def products = []
        if (!customerOrderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), params.id])}"
            redirect(action: "list")
        }
        else {

            customerOrderInstance.products.each{ po ->
                if(po?.product){
                    if(!Product.findByParent(po?.product))
                        products << po
                    }
                }
            }
            [customerOrderInstance: customerOrderInstance, products: products.sort{it.product?.id}]
        }


    def edit = {
        def customerOrderInstance = CustomerOrder.get(params.id)
        if (!customerOrderInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [customerOrderInstance: customerOrderInstance]
        }
    }

    def update = {
		println "in Update for CustomerOrderController"
		println params

        def customerOrderInstance = CustomerOrder.get(params.id)
        if (customerOrderInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (customerOrderInstance.version > version) {
                    
                    customerOrderInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'customerOrder.label', default: 'CustomerOrder')] as Object[], "Another user has updated this CustomerOrder while you were editing")
                    render(view: "edit", model: [customerOrderInstance: customerOrderInstance])
                    return
                }
            }

			params.orderType = params.orderType.toUpperCase()

            customerOrderInstance.properties = params
			customerOrderInstance.orderType = OrderType."${params.orderType}"
			customerOrderInstance.customer = Customer.get(params?.customer.id)

            if (!customerOrderInstance.hasErrors() && customerOrderInstance.save(flush: true)) {
				println customerOrderInstance.properties.each { key, val ->
				println "$key = $val"
				}
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), customerOrderInstance.id])}"
                redirect(action: "show", id: customerOrderInstance.id)
            }
            else {
                render(view: "edit", model: [customerOrderInstance: customerOrderInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def customerOrderInstance = CustomerOrder.get(params.id)
        if (customerOrderInstance) {
            def customerInstance = Customer.get(customerOrderInstance?.customer?.id)

			if(customerInstance){
				Assessment.findAllByCustomer(customerInstance)?.each{ it?.delete() }
				try {
					customerInstance.order = null
					customerInstance.status = CustomerStatus.HAS_NOT_ORDERED
					customerInstance.hasPlacedCurrentOrder = false
					customerInstance.save(failOnError:true)

				}
				catch (org.springframework.dao.DataIntegrityViolationException e) {
					flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), params.id])}"
					redirect(action: "show", id: params.id)
				}
			}
			customerOrderInstance.delete(flush: true)
			flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), params.id])}"
			redirect(action: "list")

        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customerOrder.label', default: 'CustomerOrder'), params.id])}"
            redirect(action: "list")
        }
    }

    def other_delete = {
        if(springSecurityService.isLoggedIn()){
            if(User.get(springSecurityService.principal.id).isAdmin()){
                def customerOrderInstance = CustomerOrder.get(params.id)
                if (customerOrderInstance) {
                    def customerInstance = Customer.get(customerOrderInstance.customer.id)
                    Assessment.findAllByCustomer(customerInstance).each{ it?.delete() }
                    try {
                        customerInstance.order = null
                        customerInstance.status = CustomerStatus.HAS_NOT_ORDERED
                        customerInstance.hasPlacedCurrentOrder = false
                        customerInstance.save(failOnError:true)
                        customerOrderInstance.delete(flush: true)
                        flash.message = "Deleted this customer's order."
                        redirect(action: "list")
                    }
                    catch (org.springframework.dao.DataIntegrityViolationException e) {
                        flash.message = "This customer's order could not be deleted."
                        redirect(action: "list")
                    }
                }
                else {
                    flash.message = "Customer order not found."
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
