
	<br/><br/>
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
                   
                    <tbody>
						<sks:eachInProducts>
							<tr>
								<td style="width:110px; padding-left:18px"><img src="${createLink(controller:'product', action:'displayImage', id:com.superkids.domain.Product.findByShoppingItem(it['item']).id)}" alt="" /> </td>

								<td valign="center" style="float:left;width: 260px;padding-top:30px; font-size:12px">${com.superkids.domain.Product.findByShoppingItem(it['item'])}</td>

								<td style="float:right;width: 100px;padding-top:30px;"><g:remoteLink controller="product" action="remove"
									params="${[id:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).id, class:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).class, version:(com.metasieve.shoppingcart.Shoppable.findByShoppingItem(it['item']) ?: com.superkids.domain.Product.findByShoppingItem(it['item'])).version]}"
									update="shoppingCartContent">
									REMOVE
									</g:remoteLink>
								</td>
							</tr>
						</sks:eachInProducts>
						<tr><td></td><td></td></tr>
                    </tbody>
                </table>
                   

					
        </g:else>
