package com.superkids.domain
import com.superkids.domain.OrderType

class CustomerController {

	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 16, 100)
        [customerInstanceList: Customer.list(params), customerInstanceTotal: Customer.count()]
    }

    def create = {
        def customerInstance = new Customer()
		customerInstance.address = new Address()
		customerInstance.deliveryAddress = new Address()
		customerInstance.broker = new Broker()

        customerInstance.properties = params
        return [customerInstance: customerInstance]
    }

	def save = {
		def customerInstance = new Customer(params)
		customerInstance.username = params.email
		customerInstance.password = springSecurityService.encodePassword(params.password)
		customerInstance.enabled = true
		customerInstance.accountExpired = false
		customerInstance.accountLocked = false
		customerInstance.passwordExpired = false
		def userRole = Role.findByAuthority("ROLE_USER")
		if(customerInstance.save()){
			UserRole.create customerInstance, userRole, true
			println "we just saved a user. (pause for deafening applause.) this user's username is " + customerInstance.username + "; its email address is " + customerInstance.email + "; its password is " + params.password + "."
			flash.message = "Your account was created."
            redirect(action: "show", id: customerInstance.id)
		} else {
			flash.message = "I was just flying along, and I blew up."
			customerInstance.errors.allErrors.each {
				println it
				println " "
			}
            render(view: "create", model: [customerInstance: customerInstance])
		}
	}

    def show = {
        def customerInstance = Customer.get(params.id)
        if (!customerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
            redirect(action: "list")
        }
        else {
            [customerInstance: customerInstance]
        }
    }

    def edit = {
        def customerInstance = Customer.get(params.id)
        if (!customerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
            redirect(action: "list")
        }
        else {
			def products = []
			if(customerInstance.status == CustomerStatus.HAS_NOT_ORDERED) {
				products = Product.list()
			} else {
				customerInstance.order.products.each { productOrder ->
					if(productOrder.received)
						products << productOrder
				}
			}

            return [customerInstance: customerInstance, products: products]
        }
    }

    def update = {
        def customerInstance = Customer.get(params.id)
        if (customerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (customerInstance.version > version) {

                    customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'customer.label', default: 'Customer')] as Object[], "Another user has updated this Customer while you were editing")
                    render(view: "edit", model: [customerInstance: customerInstance])
                    return
                }
            }
            customerInstance.properties = params
            if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])}"
                redirect(action: "show", id: customerInstance.id)
            }
            else {
                render(view: "edit", model: [customerInstance: customerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def customerInstance = Customer.get(params.id)
        if (customerInstance) {
            try {
                customerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
            redirect(action: "list")
        }
    }

    def findSchoolDistrict = {
        if(params.query){
            def customers = Customer.search(params.query).results
            if(customers){
                return [customerInstanceList:customers]
            } else {
                flash.message = "No results found for \"${params.query}.\""
                return
            }
        } else {
            flash.message = "Please enter a name or email to search for."
            redirect action: "list"
        }
    }

    def add_order = {
        println "the params in add_order are " + params
        def pr
        def sd = ShippingDate.get(params.reqShipDate)
        def oo = OrderType."${params.OrderOrigin}"
        def customer = Customer.get(params.id)
        if(customer){
            if(customer.order){
                params.product.each {
                    def pLong = it.toLong()
                    println pLong.class
                    println it.class
                    if(!customer.order.products.collect{it.product.id}.contains(it))
                    pr = com.superkids.domain.Product.get(it.toLong())
                    Product.list().each { println it }
                    println "foo! bar!"
                    if(pr){
                        "bar! bas!"
                        println "pr is " + pr
                        println "earlier the order had " + customer.order.products
                        def productOrder = new ProductOrder(product:pr)
                        println "the productOrder is " + productOrder
                        customer.order.addToProducts(productOrder)
                        println "now the order has " + customer.order.products
                    }
                }
            } else {
                def order = new CustomerOrder(shippingDate:sd, orderType:oo)
                params.product.each {
                    def p = Product.get(it)
                    if(p){
                        def productOrder = new ProductOrder(product:p)
                        order.addToProducts(productOrder)
                    }
                }
                customer.order = order
                customer.hasPlacedCurrentOrder = true
                customer.save(failOnError:true)
                println "customer.hasPlacedCurrentOrder: " + customer.hasPlacedCurrentOrder
            }
            flash.message = "Added selected products to customer's order."
            println "here's the customer's order: "
            customer.order.products.each{ println it }
            redirect action:"edit", id:customer.id
        } else {
            flash.message = "Couldn't find that customer record."
            redirect action:"list"
        }
    }

    def other_delete = {
        if(springSecurityService.isLoggedIn()){
            if(User.get(springSecurityService.principal.id).isAdmin()){
                def customerInstance = Customer.get(params.id)
                def userRole = Role.findByAuthority("ROLE_USER")
                if (customerInstance) {
                    UserRole.findByUserAndRole(customerInstance, userRole).delete()
                    try {
                        customerInstance.delete(flush: true)
                        flash.message = "Deleted this customer record."
                        redirect(action: "list")
                    }
                    catch (org.springframework.dao.DataIntegrityViolationException e) {
                        flash.message = "This customer record could not be deleted."
                        redirect(action: "list")
                    }
                }
                else {
                    flash.message = "Customer record not found."
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

    def toggleNew = {
        def customerInstance = Customer.get(params.id)
        if (customerInstance){
            customerInstance.newCustomer = params.newCustomer == 'true'
            customerInstance.save()
        }
        println "the customerInstance's newCustomer is " + customerInstance.newCustomer
        render ''
    }


	def toggleDidNotReceive = {
		println 'in ToggleDidNotReceive'
		println params
        def productOrderInstance = ProductOrder.get(params.id)
        if (productOrderInstance){
            productOrderInstance.received = params.didNotReceive == 'false'
            productOrderInstance.save()
        }
        println "the productOrderInstance's received is " + productOrderInstance.received
        render ''
    }

	def adminAssessProduct = {
		println 'in AdminAssessProduct for CustomerController'
		params.each { key, val ->
			println "$key : $val"
		}

		def pOrder = ProductOrder.get(params.productOrderId)

		if(pOrder) {
			println "Product Order found"
			def assessment = new Assessment(params)
			def customer = Customer.get(pOrder.order.customer.id)
			def product = Product.get(pOrder.product.id)

			assessment.product = product
			assessment.type = Enum.valueOf(OrderType.class, params.orderType)
			assessment.completed = true
			assessment.properties.each { println it }

			customer.addToAssessments(assessment)

			

			customer.save()


			redirect action:edit, id:customer.id
		} else {
			flash.message = "Product not found"
			println flash.message
			redirect action:index
		}
	}

}
