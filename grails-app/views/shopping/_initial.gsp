<p><g:remoteLink action="add"
				params="${[id:productInstance.id, class:com.superkids.domain.Product.class, version:1]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Add ${productInstance.name} to cart</g:remoteLink></p>
