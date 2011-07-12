
	<br/><br/>
      <g:if test="${products}">

                   <table style="border:0; border-style:none; border-color:white">
                   
                    <tbody>
						<g:each in="${products}" var="product">
							<tr>
								<td style="width:110px; padding-left:18px"><img class="cartThumbnail" src="${createLink(controller:'product', action:'displayImage', id:product.id)}" alt="" /> </td>

								<td valign="center" style="float:left;width: 260px;padding-top:30px; font-size:12px">${product.name}</td>

								<td style="float:right;width: 100px;padding-top:30px;"><span style="font-weight:bold">ORDERED</span>
								</td>
							</tr>
						</g:each>
						<tr><td></td><td></td></tr>
                    </tbody>
                </table>
                   

					
        </g:if>
