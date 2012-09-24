package com.superkids.taglib

import com.metasieve.shoppingcart.Quantity
import com.superkids.domain.*

class MiscTagLib {

    def springSecurityService
    def shoppingCartService

    static namespace = 'sks'

    def hasPlacedCurrentOrder = { attrs, body ->
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            if(customer?.hasPlacedCurrentOrder){
                out << body()
            } else { out << "" }
        }
    }

    def hasNotPlacedCurrentOrder = { attrs, body ->
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            if(!customer?.hasPlacedCurrentOrder){
                out << body()
            } else { out << "" }
        }
    }

    def productList = { attrs -> 
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            def shoppingCart = shoppingCartService.getShoppingCart()
            def products = Product.list(sort:'sortOrder').collect { product ->
                def isContained = false
                def quantity = Quantity.findByShoppingCartAndShoppingItem(shoppingCart, product.shoppingItem)
                if(quantity){
                    isContained = true
                }
                new Expando(toString: {-> product.name}, id: product.id, isInCart: isContained)
            }
            for(product in products) {
                out << "<tr>"
                out << "<td>"    
                out << product
                out << "</td>"
                out << "<td>"
                if(!customer.hasPlacedCurrentOrder) {
                    if(!product.isInCart){
                        out << g.remoteLink(controller: 'product', action: 'add', update:'shoppingCartContent', params: [id: product.id, cartPage:true]) { 'Add' }
                    }
                }
                out << "</td>"
                out << "</tr>"
            }
        }
    }


	def productBox = { attrs ->
		def customer = Customer.get(springSecurityService.principal?.id)
		def shoppingCart = shoppingCartService.getShoppingCart()
                def productIds = []
                if(customer?.customerOrder){
                    productIds = customer?.customerOrder?.products?.collect{ it?.product?.id }
                }

		Product.list(sort:'sortOrder').each { product ->
			def quantity = Quantity.findByShoppingCartAndShoppingItem(shoppingCart, product.shoppingItem)

			if((product.liveProduct) && (product.statesAvailable.find{ customer?.deliveryAddress?.state }) && (!product.parent)){
				if(quantity || productIds?.contains(product.id)) {
					out << "<a href='"
					out << g.createLink(controller:'product', action:'show', id: product.id)
					out << "' class='"
                    out << product.id
                    out << "' />"
					out << "<img src='"
					out << "${createLink(controller:'product', action:'displayHoverImage', id:product.id)}"
					out << "' "
					out << "class='productThumb' />"
					out << "</a>"
				} else {
					out << "<a href='"
					out << g.createLink(controller:'product', action:'show', id: product.id)
					out << "' class='"
                    out << product.id
                    out << "' />"
					out << "<img src='"
					out << "${createLink(controller:'product', action:'displayImage', id:product.id)}"
					out << "' "
					out << "class='productThumb' />"
					out << "</a>"
				}

//              out << "<img class='hoverProductAd' src='/SuperKids/uploads/"
//              out << product.backgroundImage
//              out << "' id='"
//              out << product.name
//              out << "'/>"



			} else {
				out << ""
			}



			//<img src="${createLink(controller:'product', action:'displayImage', id:product.id)}" width="65" height="50" style="margin:3px;" />
		}
	}


    def orderList = { attrs -> 
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            def products = []
            customer.customerOrder.products.sort{ it.product.id }.each{
                def p = Product.get(it.product.id)
                if(!p.parent){
                    products << p
                }
            }

            out << g.render(template:'/shopping/orderContent', model:[products: products])
        }
    }

    def itemsInCart = {
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)

            if(customer) {
                if (shoppingCartService.getItems()?.size() > 0) {
                    out << "(${shoppingCartService.getItems()?.size()} ${shoppingCartService.getItems().size() > 1 ? 'items' : 'item'})"
                } else if (customer?.hasPlacedCurrentOrder) {
                    out << "(Completed)"
                } else {
                    out << ""
                }
            }
        }
    }

    def orderCheckbox = { attrs ->
        def customerInstance = Customer.get(attrs.id)
        out << "<img src='/SuperKids/images/"
        if(customerInstance?.customerOrder?.products){
            out << "true-y.png"
        } else {
            out << "false.png"
        }
        out << "' width='18' height='18' />"
    }

    def propertyCheckbox = { attrs ->
        def customerInstance = Customer.get(attrs.id)
        out << "<input type='checkbox' "
        out << "name='"
        out << attrs.name
        out << "' "
        if(customerInstance?."${attrs.property}" == true){
            out << "checked='checked'"
        }
        out << "' disabled='disabled' />"
    }

    def assessmentCheckbox = { attrs ->
        def customerInstance = Customer.get(attrs.id)
        out << "<img src='/SuperKids/images/"
        if(customerInstance.status == CustomerStatus.QUALIFIED){
            out << "true-r.png"
        } else {
            out << "false.png"
        }
        out << "' width='18' height='18' />"
    }

    def completedAssessmentCheckbox = { attrs ->
        def customerInstance = Customer.get(attrs.id)
        out << "<input type='checkbox' "
        out << "name='"
        out << attrs.name
        out << "' "
        if(customerInstance?.hasCompletedCurrentAssessment){
            out << "checked='checked'"
        }
        out << "' disabled='disabled' />"
    }

	def customerAssessmentTotal = { attrs ->
		def customer = Customer.get(attrs.id)
		if(customer) {
			def assessments= Assessment.findAllByCustomerAndCompleted(customer, true)

            assessments.each { a ->

              def prod = a.product
              if(Product.findByParent(prod)) {
                assessments = assessments - a
              }
            }

			out << assessments.size()
            out << " / "
            out << customer.customerOrder.products.size()

		}
	}

        def ifNotAssessed = { attrs, body ->
            def customer = Customer.get(attrs.customerId)
            def product = Product.get(attrs.productId)
            if(customer.assessments.find{it?.product?.id == product.id}){
                out << ""
            } else {
                out << body()
            }
        }

        def dnrCheckbox = { attrs ->
            def pOrder = ProductOrder.get(attrs.pOrderId)
            if(pOrder.received){
                out << g.checkBox(value:"${pOrder.product.name}.didNotReceive", checked:'unchecked', name:"${pOrder.product.name}.didNotReceive", onclick:"${g.remoteFunction(action:'toggleDidNotReceive', id:pOrder.id, params:'\'didNotReceive=\' + this.checked')}")
            } else {
                out << "<input type='checkBox' value='"
                out << "${pOrder.product.name}.didNotReceive"
                out << "' checked='checked' name='"
                out << "${pOrder.product.name}.didNotReceive"
                out << "' disabled='disabled' />"
            }
        }

        def dnsCheckbox = { attrs ->
            def pOrder = ProductOrder.get(attrs.pOrderId)
            if(pOrder.sampled){
                out << g.checkBox(value:"${pOrder.product.name}.didNotSample", checked:'unchecked', name:"${pOrder.product.name}.didNotSample", onclick:"${g.remoteFunction(action:'toggleDidNotSample', id:pOrder.id, params:'\'didNotSample=\' + this.checked')}")
            } else {
                out << "<input type='checkBox' value='"
                out << "${pOrder.product.name}.didNotSample"
                out << "' checked='checked' name='"
                out << "${pOrder.product.name}.didNotSample"
                out << "' disabled='disabled' />"
            }
        }

	def adminAssessLink = { attrs ->
		def pOrder = ProductOrder.get(attrs.id)
		if(pOrder) {
			def product = pOrder.product
			def customer = pOrder.order.customer
			def assessment = Assessment.findByProductAndCustomer(product, customer)

			if(assessment) {
				out << "Assessed | "
				out << "<a href='"
				out << createLink(controller:'assessment', action:'show', id:assessment.id)
				out << "' />View</a>"
			} else if(!pOrder.received) {
				out << 'Did Not Receive '
			} else if(!pOrder.sampled) {
                out << 'Did Not Sample '
            } else {
				out << '<a href="javascript:showAssessForm('
				out << pOrder.id
				out << ')">Assess</a>'
			}
		}
	}

	def viewAssessment = { attrs ->
		def product = Product.get(attrs.product)
		def customer = Customer.get(attrs.customer)
		def assessment = Assessment.findByProductAndCustomer(product, customer)

		if((product) && (assessment) && (assessment.completed)) {
			out << "Assessed | <a href='"
			out << createLink(controller:'assessment', action:'show', id: assessment.id)
			out << "'> View Results </a>"

		} else {
                    out << "Not Assessed"
                }
	}


    def factoidList = { attrs ->
        def f = Factoid.get(1)
        out << "<script type='text/javascript'>"
        out << "var nIndex = 1;"
        out << "var timerID = null;"
        out << "function factoidloop(){"
        out << "var factoids = new Array();"
        def factoidNo = 0;
        Factoid.findAllByLiveFactoid(true).each { factoid ->
            factoidNo++
            out << "factoids[${factoidNo}] = \""
            out << "${factoid.content}\";"
        }
        out << "var len = factoids.length;"
        out << "if(nIndex >= len)"
        out << "nIndex = 1;"
        out << "document.getElementById('factoids').innerHTML = factoids[nIndex];"
        out << "nIndex++;"
        out << "timerID = setTimeout('factoidloop()',10000);"
        out << "}"
        out << "factoidloop();"
        out << "</script>"
    }

    def sponsorList = { attrs ->
        out << "<script type='text/javascript'>"
        out << "var nIndex = 1;"
        out << "var timerID = null;"
        out << "function sponsorloop(){"
        out << "var sponsors = new Array();"
        def sponsorNo = 0
        def sponsorProduct
        Sponsor.findAllByInactive(false).sort {it.name}.each { sponsor ->
            sponsorProduct = Product.findBySponsor(sponsor)
            sponsorNo++
            out << "sponsors[${sponsorNo}] = \""
            if(sponsorProduct){
                out << "<a href='"
                out << g.createLink(controller:"product", action:"show", id:sponsorProduct.id)
                out << "'>"
            }
            out << "<img src='"
            out << g.createLink(controller:"sponsor", action:"displayImage", id:sponsor.id)
            out << "' />"
            if(sponsorProduct){
                out << "</a>"
            }
            out << "\";"
        }
        out << "var len = sponsors.length;"
        out << "if(nIndex >= len)"
        out << "nIndex = 1;"
        out << "document.getElementById('Sponsordatabox').innerHTML = sponsors[nIndex];"
        out << "nIndex++;"
        out << "timerID = setTimeout('sponsorloop()',10000);"
        out << "}"
        out << "sponsorloop();"
        out << "</script>"
    }

