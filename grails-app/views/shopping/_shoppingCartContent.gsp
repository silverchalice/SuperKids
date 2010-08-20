<sc:each>
  <p>${com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.metasieve.shoppingcart.ShoppingCartInterfaceTestProduct.findByShoppingItem(it['item'])} (${it['qty']}) | <g:remoteLink action="add"
				params="${[id:1, class:com.superkids.domain.Product.class, version:1]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">Add</g:remoteLink> | 
			<g:remoteLink action="remove"
				params="${[id:1, class:com.superkids.domain.Product.class, version:1]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">Remove</g:remoteLink> | 
			<g:remoteLink action="removeAll"
				params="${[id:1, class:com.superkids.domain.Product.class, version:1]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">Remove All</g:remoteLink>
</sc:each>
<g:if test="${checkedOutItems}">
  <h2>Checked out items</h2>
  <g:each in="${checkedOutItems}" var="item">
  ${com.metasieve.shoppingcart.Shoppable.findByShoppingItem(item['item']) ?: com.metasieve.shoppingcart.ShoppingCartInterfaceTestProduct.findByShoppingItem(item['item'])} (${item['qty']})
	</g:each>
</g:if>
  </p>
