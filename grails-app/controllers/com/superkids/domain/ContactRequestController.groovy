package com.superkids.domain

class ContactRequestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactRequestInstanceList: ContactRequest.list(params), contactRequestInstanceTotal: ContactRequest.count()]
    }

    def create = {
        def contactRequestInstance = new ContactRequest()
        def states=['AL': 'Alabama', 'AK': 'Alaska', 'AZ': 'Arizona', 'AR': 'Arkansas', 'CA': 'California', 'CO': 'Colorado', 'CT': 'Connecticut', 'DE': 'Delaware', 'DC': 'District Of Columbia', 'FL': 'Florida', 'GA': 'Georgia', 'HI': 'Hawaii', 'ID': 'Idaho', 'IL': 'Illinois', 'IN': 'Indiana', 'IA': 'Iowa', 'KS': 'Kansas', 'KY': 'Kentucky', 'LA': 'Louisiana', 'ME': 'Maine', 'MD': 'Maryland', 'MA': 'Massachusetts', 'MI': 'Michigan', 'MN': 'Minnesota', 'MS': 'Mississippi', 'MO': 'Missouri', 'MT': 'Montana', 'NE': 'Nebraska', 'NV': 'Nevada', 'NH': 'New Hampshire', 'NJ': 'New Jersey', 'NM': 'New Mexico', 'NY': 'New York', 'NC': 'North Carolina', 'ND': 'North Dakota', 'OH': 'Ohio', 'OK': 'Oklahoma', 'OR': 'Oregon', 'PA': 'Pennsylvania', 'RI': 'Rhode Island', 'SC': 'South Carolina', 'SD': 'South Dakota', 'TN': 'Tennessee', 'TX': 'Texas', 'UT': 'Utah', 'VT': 'Vermont', 'VA': 'Virginia', 'WA': 'Washington', 'WV': 'West Virginia', 'WI': 'Wisconsin', 'WY': 'Wyoming']
        contactRequestInstance.properties = params
        return [contactRequestInstance: contactRequestInstance, states:states]
    }

    def save = {
        def address = new Address(street:params.street, street2:params.street2, city:params.city, state:params.address.state, zip:params.zip)
        address.save(failOnError:true)

        def contactRequestInstance = new ContactRequest(params)

        contactRequestInstance.address = address
        contactRequestInstance.phone = params.phone1 + " " + params.phone2 + " " + params.phone3

        if (contactRequestInstance.save(flush: true)) {
            flash.message = "Thanks! Your message has been sent."
            redirect controller:"home", action:"index"
        }
        else {
            render(view: "create", model: [contactRequestInstance: contactRequestInstance])
        }
    }

    def show = {
        def contactRequestInstance = ContactRequest.get(params.id)
        if (!contactRequestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
            redirect(action: "list")
        }
        else {
            [contactRequestInstance: contactRequestInstance]
        }
    }

    def edit = {
        def contactRequestInstance = ContactRequest.get(params.id)
        if (!contactRequestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [contactRequestInstance: contactRequestInstance]
        }
    }

    def update = {
        def contactRequestInstance = ContactRequest.get(params.id)
        if (contactRequestInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (contactRequestInstance.version > version) {
                    
                    contactRequestInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'contactRequest.label', default: 'ContactRequest')] as Object[], "Another user has updated this ContactRequest while you were editing")
                    render(view: "edit", model: [contactRequestInstance: contactRequestInstance])
                    return
                }
            }
            contactRequestInstance.properties = params
            if (!contactRequestInstance.hasErrors() && contactRequestInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), contactRequestInstance.id])}"
                redirect(action: "show", id: contactRequestInstance.id)
            }
            else {
                render(view: "edit", model: [contactRequestInstance: contactRequestInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def contactRequestInstance = ContactRequest.get(params.id)
        if (contactRequestInstance) {
            try {
                contactRequestInstance.delete(flush: true)
                flash.message = "Deleted this contact request."
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
            redirect(action: "list")
        }
    }

    def other_delete = {
        if(springSecurityService.isLoggedIn()){
            if(User.get(springSecurityService.principal.id).isAdmin()){
                def contactRequestInstance = ContactRequest.get(params.id)
                if (contactRequestInstance) {
                    try {
                        contactRequestInstance.delete(flush: true)
                        flash.message = "Deleted this contact request."
                        redirect(action: "list")
                    }
                    catch (org.springframework.dao.DataIntegrityViolationException e) {
                        flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
                        redirect(action: "show", id: params.id)
                    }
                }
                else {
                    flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'contactRequest.label', default: 'ContactRequest'), params.id])}"
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
