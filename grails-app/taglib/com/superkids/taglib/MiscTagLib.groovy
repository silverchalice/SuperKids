package com.superkids.taglib

import com.superkids.domain.Customer
import com.superkids.domain.Product
import com.metasieve.shoppingcart.Quantity
import com.superkids.domain.Factoid
import com.superkids.domain.Sponsor
import com.superkids.domain.Assessment

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
            def products = Product.list().collect { product ->
                def isContained = false
                def quantity = Quantity.findByShoppingCartAndShoppingItem(shoppingCart, product.shoppingItem)
                if(quantity){
                    isContained = true
                }
                new Expando(toString: {-> product.name}, id: product.id, isInCart: isContained)
            }
            for(product in products) {
                println product.isInCart
                out << "<tr>"
                out << "<td>"    
                out << product
                out << "</td>"
                out << "<td>"
                if(!customer.hasPlacedCurrentOrder) {
                    if(!product.isInCart){
                        println "add link"
                        out << g.remoteLink(controller: 'product', action: 'add', update:'shoppingCartContent', params: [id: product.id, cartPage:true]) { 'Add' }
                    }
                }
                out << "</td>"
                out << "</tr>"
            }
        }
    }

    def orderList = { attrs -> 
        if(springSecurityService.loggedIn){
            def customer = Customer.get(springSecurityService.principal?.id)
            out << "<br />"
            out << "<h2>Your order</h2>"
            out << "<br />"
            out << "<table>"
            out << "<thead>"
            out << "<tr>"   
            out << g.sortableColumn(property:'item',title:'Product',width:'87%')    
            out << "<th> </th>"
            out << "</tr>"
            out << "</thead>"
            out << "<tbody>"
            for(product in customer.order.products) {
                out << "<tr>"
                out << "<td>"    
                out << product
                out << "</td>"
                out << "<td>"
                out << "</td>"
                out << "</tr>"
            }
            out << "<tr>"
            out << "<td>"
            out << "</td>"
            out << "<td>"
            out << "</td>"
            out << "</tr>"
            out << "</tbody>"
            out << "</table>"
        }
    }

    def orderCheckbox = { attrs ->
        def customerInstance = Customer.get(attrs.id)
        out << "<input type='checkbox' "
        out << "name='"
        out << attrs.name
        out << "' id='"
        out << attrs.id
        out << "' "
        if(customerInstance?.order?.products){
            out << "checked='checked'"
        }
        out << "' disabled='disabled' />"
    }

    def assessmentCheckbox = { attrs ->
        def customerInstance = Customer.get(attrs.id)
        out << "<input type='checkbox' "
        out << "name='"
        out << attrs.name
        out << "' id='"
        out << attrs.id
        out << "' "
        if(Assessment.findByCustomer(customerInstance)){
            out << "checked='checked'"
        }
        out << "' disabled='disabled' />"
    }

    def factoidList = { attrs ->
        out << "<script>"
        out << "var nIndex = 1;"
        out << "var timerID = null;"
        out << "function factoidloop(){"
        out << "var factoids = new Array();"
        def factoidNo = 0;
        Factoid.list().each { factoid ->
            factoidNo++
            out << "factoids[${factoidNo}] = \""
            out << "${factoid.content}\";"
        }
        out << "var len = factoids.length;"
        out << "if(nIndex >= len)"
        out << "nIndex = 1;"
        out << "document.getElementById('Factoiddatabox').innerHTML = factoids[nIndex];"
        out << "nIndex++;"
        out << "timerID = setTimeout('factoidloop()',10000);"
        out << "}"
        out << "factoidloop();"
        out << "</script>"
    }

    def sponsorList = { attrs ->
        out << "<script>"
        out << "var nIndex = 1;"
        out << "var timerID = null;"
        out << "function sponsorloop(){"
        out << "var sponsors = new Array();"
        def sponsorNo = 0
        def sponsorProduct
        Sponsor.list().each { sponsor ->
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

}
