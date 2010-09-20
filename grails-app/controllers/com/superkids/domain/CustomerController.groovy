package com.superkids.domain

import com.superkids.domain.Product
import com.superkids.domain.UserRole

class CustomerController {

	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
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
            return [customerInstance: customerInstance, products:Product.list()]
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
        if(params.district){
            def customers = Customer.findAllByDistrict(params.district)
            if(customers){
                return [customerInstanceList:customers]
            } else {
                flash.message = "No results found for district \"${params.district}.\""
                return
            }
        } else {
            flash.message = "Please enter a district to search for."
            redirect action: "list"
        }
    }

    def add_order = {
        println "the params in add_order are " + params
        def customer = Customer.get(params.id)
        if(customer){
            if(customer.order){
                params.product.each {
                    if(!customer.order.products.collect{it.id}.contains(it))
                    def p = Product.get(it)
                    customer.order.products << p
                }
            } else {
                def order = new CustomerOrder()
                params.product.each {
                    def p = Product.get(it)
                    order.addToProducts(p)
                }
                customer.order = order
                customer.save()
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
                        redirect(action: "show", id: params.id)
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
            customerInstance.isNew = params.isNew == 'true'
            customerInstance.save()
        }
        println "the customerInstance's isNew is " + customerInstance.isNew
        render ''
    }

}
