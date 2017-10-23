package com.superkids.domain

class CustomerController {

	def springSecurityService
    def userService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    static def states = ['AL','AK','AZ','AR',' CA','CO','CT','DE','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME',
            'MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA',
            'RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY']

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = 150
        params.offset = params?.offset ?: 0

        params.sort = params?.sort ?: "seq"

        [customerInstanceList: Customer.list(params), customerInstanceTotal: Customer.count(), sort:params?.sort, max: params.max, offset: params?.offset]
    }

    def create = {

        def customerInstance = new Customer()
		customerInstance.address = new Address()
		customerInstance.deliveryAddress = new Address()

        customerInstance.properties = userService.bindParams(params)
        return [ customerInstance: customerInstance, states: states, sponsors: Sponsor.findAllByInactive(false).sort {it.name}, statusList: ['HAS_NOT_ORDERED':'HAS NOT ORDERED', 'HAS_ORDERED':'HAS ORDERED']]
    }

	def save = {
        println "saving a new customer through admin site"
        println params

		def customerInstance = new Customer()

        customerInstance.properties = userService.bindParams(params)
		customerInstance.with {
            username = params.email
            password = springSecurityService.encodePassword('superkids')
            enabled = true
            accountExpired = false
            accountLocked = false
            passwordExpired = false
        }

		if(customerInstance.save(flush: true)){
            def userRole = Role.findByAuthority("ROLE_USER")
			UserRole.create customerInstance, userRole, true
			println "we just saved a new customer. (pause for deafening applause.) username: " + customerInstance.username + "; email: " + customerInstance.email + "; password: " + params.password
			flash.message = "Customer account created."
            redirect(action: "edit", id: customerInstance.id)
		} else {
            println "customer save action: save failed"
			flash.message = "There were errors in saving the customer's information."
			customerInstance.errors.allErrors.each {
				println it
				println " "
			}
            render(view: "create", model: [customerInstance: customerInstance, states:states, sponsors: Sponsor.findAllByInactive(false).sort {it.name}])
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
			def customerCalls = []
			customerCalls = Call.findAllByCustomer(customerInstance, [sort:"dateCreated", order:"desc"])
			println customerCalls

            if(customerInstance.status == CustomerStatus.HAS_NOT_ORDERED) {
                products = Product.findAllByLiveProduct(true)
                return [customerInstance: customerInstance, products: products.findAll{!it.parent}, customerCalls: customerCalls,
						rController:params?.rController, rAction:params?.rAction, sort:params?.sort, offset:params?.offset, query:params?.query]
            } else {
                customerInstance.customerOrder?.products?.each { productOrder ->
                    if(productOrder?.received && productOrder?.product){
						if(!Product.findByParent(productOrder?.product)){
                            products << productOrder
						}
                    }
                }
                return [customerInstance: customerInstance, products: products?.sort{it?.product?.id}, customerCalls: customerCalls,
						rController:params?.rController, rAction:params?.rAction, sort:params?.sort, offset:params?.offset, query:params?.query]
            }
    	}
	}

    def edit = {
		println "in Edit for CustomerController"
		println params

         def broker = null
         if(params.brokerId){
             broker = Broker.get(params.brokerId)
         }

        def customerInstance = Customer.get(params.id)
        if (!customerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
            redirect(action: "list")
        }
        else {
            def statusList = [CustomerStatus.HAS_NOT_ORDERED, CustomerStatus.HAS_ORDERED, CustomerStatus.QUALIFIED]
            def products = []
            if(!customerInstance.customerOrder) {
                products = Product.findAllByParentIsNullAndLiveProduct(true)

                return [customerInstance: customerInstance, products: products, states: states, broker:broker, statusList:statusList,
				rController:params?.rController, rAction:params?.rAction, sort:params?.sort, offset:params?.offset, query:params?.query]
            } else {
                customerInstance?.customerOrder?.products?.each { productOrder ->
					if(productOrder?.received && productOrder?.product){
						if(!Product.findByParent(productOrder.product))
                            products << productOrder
                    }
					}

                }
                return [customerInstance: customerInstance, products: products.sort{it.product?.id}, states: states, broker:broker, statusList:statusList,
						rController:params?.rController, rAction:params?.rAction, sort:params?.sort, offset:params?.offset, query:params?.query]
          }
    }

    def update = {
		println "In Update for CustomerController"
		println params

		def rController = params?.rController ?: "customer"
		def rAction = params?.rAction ?: "list"

        def customerInstance = Customer.get(params.id)
        if (customerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (customerInstance.version > version) {

                    customerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'customer.label', default: 'Customer')] as Object[], "Another user has updated this Customer while you were editing")
                    render(view: "edit", model: [customerInstance: customerInstance,
						rController:rController, rAction:rAction, sort:params?.sort, offset:params?.offset, query:params?.query])
                    return
                }
            }
            customerInstance.properties = userService.bindParams(params)

            if(params.status){
                customerInstance.status = CustomerStatus."${params.status}"
            }
            if(params.email){
                def user = User.get(params.id)
                user.username = params.email
                if(!user.save(flush:true)) {
					flash.message = "invalid data!"
                    user.errors.allErrors.each { println it }
					redirect action:'edit', id:customerInstance?.id
					return
				}
            }
            if(customerInstance.save(flush: true)){
                flash.message = "Updated profile for customer ${customerInstance.district}"
                redirect(controller: rController, action: rAction, params:[sort:params?.sort, offset:params?.offset, query:params?.query])
            } else {
                customerInstance.errors.allErrors.each { println it }
                flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
                redirect(action: "list")
            }
        }
    }

    def delete = {
        def customerInstance = Customer.get(params.id)
        if (customerInstance) {
            try {
                customerInstance.deleted = true
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
                redirect(action: "edit", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
            redirect(action: "list")
        }
    }

    def findSchoolDistrict = {
		println "in FindSchoolDistrict for CustomerController"
		println params

		def sort = params?.sort ?: "seq"

        if(params.query){
			def customers = []
            Customer.search(params?.query, [max:100]).results?.each {
                def customer =	Customer.get(it.id)
                if(customer && !customer?.deleted){
                    customers << customer
                }

            }
            if(customers){
                return [customerInstanceList:customers, sort:params?.sort, offset:params?.offset, query:params.query]
            } else {
                flash.message = "No results found for \"${params.query}.\" <a href=\"${createLink(controller:'customer', action:'list')}\">Back to customer list &crarr;</a>"
                return
            }
        } else {
            flash.message = "Please enter a name or email to search for."
            redirect action: "list"
        }
    }

    def add_order = {
		println "in Add_Order for CustomerController"
		params.each {key, val ->
			println "$key = $val"
		}
        def admin = Admin.get(springSecurityService.principal.id)
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
			if(order?.products?.size() < 1) {
				def p = Product.get(params.product)
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

			customer.customerOrder = order
			customer.hasPlacedCurrentOrder = true
			customer.status = CustomerStatus.HAS_ORDERED
			customer.save(failOnError:true)

            flash.message = "Added selected products to customer's order."
            println "admin " + admin?.firstName + " " + admin?.lastName + " placed order for customer " + customer.fsdName
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
                        customerInstance.delete()
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
        def id
        def customerInstance = Customer.get(params.id)
        def controller = params.rController
        def action = params.rAction
        def nc = params.newCustomer
        id = params.rId
        if (customerInstance){
            customerInstance.newCustomer = nc == 'true'
            customerInstance.save()
        }
        println "Q: Is customer " + customerInstance.fsdName + " new?"
        println "A: " + customerInstance.newCustomer
        redirect controller:controller, action:action, id:id, params: [sort:params?.sort ?: "seq", offset: params?.offset, query: params?.query ]
    }

	def toggleDuplicate = {
		println "toggling Duplicate"
		println params
		def customerInstance = Customer.get(params.id)
		def controller = params.rController
		def action = params.rAction
		def dc = params.duplicate
		def id = params.rId
		if (customerInstance){
			customerInstance.duplicate = dc == 'true'
			if(!customerInstance.save()) {
				customer.errors.alErros.each {println it}
			}
		}
		println "Q: Is customer " + customerInstance.fsdName + "  a duplicate?"
		println "A: " + customerInstance.duplicate
		redirect controller:controller, action:action, id:id, params: [sort:params?.sort ?: "seq", offset: params?.offset, query: params?.query ]
	}


	def toggleDidNotReceive = {
            println 'in toggleDidNotReceive'

            def productOrderInstance = ProductOrder.get(params.id)
            def customer = Customer.get(productOrderInstance.order.customer.id)
            def products = []
            if (productOrderInstance){
                productOrderInstance.received = params.didNotReceive == 'false'
                productOrderInstance.save(failOnError:true)

                customer.customerOrder.products.findAll{ it.received == true }.each{
                    def p = Product.get(it.product.id)
                    if(!customer.assessments.find{ it.product.id == p.id }){
                        products << p
                    }
                }

                if(products.find{!Product.findByParent(it)}){
                } else {
                    customer.status = CustomerStatus.QUALIFIED
                    customer.hasCompletedCurrentAssessment = true	
                    customer.save(failOnError:true)                
                }
        }
        println "Q: Is customer " + customer.fsdName + "'s order of " + productOrderInstance + " received?"
        println "A: " + productOrderInstance.received
        render ''
    }

    def toggleDidNotSample = {
               println 'in toggleDidNotSample'

               def productOrderInstance = ProductOrder.get(params.id)
               def customer = Customer.get(productOrderInstance.order.customer.id)
               def products = []
               if (productOrderInstance){
                   productOrderInstance.sampled = params.didNotSample == 'false'
                   productOrderInstance.save(failOnError:true)

                   customer.customerOrder.products.findAll{ it.sampled }.each{
                       def p = Product.get(it.product.id)
                       if(!customer.assessments.find{ it.product.id == p.id }){
                           products << p
                       }
                   }

                   if(!products.find{!Product.findByParent(it)}){
                       customer.status = CustomerStatus.QUALIFIED
                       customer.hasCompletedCurrentAssessment = true
                       customer.save(failOnError:true)
                   }
           }
           println "Q: Is customer " + customer.fsdName + "'s order of " + productOrderInstance + " sampled?"
           println "A: " + productOrderInstance.sampled
           render ''
       }


	def adminAssessProduct = {
		println 'in adminAssessProduct for CustomerController'
        println params.didNotReceive
		def pOrder = ProductOrder.get(params.productOrderId)

		if(pOrder) {
            
            if (params.didNotReceive) {
                pOrder.received = false
            } else {

                def assessment = new Assessment(params)
                def customer = Customer.get(pOrder.order.customer.id)
                def product = Product.get(pOrder.product.id)

                assessment.product = product
                assessment.favorite = params?.favorite
                assessment.type = Enum.valueOf(OrderType.class, params.orderType)
                assessment.completed = true

                customer.addToAssessments(assessment)

                customer.save(failOnError:true)

                def products = []

                customer.customerOrder.products.findAll{ it.received == true }.each{
                    def p = Product.get(it.product?.id)
                    if(!customer.assessments.find{ it?.product?.id == p?.id }){
                        products << p
                    }
                }

                if(products.find{!Product.findByParent(it)}){
                    redirect action:edit, id:customer.id
                } else {
                    //customer.status = CustomerStatus.QUALIFIED
                    //customer.hasCompletedCurrentAssessment = true
                    redirect action:edit, id:customer.id
                }

            }
 
		} else {
			flash.message = "Product not found"
			redirect action:index
		}
	}

    def completeAssessment = {
        println "in completeAssessment for CustomerController"

        def customer = Customer.get(params?.id)

        if(customer) {
			customer.properties = userService.bindParams(params)
            customer.programFeedback = params?.programFeedback
            customer.otherProducts = params?.otherProducts
            customer.reformulations = params?.reformulations

           if(customer.save(flush:true)) {
              customer.hasCompletedCurrentAssessment = true
              customer.status = CustomerStatus.QUALIFIED
              flash.message = "Assessment Completed!"

           } else {
               customer.errors.allErrors.each {println it}
               flash.message = "Invalid input - assessment not completed"
           }

           redirect action:edit, id:customer.id
        }

        else {
          flash.message = "Cannot find customer"
          redirect action:list
        }


    }


}
