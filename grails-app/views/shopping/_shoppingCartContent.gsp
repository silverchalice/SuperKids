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
      <g:if test="${session.checkedOutItems}">
          <br>
          <h2>Checked out items</h2><br />

                   <table style="border:0; border-style:none; border-color:white">
                    <tbody>
                	<g:each in="${session.checkedOutItems}" var="item">
                        <tr>
                        
                            <td>${com.superkids.domain.Product.findByShoppingItem(item['item'])}</td>

                        </tr>
                       </g:each>
                    </tbody>
                </table><br />
        </g:if>
        <g:else>
                   <table style="border:0; border-style:none; border-color:white">
                    </thead>
                    <tbody>
                    <sc:each>
                        <tr>
                        
                            <td>${com.superkids.domain.Product.findByShoppingItem(it['item'])}</td>
                        
                            <td><g:remoteLink controller="product" action="remove"
				params="${[id:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).id, class:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).class, version:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).version]}"
				update="shoppingCartContent">
				Remove
         			</g:remoteLink></td>                        
                        </tr>
                    </sc:each>
                    <tr><td></td><td></td></tr>
                    </tbody>
                </table>
                   <sks:hasNotPlacedCurrentOrder>
                   	<g:link controller="product" style="background-image:url('/SuperKids/images/layout/buttons/CheckoutButton.gif'); padding:10px 74px; position:absolute; top:443px; left:149px; z-index:3" action="check_out">&nbsp;</g:link>
				    <g:link controller="home" style="background-image:url('/SuperKids/images/layout/buttons/ContinueShoppingButton.gif'); padding:10px 85px; position:absolute; top:443px; left:303px; z-index:3" action="order">&nbsp;</g:link>
					<a href="#" style="background-image:url('/SuperKids/images/layout/buttons/PrintButton.gif'); padding:10px 50px; position:absolute; top:443px; left:481px; z-index:3" onclick="window.print(); return false;">&nbsp;</a>
                   </sks:hasNotPlacedCurrentOrder>

					
        </g:else>
