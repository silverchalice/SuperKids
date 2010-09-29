<g:each in="${products}" var="product">
               <g:link controller="product" action="show" id="${product?.id}"><img src="${createLink(controller:'product', action:'displayImage', id:product?.id)}" width="65" height="50" style="margin:3px;" /></g:link> <g:remoteLink controller="product" action="remove"
				params="${[id:product.id, confirm:true]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Remove
         			</g:remoteLink><br />
               ${product?.quantity}<br />
               [foo]
           </g:each>
