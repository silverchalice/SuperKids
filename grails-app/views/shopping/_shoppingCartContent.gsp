<g:if test="${session.checkedOutItems}">
    <g:each in="${session.checkedOutItems}" var="item">
        <div class="order-item">
            <img
                src="${createLink(controller: 'product', action: 'displayImage', id: com.superkids.domain.Product.findByShoppingItem(it['item']).id)}"
                alt=""/>

            <h2>${com.superkids.domain.Product.findByShoppingItem(item['item'])}?.name</h2>

            <p>Made by ${com.superkids.domain.Product.findByShoppingItem(item['item'])?.sponsor?.name}</p>

            <div class="complete"><span>Order Completed</span>
            </div>
        </div>
    </g:each>

</g:if>
<g:else>
    <sks:eachInProducts>
        <div class="order-item"><img src="${createLink(controller: 'product', action: 'displayImage', id: com.superkids.domain.Product.findByShoppingItem(it['item'])?.id)}" alt=""/>

            <h2>${com.superkids.domain.Product.findByShoppingItem(it['item'])?.name}</h2>

            <p>Made by ${com.superkids.domain.Product.findByShoppingItem(it['item'])?.sponsor?.name} </p>

            <div class="remove">
                <g:link controller="product" action="remove" id="${com.superkids.domain.Product.findByShoppingItem(it['item'])?.id}">Remove from order</g:link>

            </div>
        </div>
    </sks:eachInProducts>

</g:else>