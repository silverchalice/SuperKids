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
            def products = []
            if(customerInstance.status == CustomerStatus.HAS_NOT_ORDERED) {
                products = Product.list()
                return [customerInstance: customerInstance, products: products.findAll{!it.parent}]
            } else {
                customerInstance.order.products.each { productOrder ->
                    if(productOrder.received && !Product.findByParent(productOrder.product))
                        products << productOrder
                    }
                }
                return [customerInstance: customerInstance, products: products.sort{it.product?.id}]
            }
    }

    def edit = {
         def broker = null
         if(params.brokerId){
             broker = Broker.get(params.brokerId)
         }
         def states=['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
			  'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
			  'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
			  'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
			  'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
			  'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
			  'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
			  'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
			  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
			  'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
        def customerInstance = Customer.get(params.id)
        if (!customerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
            redirect(action: "list")
        }
        else {
            def products = []
            if(customerInstance.status == CustomerStatus.HAS_NOT_ORDERED) {
                products = Product.list()
                return [customerInstance: customerInstance, products: products.findAll{!it.parent}, states: states, broker:broker]
            } else {
                customerInstance.order.products.each { productOrder ->
                    if(productOrder.received && !Product.findByParent(productOrder.product))
                        products << productOrder
                    }
                }
                return [customerInstance: customerInstance, products: products.sort{it.product?.id}, states: states, broker:broker]
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
            if(params.email){
                def user = User.get(params.id)
                user.username = params.email
                user.save(failOnError:true)
            }
            if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {
                flash.message = "Your profile was updated"
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

        def shippingDate = ShippingDate.findByShipDate(params.shippingDate)
        def oo = Enum.valueOf(OrderType.class, params.orderType)
        def customer = Customer.get(params.id)
        if(customer) {
			def order = new CustomerOrder(shippingDate:shippingDate, orderType:oo)
			params.product.each {
				def p = Product.get(it)
				if(p){
					def productOrder = new ProductOrder(product:p)
					order.addToProducts(productOrder)
                                        if(Product.findByParent(p)){
                                            Product.findAllByParent(p).each{
                                                def po = new ProductOrder(product:it)
                                                order.products.each { println it }
                                                order.addToProducts(po)
                                                order.products.each { println it }
                                            }
                                        }
				}
			}
			customer.order = order
			customer.hasPlacedCurrentOrder = true
			customer.status = CustomerStatus.HAS_ORDERED
			customer.save(failOnError:true)
			println "customer.hasPlacedCurrentOrder: " + customer.hasPlacedCurrentOrder

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
            def customer = Customer.get(productOrderInstance.order.customer.id)
            def products = []
            if (productOrderInstance){
                productOrderInstance.received = params.didNotReceive == 'false'
                productOrderInstance.save(failOnError:true)

                customer.order.products.findAll{ it.received == true }.each{
                    def p = Product.get(it.product.id)
                    if(!customer.assessments.find{ it.product.id == p.id }){
                        products << p
                    }
                }

                if(products.find{!Product.findByParent(it)}){
                    println "still more products"
                } else {
                    customer.status = CustomerStatus.QUALIFIED
                    customer.hasCompletedCurrentAssessment = true	
                    customer.save(failOnError:true)                
                }
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

			customer.addToAssessments(assessment)

			customer.save(failOnError:true)

                        def products = []

                        customer.order.products.findAll{ it.received == true }.each{
                            def p = Product.get(it.product.id)
                            if(!customer.assessments.find{ it.product.id == p.id }){
                                products << p
                            }
                        }

                        if(products.find{!Product.findByParent(it)}){
                            redirect action:edit, id:customer.id
                        } else {
                            customer.status = CustomerStatus.QUALIFIED
                            customer.hasCompletedCurrentAssessment = true	                
                            redirect action:edit, id:customer.id
                        }
 
		} else {
			flash.message = "Product not found"
			println flash.message
			redirect action:index
		}
	}

}
