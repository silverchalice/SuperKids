package com.superkids.domain

import com.metasieve.shoppingcart.Quantity

class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def shoppingCartService
    def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
       def content = PageText.findByName("superkids_products").content
       render view:"/home/superkids_products", model:[content: content]
    }

    def admin = {
        params.max = Math.min(params.max ? params.int('max') : 23, 100)
        params.sort = params.sort ?: "sortOrder"
        render view:"list", model:[productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }

    def create = {
        def states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
                      'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
                      'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
                      'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
                      'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
                      'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
                      'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
                      'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
                      'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
                      'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
        def productInstance = new Product()
        productInstance.properties = params
        return [productInstance: productInstance, states:states]
    }

    def save = {
        def productInstance = new Product(params)
        if (productInstance.save(failOnError:true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])}"
            redirect action: "admin"
        }
        else {
            render(view: "create", model: [productInstance: productInstance])
        }
    }

    def show = {
        def productInstance = Product.get(params.id)
        def shoppingCart = shoppingCartService.getShoppingCart()
        def qty = 1
        def inCart = false

        def quantity = Quantity.findByShoppingCartAndShoppingItem(shoppingCart, productInstance.shoppingItem)
        if (quantity) {
            inCart = true
        }
        def customer
        if(!User.get(springSecurityService.principal.id).isAdmin()){
            customer = Customer.get(springSecurityService.principal.id)
        }
        if (!productInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
            redirect(action: "admin")
        }
        else {

			def mfgContent = PageText.findByName("product_${productInstance.id}").content

            [productInstance: productInstance, inCart:inCart, customer:customer, mfgContent: mfgContent ]
        }
    }

    def new_summary = {
        def productInstance = Product.get(params.id)
        if(!productInstance){
            flash.message = "Product not found with id ${params.id}."
            redirect(action: "admin")
        } else {
            return [productInstance : productInstance]
        }
    }

    def save_summary = {
        def summaryName = params.summary.originalFilename
        def summaryType = params.summary.contentType
        def productInstance = Product.get(params.id)
        if(params.summary.isEmpty()){
            flash.message = "Please choose a new file."
            render view:"new_summary", model:[productInstance:productInstance]
            return
        } else {
            productInstance.properties = params
            productInstance.summaryName = summaryName
            productInstance.summaryType = summaryType
            if(productInstance.save()){
                flash.message = "Saved new summary file."
                redirect(action: "admin")
            }
        }
    }

    def edit = {
        def states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
                      'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
                      'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
                      'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
                      'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
                      'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
                      'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
                      'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
                      'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
                      'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
            redirect(action: "admin")
        }
        else {

			def subProducts = Product.findAllByParent(productInstance)

			if(subProducts) {
                            println " "
			}

            return [productInstance: productInstance, subProducts: subProducts, states:states]
        }
    }

    def update = {
		println "Entering ProductController:update..."
        def productInstance = Product.get(params.id)
        if (productInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (productInstance.version > version) {

                    productInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'product.label', default: 'Product')] as Object[], "Another user has updated this Product while you were editing")
                    render(view: "edit", model: [productInstance: productInstance])
                    return
                }
            }
            if(params.image?.isEmpty() && params.hoverImage?.isEmpty()){
                bindData(productInstance, params, ['image', 'hoverImage'])
            } else if(params.image?.isEmpty()){
                bindData(productInstance, params, ['image'])
            } else if(params.hoverImage?.isEmpty()){
                bindData(productInstance, params, ['hoverImage'])
            } else {
                productInstance.properties = params
            }

			if(params.parentProd) {
				def parent = Product.findByName(params.parentProd)
				productInstance.parent = parent
			}

            if (!productInstance.hasErrors() && productInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])}"
                redirect(action: "admin")
            }
            else {
                render(view: "edit", model: [productInstance: productInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
            redirect(action: "admin")
        }
    }

    def delete = {
        def productInstance = Product.get(params.id)
        if (productInstance) {
            try {
                productInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
                redirect(action: "admin")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
            redirect(action: "admin")
        }
    }

	def displayImage = {
		def productInstance = Product.get(params.id)

		response.contentType = "image/jpeg"
		response.contentLength = productInstance.image.size()
		response.outputStream.write(productInstance.image)
	}

	def displayHoverImage = {
		def productInstance = Product.get(params.id)

		response.contentType = "image/jpeg"
		response.contentLength = productInstance.hoverImage.size()
		response.outputStream.write(productInstance.hoverImage)
	}

	def downloadSummary = {
		def productInstance = Product.get(params.id)
		response.contentType = "${productInstance.summaryType}"
		response.setHeader("Content-disposition", "${params.contentDisposition}; filename=${productInstance.summaryName}")
		response.contentLength = productInstance.summary.size()
		response.outputStream.write(productInstance.summary)
	}

	def add = {
		def product = Product.get(params.id)
                def customer = Customer.get(springSecurityService.principal.id)
                println "customer " + customer?.fsdName + " added " + product + " to cart"
		shoppingCartService.addToShoppingCart(product, 1)
		redirect controller:'testShoppingCart', action:'show'
		return
	}

	def remove = {
                def controller
                def action
                if(params.controller){ controller = params.controller }
                if(params.action){ action = params.action }
		def product = Product.get(params.id)
                def customer = Customer.get(springSecurityService.principal.id)
                println "customer " + customer?.fsdName + " removed " + product + " from cart"
		def qty = 1
		def previousShoppingCart = null
		def shoppingCart = shoppingCartService.getShoppingCart()

		if (!shoppingCart) {
			return
		}

		def quantity = Quantity.findByShoppingCartAndShoppingItem(shoppingCart, product?.shoppingItem)
		if (quantity) {
			if (quantity.value - qty >= 0) {
				quantity.value -= qty
			}
			quantity?.save()
		}
		if (quantity?.value == 0) {
			// work-around for $$_javassist types in list
			def itemToRemove = shoppingCart?.items.find { item ->
				if (item?.id == product?.shoppingItem.id) {
					return true
				}
				return false
			}
			shoppingCart.removeFromItems(itemToRemove)
			quantity?.delete()
		}

		shoppingCart.save()
		if(params.cartPage){
			render template:"/shopping/initial", model:[productInstance:product]
		} else if (params.confirm){
			def cartItems = shoppingCartService.getItems()
			def products = []
			cartItems?.each { item ->
				def prod = Product.findByShoppingItem(item)
				if(prod){
					def p = new Expando(toString: {-> prod.name}, id:prod.id, quantity:prod.servings)
					products << p
				}
			}
                        render template:"/shopping/shoppingCartContent", model:[productInstance:product]
		} else {
			render template:"/shopping/shoppingCartContent", model:[productInstance:product]
		}
	}

	def check_out = {
                def broker = null
                if(params.brokerId){
                    broker = Broker.get(params.brokerId)
                }
		def states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
		  'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
		  'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
		  'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
		  'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
		  'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
		  'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
		  'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
		  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
		  'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
		def customerInstance = Customer.get(springSecurityService.principal.id)
		render view:"/shopping/check_out", model:[customerInstance:customerInstance, states:states, broker:broker, sponsors: Sponsor.findAllByInactive(false).sort {it.name}]
	}

	def other_delete = {
		if(springSecurityService.isLoggedIn()){
			if(User.get(springSecurityService.principal.id).isAdmin()){
				def productInstance = Product.get(params.id)
				if (productInstance) {
					try {
						productInstance.delete(flush: true)
						flash.message = "Deleted this product."
						redirect(action: "admin")
					}
					catch (org.springframework.dao.DataIntegrityViolationException e) {
						flash.message = "This product could not be deleted."
						redirect(action: "admin")
					}
				}
				else {
					flash.message = "Product record not found."
					redirect(action: "admin")
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

	def toggleLive = {
		def productInstance = Product.get(params.id)
		if (productInstance){
			productInstance.liveProduct = params.liveProduct == 'true'
			productInstance.save()
		}
		println "Q: Is " + productInstance + " live?"
                println "A: " + productInstance.liveProduct
		render ''
    }

    def brokerEditFromEdit = {
        def controller = params.rController
        def action = params.rAction
        def rId = params.rId
        def brokerId = params.id
        def states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
			  'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
			  'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
			  'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
			  'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
			  'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
			  'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
			  'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
			  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
			  'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
        redirect controller:controller, action:action, id:rId, params:[brokerId:brokerId]
    }

    def updateBroker = {
        def controller = params.rController
        def action = params.rAction
        def rId = params.rId
        def brokerInstance = Broker.get(params.id)
        if (brokerInstance) {
            brokerInstance.properties = params

            if(!brokerInstance.save()) {
				flash.message = "Invalid Broker Details"
	    }
        }
        redirect controller:controller, action:action, id:rId, broker:brokerInstance
    }


    def brokerDeleteFromEdit = {
        def brokerInstance = Broker.get(params.id)
        def customerInstance = Customer.get(brokerInstance?.customer.id)
        def controller = params.rController
        def action = params.rAction
        def rId = params.rId
        if(brokerInstance){
            try {
                customerInstance.removeFromBrokers(brokerInstance)
                customerInstance.save(failOnError:true)
                brokerInstance.delete(flush: true)
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                log.error e
            }
         }
         redirect controller:controller, action:action, id:rId
    }

}
