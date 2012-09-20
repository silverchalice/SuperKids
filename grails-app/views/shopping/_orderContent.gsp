<g:if test="${products}">
    <g:each in="${products}" var="product">
        <div class="order-item"> <img class="cartThumbnail" src="${createLink(controller:'product', action:'displayImage', id:product.id)}" alt="" />
            <h2>${product?.name}</h2>
            <p>Made by ${product?.sponsor?.name} with ${product.ultragrain ? 'Ultragrain' : 'Sustagrain'}</p>
            <div class="complete"><span>Order Completed</span>   </div>
        </div>
    </g:each>

</g:if>