/************************************************
FROM EXPORT PLUGIN
Modified: get menuButton text from new 'msg' attr
*************************************************/

	def formats = { attrs ->
		StringWriter writer = new StringWriter()
		def builder = new groovy.xml.MarkupBuilder(writer)
		
		if(!attrs?.'class'){
			attrs.'class' = "export"
		}
		
		String action = actionName
		String controller = controllerName
		
		if(attrs?.action){
			action = new String(attrs.action)
			attrs.remove("action")
		}
		
		if(attrs?.controller){
			controller = new String(attrs.controller)
			attrs.remove("controller")
		}
		
		List formats = ['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']
		if(attrs?.formats){
			formats = new ArrayList(attrs.formats)
			attrs.remove("formats")
		}
		
		Map parameters = [:]
		if(attrs?.params){
			parameters = new HashMap(attrs.params)
			attrs.remove("params")
		}
		
		Map extensions = [excel: "xls"]
		
		builder."div"(attrs){
			formats.each { format ->
				span("class": "menuButton"){
					String message = "${attrs.msg}"
					
					// Extension defaults to format
					String extension = format
					if(extensions.containsKey(format)){
						extension = extensions[format]
					}
					
					Map params = [format: format, extension: extension] + parameters
					
					a('class': format, href: "${createLink(controller: controller, action: action, params: params)}", message)
				}	
			}
		}
		
		writer.flush()
		out << writer.toString()
	}
	
	def resource = { attrs ->
		StringWriter writer = new StringWriter()
		def builder = new groovy.xml.MarkupBuilder(writer)
		
		String resourcePath = RenderUtils.getResourcePath("export", request?.contextPath)
		
		if(!attrs.skin || attrs.skin == "default"){
			builder.link(rel: "stylesheet", type: "text/css", href: "${resourcePath}/css/export.css")	
		}
		else {
			String applicationResourcePath = RenderUtils.getApplicationResourcePath(resourcePath)
			builder.link(rel: "stylesheet", type: "text/css", href: "${applicationResourcePath}/css/${attrs.skin}.css")
		}
		
		writer.flush()
		out << writer.toString()
	}

	def productAssessmentTabs = { attrs ->
		def customer = Customer.get(attrs?.id)
		if(customer) {
			def products = customer.customerOrder.products*.product.sort { it?.id }


            // remove variety packs - we only want the subproducts
            products.each { p ->
                if(p) {
					if(Product.findByParent(p))  {
                    	println "parent"
                   		products = products - p
              	    }
				}
            }

			def totalProducts = products.size()

            println totalProducts

			def tabIndex = 2
			out << "<div id='tab${tabIndex}' class='tab_content'>"
			products.eachWithIndex{product, i ->
				out << render(template:'productAssessment', model:[product:product, customer:customer])
				def idx = i + 1
				if ((idx % 4 == 0) && totalProducts > idx){
					out <<"</div>"
					tabIndex++
					out << "<div id='tab${tabIndex}' class='tab_content'>"
				}
			}

			tabIndex++

			out << "</div>"
			out << "<div id='tab${tabIndex}' class='tab_content'>"
			out << render(template:'finalQuestions', model:[customer:customer])
			out << "</div>"
		}

	}

	def productAssessmentNav = { attrs ->
		def customer = Customer.get(attrs?.id)
		if(customer) {
			def products = customer?.customerOrder?.products*.product.sort { it?.id }
            products.each { p ->
				if(p) {
					if(Product.findByParent(p))  {
                    	println "parent"
                   		products = products - p
              	    }
				}

            }
			def totalProducts = products.size()
			def tabIndex = 2
			out << "<li><a href='#tab${tabIndex}'>Sponsors ${tabIndex - 1}</a></li>"
			products.eachWithIndex{product, i ->
				def idx = i + 1
				if ((idx % 4 == 0) && totalProducts > idx){
					tabIndex++
					out << "<li><a href='#tab${tabIndex}'>Sponsors ${tabIndex - 1}</a></li>"
				}
			}
			
			tabIndex++
			out << "<li><a href='#tab${tabIndex}'>Final Questions</a></li>"
		}

	}

