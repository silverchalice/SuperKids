<%@ page import="com.superkids.domain.ShippingDate" %>
			<table cellpadding="5" cellspacing="0" width="100%">
				<tr>
					<td colspan="2" align="left" class="adminheadline">Manual Order</td>
				</tr>
				<tr>
					<th>ITEM NAME</th>
					<th>ORDER</th> 
				</tr>
				<g:form name="OrderProduct" action="add_order" method="post">
				<g:hiddenField name="id" value="${customerInstance.id}" />
					<g:each in="${products}" var="product" status="i">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td><img style="float:left; width:50px; margin-right:10px" src="${createLink(controller:'product', action:'displayImage', id:product.id)}" alt="" />
						${product?.sponsor?.name}<sup>®</sup> ${product?.name}</td>
							<td><input type="checkbox" name="product" value="${product.id}" /></td>
						</tr>
						<tr>
					</g:each>
							<td colspan="2">
								<strong>Order Origin:</strong>
                                                                <label><input type="radio" name="orderType" value="PHONE" checked="checked" >Phone</label>
                                                                <label><input type="radio" name="orderType" value="WEB" >Web</label>
                                                                <label><input type="radio" name="orderType" value="EMAIL" >Email</label>
                                                                <label><input type="radio" name="orderType" value="FAX" >Fax</label>
                                                                <label><input type="radio" name="orderType" value="MAIL" >Mail</label>
					<br />
					<strong>Requested Ship Date:</strong>
					<g:select id="shippingDate"
							  name="shippingDate"
							  from="${ShippingDate.list()}" />
					<br /><br />
					<input type="submit" name="ADD" value="Add Checked Items" />
				</td>
			</tr>
			</g:form>
		</table>
