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
					<td><p style="margin-top:5px">
						<sks:adminAssessLink id="${productOrder.id}" />
					</p></td>
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


<div id="assessForm">
	<g:form action="adminAssessProduct">
		<g:hiddenField name="productOrderId" id="productOrderId" />
		<h3>Assessment Origin</h3>
		<g:radioGroup name="orderType" values="['PHONE','WEB','EMAIL', 'FAX', 'MAIL']" labels="['Phone','Web','Email', 'Fax', 'Mail']" value="5" >
			<g:message code="${it.label}" />: ${it.radio}
		</g:radioGroup>
		<br/>
		<br/>
		<h3>Assessment Question 1 of 4</h3>
		On a scale of 1 to 5 where 1 is 'not liked' and 5 is 'well liked', how did you like this product?:<br/>
		<g:radioGroup name="likeRating" values="['1', '2', '3', '4','5']" labels="['1', '2', '3', '4','5']" value="3" >
			<g:message code="${it.label}" />${it.radio}
		</g:radioGroup>
		<br/>
		<br/>
		<h3>Assessment Question 2 of 4</h3>
		What two things did you like most about this product? <br/>
		<g:textArea name="likeComment" style="width:465px" />
		<br/>
		<h3>Assessment Question 3 of 4</h3>
		What one thing would you recommend be changed about this sampled product? <br/>
		<g:textArea name="changeComment"  style="width:465px" />
		<br/>
		<h3>Assessment Question 4 of 4</h3>
		Please rate your interest in purchasing this product (where 1 is "low interest" and 5 is "high interest):<br/>
		<g:radioGroup name="iRating" values="['1', '2', '3', '4','5']" labels="['1', '2', '3', '4','5']" value="3" >
			<g:message code="${it.label}" />${it.radio}
		</g:radioGroup>
		<br/>
		<br/>
		<g:submitButton name="submitAssessment" id="submitAssessment" value="Continue" /> 

	</g:form>
</div>