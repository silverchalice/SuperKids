<style type="text/css">
table {
    border: 1px solid #ccc;
    width: 100%
}
tr {
    border: 0;
}
td, th {
    font: 11px verdana, arial, helvetica, sans-serif;
    line-height: 12px;
    padding: 5px 6px;
    text-align: left;
    vertical-align: top;
}
th {
    background: #fff url(../images/skin/shadow.jpg);
    color: #666;
    font-size: 11px;
    font-weight: bold;
    line-height: 17px;
    padding: 2px 6px;
}
th a:link, th a:visited, th a:hover {
    color: #333;
    display: block;
    font-size: 10px;
    text-decoration: none;
    width: 100%;
}
th.asc a, th.desc a {
    background-position: right;
    background-repeat: no-repeat;
}
th.asc a {
    background-image: url(../images/skin/sorted_asc.gif);
}
th.desc a {
    background-image: url(../images/skin/sorted_desc.gif);
}

.odd {
    background: #f7f7f7;
}
.even {
    background: #fff;
}

/* LIST */

.list table {
    border-collapse: collapse;
}
.list th, .list td {
    border-left: 1px solid #ddd;
}
.list th:hover, .list tr:hover {
    background: #b2d1ff;
}
</style>
      <g:if test="${checkedOutItems}">
          <br>
          <h2>Checked out items</h2><br />

                   <table>
                    <thead>
                        <tr>
                        
                            <th>Product</th>
                        
                            <th>Quantity</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                	<g:each in="${checkedOutItems}" var="item">
                        <tr>
                        
                            <td>${com.superkids.domain.Product.findByShoppingItem(item['item'])}</td>
                        
                            <td>${item['qty']}</td>

                        </tr>
                       </g:each>
                    </tbody>
                </table><br />
        </g:if>
        <g:else>
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
                        <tr>
                        
                            <td>${com.superkids.domain.Product.findByShoppingItem(it['item'])}</td>
                        
                            <td>${it['qty']}</td>
                        
                            <td><g:remoteLink controller="product" action="remove"
				params="${[id:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).id, class:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).class, version:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).version]}"
				update="shoppingCartContent"
				onComplete="Effect.Pulsate('shoppingCartContent', {pulses: 1, duration: 1.0});">
				Remove
         			</g:remoteLink></td>                        
                        </tr>
                    </sc:each>
                    </tbody>
                </table>
        </g:else>
