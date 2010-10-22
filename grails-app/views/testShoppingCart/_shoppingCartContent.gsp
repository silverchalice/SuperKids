                   <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="item" title="Product" />

                            <g:sortableColumn property="qty" title="Quantity" />

                            <th> </th>

                        </tr>
                    </thead>
                    <tbody>
                    <sks:eachInProducts>
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${com.superkids.domain.Product.findByShoppingItem(it['item'])}</td>

                            <td>${it['qty']}</td>

                            <td><img src="${createLink(controller:'product', action:'displayHoverImage', id:product.id)}" style="height:50px; width:65px;" /><g:remoteLink controller="product" action="remove"
				params="${[id:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).id, class:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).class, version:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).version, cartPage:true]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Remove
         			</g:remoteLink></td>
                        </tr>
                    </sks:eachInProducts>
                    </tbody>
                </table>

      <g:if test="${checkedOutItems}">
	<tr>
		<td><h2>Checked out items</h2></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<g:each in="${checkedOutItems.sort{it.id}}" var="item">
		<tr>
			<td>
				${com.metasieve.shoppingcart.Shoppable.findByShoppingItem(item['item']) ?: com.metasieve.shoppingcart.ShoppingCartInterfaceTestProduct.findByShoppingItem(item['item'])}
			</td>
			<td>
				${item['qty']}
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</g:each>
</g:if>










