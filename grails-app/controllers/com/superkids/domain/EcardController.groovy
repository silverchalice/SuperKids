package com.superkids.domain

class EcardController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 24, 100)
        [ecardInstanceList: Ecard.list(params), ecardInstanceTotal: Ecard.count()]
    }

    def create = {
        def current_user
        if(springSecurityService.isLoggedIn()){ current_user = Customer.get(springSecurityService.principal.id) }
        println current_user + " is about to send an ecard; the params are: " + params
        def ecardInstance = new Ecard()
        ecardInstance.properties = params
        return [ecardInstance: ecardInstance]
    }

    def save = {
        def ecardInstance = new Ecard(params)
        if (ecardInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ecard.label', default: 'Ecard'), ecardInstance.id])}"
            redirect(action: "show", id: ecardInstance.id)

			sendMail {
                to ecardInstance?.recipientEmail
                subject "ECard from SuperKidsSampling.com"
                body 'How are you?'
			}
        }

        else {
            render(view: "create", model: [ecardInstance: ecardInstance])
        }
    }

	def sendEcard = {
		println "in sendEcard action of EcardController"

	 	def ecardInstance = new Ecard(params)

		if(params.Ecard == '1') {
			println 'Ecard = 1'
			ecardInstance.cardType = "Broker or Foodservice Distributor eCard"
			ecardInstance.message = "broker"
		}

		if(params.Ecard == '2') {
			println 'Ecard = 2'
			ecardInstance.message = "fsd"
			ecardInstance.cardType = "School District Foodservice Director eCard"
		}

                println " "
		def current_user
		if(springSecurityService.isLoggedIn()){ current_user = Customer.get(springSecurityService.principal.id) }

		//println current_user + " is trying to send a " + ecardInstance.cardType + " to " + ecardInstance.recipient + " (" + ecardInstance.recipientEmail + "); the ecard's properties are: "
                ecardInstance?.properties.each { println it; println " " }
                println " "

		if (ecardInstance.save(flush: true)) {
			flash.message = "Your eCard was sent"

			if(ecardInstance.message == "broker") {
				sendMail {
					to ecardInstance?.recipientEmail
					subject "[SuperKids] ECard from SuperKidsSampling.com"
					html g.render(template:"broker", model:[ecard: ecardInstance])
				}
			} else {
				sendMail {
					to ecardInstance?.recipientEmail
					subject "ECard from SuperKidsSampling.com"
					html g.render(template:"fsd", model:[ecard: ecardInstance])
				}
			}
                        flash.message = "Your eCard has been sent."
			redirect controller:'home', action:'ecards_thanks'
		}

		else {
                        println "there were errors with this ecard"
			ecardInstance.errors.allErrors.each {println it}

			flash.message = "Sorry, your eCard was unable to be sent"
			redirect controller: "home", action: 'ecards_send'
		}		
	}


    def show = {
        def ecardInstance = Ecard.get(params.id)
        if (!ecardInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ecardInstance: ecardInstance]
        }
    }

    def edit = {
        def ecardInstance = Ecard.get(params.id)
        if (!ecardInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ecardInstance: ecardInstance]
        }
    }

    def update = {
        def ecardInstance = Ecard.get(params.id)
        if (ecardInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ecardInstance.version > version) {

                    ecardInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ecard.label', default: 'Ecard')] as Object[], "Another user has updated this Ecard while you were editing")
                    render(view: "edit", model: [ecardInstance: ecardInstance])
                    return
                }
            }
            ecardInstance.properties = params
            if (!ecardInstance.hasErrors() && ecardInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ecard.label', default: 'Ecard'), ecardInstance.id])}"
                redirect(action: "show", id: ecardInstance.id)
            }
            else {
                render(view: "edit", model: [ecardInstance: ecardInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ecardInstance = Ecard.get(params.id)
        if (ecardInstance) {
            try {
                ecardInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ecard.label', default: 'Ecard'), params.id])}"
            redirect(action: "list")
        }
    }
}
