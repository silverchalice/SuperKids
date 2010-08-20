<sc:each>
	<tr>
		<td>
			${com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.metasieve.shoppingcart.ShoppingCartInterfaceTestProduct.findByShoppingItem(it['item'])}
		</td>
		<td>
			${it['qty']}
		</td>
		<td>
			<g:remoteLink action="add"
				params="${[id:1, class:com.superkids.domain.Product.class, version:1]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Add
			</g:remoteLink>
		</td>
		<td>
			<g:remoteLink action="remove"
				params="${[id:1, class:com.superkids.domain.Product.class, version:1]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Remove
			</g:remoteLink>
		</td>
		<td>
			<g:remoteLink action="removeAll"
				params="${[id:1, class:com.superkids.domain.Product.class, version:1]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Remove All
			</g:remoteLink>
		</td>
	</tr>
</sc:each>
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
