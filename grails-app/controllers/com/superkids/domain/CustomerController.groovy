package com.superkids.domain

import com.superkids.domain.*;

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
		println params
        def customerInstance = new Customer(params)

		String password = springSecurityService.encodePassword(params?.password)
		def user = new User(username: params.email, enabled: true, password: password)
		def userRole = Role.findByAuthority("ROLE_USER")

        if ((customerInstance.save(flush: true)) && (user.save(flush:true))) {
			println 'saved'
			UserRole.create user, userRole, true
			customerInstance.user = user
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])}"
            redirect(action: "show", id: customerInstance.id)
        }
        else {
			println 'not saved'
			user.errors.allErrors.each { println it }
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
            return [customerInstance: customerInstance]
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
}
