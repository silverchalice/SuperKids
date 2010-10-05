package com.superkids.domain
import com.metasieve.shoppingcart.ShoppingCart
import com.metasieve.shoppingcart.Shoppable
import com.metasieve.shoppingcart.ShoppingItem
import com.metasieve.shoppingcart.Quantity
import com.superkids.domain.CustomerOrder
import com.superkids.domain.OrderType

class ProductController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def shoppingCartService
    def springSecurityService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render view:"/home/superkids_products", model:[productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }

    def admin = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        render view:"list", model:[productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }

    def create = {
        def productInstance = new Product()
        productInstance.properties = params
        return [productInstance: productInstance]
    }

    def save = {
        def productInstance = new Product(params)
        def shoppingItem = new ShoppingItem().save()
        productInstance.shoppingItem = shoppingItem
        if (productInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])}"
            redirect(action: "show", id: productInstance.id)
        }
        else {
            render(view: "create", model: [productInstance: productInstance])
        }
    }

    def show = {
        println "in Product show, dude"
        def productInstance = Product.get(params.id)
        def shoppingCart = shoppingCartService.getShoppingCart()
        def qty = 1
        def bar = false

        def quantity = Quantity.findByShoppingCartAndShoppingItem(shoppingCart, productInstance.shoppingItem)
        if (quantity) {
            bar = true
        }
        if (!productInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
            redirect(action: "list")
        }
        else {
            [productInstance: productInstance, foo:bar]
        }
    }

    def edit = {
        def productInstance = Product.get(params.id)
        if (!productInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [productInstance: productInstance]
        }
    }

    def update = {
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
            productInstance.properties = params
            if (!productInstance.hasErrors() && productInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])}"
                redirect(action: "show", id: productInstance.id)
            }
            else {
                render(view: "edit", model: [productInstance: productInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def productInstance = Product.get(params.id)
        if (productInstance) {
            try {
                productInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])}"
            redirect(action: "list")
        }
    }

	def displayImage = {
		println "entering displayImage"
		def productInstance = Product.get(params.id)

		response.contentType = "image/jpeg"
		response.contentLength = productInstance.image.size()
		response.outputStream.write(productInstance.image)
	}

	def downloadSummary = {
		def productInstance = Product.get(params.id)
		response.contentType = "application/pdf"
		response.setHeader("Content-disposition", "${params.contentDisposition}; filename=${productInstance.name.replaceAll(' ', '-')}-Summary.pdf")
		response.contentLength = productInstance.summary.size()
		response.outputStream.write(productInstance.summary)
	}

        def add = {
            println "in Product add action"
            def product = Product.get(params.id)
            shoppingCartService.addToShoppingCart(product, 1)
            if(params.cartPage){
                println "rendering shoppingCartContent template (in add action)"
                render template:"/shopping/shoppingCartContent", model:[productInstance:product]
            } else {
                println "rendering added template (in add action)"
                render template:"/shopping/added", model:[productInstance:product]
            }
	}

        def remove = {
            def product = Product.get(params.id)
            def qty = 1
            def previousShoppingCart = null
            def shoppingCart = shoppingCartService.getShoppingCart()

            if (!shoppingCart) {
                return
            }
		
            def quantity = Quantity.findByShoppingCartAndShoppingItem(shoppingCart, product.shoppingItem)
            if (quantity) {
                if (quantity.value - qty >= 0) {
                    quantity.value -= qty
                }
                quantity.save()
            }
		
            if (quantity.value == 0) {
                // work-around for $$_javassist types in list
                def itemToRemove = shoppingCart.items.find { item ->
                    if (item.id == product.shoppingItem.id) {
                        return true
                    }
                    return false
                }
                shoppingCart.removeFromItems(itemToRemove)
                quantity.delete()
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
                render template:"/product/checkout_items", model:[products:products]
            } else {
                render template:"/shopping/shoppingCartContent", model:[productInstance:product]
            }
        }

        def check_out = {
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
            render view:"/shopping/check_out", model:[customerInstance:customerInstance, states:states]
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
}
