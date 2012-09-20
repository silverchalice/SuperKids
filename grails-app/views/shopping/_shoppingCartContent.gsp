<g:if test="${session.checkedOutItems}">
    <g:each in="${session.checkedOutItems}" var="item">
        <div class="order-item"><img
                src="${createLink(controller: 'product', action: 'displayImage', id: com.superkids.domain.Product.findByShoppingItem(it['item']).id)}"
                alt=""/>

            <h2>${com.superkids.domain.Product.findByShoppingItem(item['item'])}?.name</h2>

            <p>Made by ${com.superkids.domain.Product.findByShoppingItem(item['item'])}?.sponsor?.name with Ultragrain</p>

            <div class="complete"><span>Order Completed</span>
            </div>
        </div>
    </g:each>

</g:if>
<g:else>
    <sks:eachInProducts>
        <div class="order-item"><img
                src="${createLink(controller: 'product', action: 'displayImage', id: com.superkids.domain.Product.findByShoppingItem(it['item']).id)}"
                alt=""/>

            <h2>${com.superkids.domain.Product.findByShoppingItem(item['item'])}?.name</h2>

            <p>Made by ${com.superkids.domain.Product.findByShoppingItem(item['item'])}?.sponsor?.name with Ultragrain</p>

            <div class="remove"><g:remoteLink controller="product" action="remove"
                                              params="${[id: (com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).id, class: (com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).class, version: (com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).version]}"
                                              update="shoppingCartContent">Remove from order</g:remoteLink></div>
        </div>
    </sks:eachInProducts>

</g:else>