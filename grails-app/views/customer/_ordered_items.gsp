<%@ page import="com.superkids.domain.ShippingDate" %>
<table cellpadding="5" cellspacing="0" style="width:100%; border: 1px solid #cccccc;">
		<tr>
			<td colspan="5" align="left" class="adminheadline">Ordered Items</td>
		</tr>
		<tr>
			<th>Item Name</th>
			<th>Order Date</th>
			<th>Req'd Ship Date</th>
			<th>Assessed</th>
			<th style="width:85px;">Not Received</th>
		</tr>
		<g:form name="OrderProduct" action="add_order" method="post">
		<g:hiddenField name="id" value="${customerInstance.id}" />
			<g:each in="${products}" var="productOrder" status="i">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td><img style="float:left; width:50px; margin-right:10px" src="${createLink(controller:'product', action:'displayImage', id:productOrder.product.id)}" alt="" />
						${productOrder.product?.sponsor?.name}<sup>®</sup> ${productOrder.product?.name}</td>
					<td><p style="margin-top:5px"><g:formatDate date="${customerInstance?.order.dateCreated}" format="M/d/yyyy" /></p></td>
					<td style="width:120px;"><p style="margin-top:5px">${customerInstance?.order?.shippingDate}</p></td>
					<td><p style="margin-top:5px"><sks:adminAssessLink id="${customerInstance?.id}"/></p></td>
					<td style="width:85px;">  <p style="margin-top:4px">
						<g:checkBox value="${productOrder.product.name}.didNotReceive"
								checked='unchecked'
								name="${productOrder.product.name}.didNotReceive"
								onclick="${remoteFunction(action:'toggleDidNotReceive', id:productOrder.id, params:'\'didNotReceive=\' + this.checked')}"/></p>
					</td>
				</tr>
			</g:each>

	</g:form>
</table>