/*        def productSidebar = { attrs ->
            def products = attrs.products
            def user = User.get(springSecurityService.principal.id)
            if(!user.isAdmin()){
                Product.list().each { product ->
                    if(product.liveProduct && product.statesAvailable.find{ user?.deliveryAddress?.state }){
                        out << g.link(controller:'product', action:'show', id:product.id){ "<img src='${createLink(controller:'product', action:'displayImage', id:product.id)}' width='65' height='50' style='margin:3px;' />" }
                    } else {
                        out << ""
                    }
                }
            } else {
                out << ""
            }
        }*/

    def bakeCheckbox = { attrs ->
        def productInstance = Product.get(attrs.id)
        out << "<input type='checkbox' "
        out << "name='"
        out << attrs.name
        out << "' id='"
        out << attrs.id
        out << "' "
        if(productInstance.bake){
            out << "checked='checked'"
        }
        out << "' disabled='disabled' />"
    }

    def linkToCall = { attrs ->
        def customerInstance = Customer.get(attrs.id)
        if(!customerInstance.inCall){
            if(customerInstance.status == CustomerStatus.HAS_NOT_ORDERED){
                out << g.link(controller:"call", action:"get_order_call", params:[id:customerInstance.id]){ customerInstance.district }
            } else {
                out << g.link(controller:"call", action: "get_assess_call", params:[id:customerInstance.id]){ customerInstance.district }
            }
    
    } else {
            out << customerInstance.district
        }
    }



	def linkToOrderCall = { attrs ->
		def customerOrderInstance = CustomerOrder.get(attrs.id)
		if(customerOrderInstance) {
			def customer = customerOrderInstance?.customer
			if(customerOrderInstance.orderType == OrderType.PHONE) {
				def call = Call.findByCustomerAndResult(customer, CallResult.QUALIFIED)
				if(call) {
					out << "Phone <a href='"
					out << createLink(controller:'call', action:'show', id:call.id)
					out << "'>(View Call)</a>"
				} else {
					out << "Phone"
				}

			}
		}
	}

	def eachInProducts = { attrs, body ->
		def items = shoppingCartService.getItems()?.sort{it?.id}
		if(items){	
			items?.sort { a, b -> a?.id <=> b?.id }?.each { item ->
				def itemInfo = ['item':item,
								'qty':shoppingCartService.getQuantity(item)]
	
				out << body(itemInfo)
			}
		} else {
			out << "<h2>There are no products in your cart.</h2>"
		}
	}

    def productMenuItem = { attrs ->

        def product = Product.get(attrs.id)

        if (product) {

            def inCart = ""
            def active = ""

            def shoppingCart = shoppingCartService.getShoppingCart()
            if (Quantity.findByShoppingCartAndShoppingItem(shoppingCart, product.shoppingItem)) inCart = "in-cart"
            if (attrs.id == attrs.active) active = "active"

            out << """<li class='${active} ${inCart}'>
                    <a href=${createLink(controller: 'product', action: 'show', id: product.id)} title="${product.name}">
                        ${product.name}<br />
                        <span>${product.sponsor.name}</span>
                    </a>
                </li>
            """
        }

    }


}
