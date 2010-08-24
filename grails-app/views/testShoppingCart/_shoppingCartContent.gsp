                   <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="item" title="Product" />
                        
                            <g:sortableColumn property="qty" title="Quantity" />
                        
                            <th> </th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <sc:each>
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${com.superkids.domain.Product.findByShoppingItem(it['item'])}</td>
                        
                            <td>${it['qty']}</td>
                        
                            <td><g:remoteLink controller="product" action="remove"
				params="${[id:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).id, class:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).class, version:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).version, cartPage:true]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Remove
         			</g:remoteLink></td>                        
                        </tr>
                    </sc:each>
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
	<g:each in="${checkedOutItems}" var="item">
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










