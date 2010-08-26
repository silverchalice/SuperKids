package com.superkids.domain
import com.metasieve.shoppingcart.ShoppingCart
import com.metasieve.shoppingcart.Shoppable
import com.metasieve.shoppingcart.IShoppable
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
        [productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
    }

    def create = {
        def productInstance = new Product()
        productInstance.properties = params
        return [productInstance: productInstance]
    }

    def save = {
        def productInstance = new Product(params)
        if (productInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])}"
            redirect(action: "show", id: productInstance.id)
        }
        else {
            render(view: "create", model: [productInstance: productInstance])
        }
    }

    def show = {
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
                render template:"/shopping/shoppingCartContent", model:[productInstance:product]
            } else {
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
            } else {
                render template:"/shopping/shoppingCartContent", model:[productInstance:product]
            }
        }

        def check_out = {
            def customer = Customer.get(springSecurityService.principal.id)
            customer?.hasPlacedCurrentOrder = true
            def order = new CustomerOrder(customer:customer, orderType:OrderType.WEB)
            shoppingCartService.getItems().each{
                def product = Product.get(it.id)
                order.addToProducts(product)
            }
            order.properties.each{ println it }
            customer.order = order
            customer.save()
            session.checkedOutItems = shoppingCartService.checkOut()
            render template:"/shopping/shoppingCartContent"
        }

}
