<table style="width:440px; float:left; margin:10px 5px 0px 5px;">
    <tr class="prop">
      <td colspan="2"><label>${product?.name}</label></td>
    </tr>
	<tr class="prop">
		<td class="name" valign="top"><label for="assessment.${product?.name}.likeRating"> <g:message code="assessment.likeRating" default="Like Rating" /></label> </td>
		<td class="value" valign="top">
			<g:select name="assessment.${product?.name}.likeRating" from="${1..5}" value="${likeRating}" tabindex="1"
          noSelection="['':'']" style="width:100px;"/>
			<label style="margin-left:40px;">Did not Receive</label><g:checkBox style="float:right; margin-top:8px" name="assessment.${product?.name}.didNotReceive" value="${false}"/></td>
	</tr>
	<tr class="prop">
		<td class="name" valign="top"><label for="assessment.${product?.name}.interestRating"><g:message code="assessment.interestRating" default="Interest Rating"  /></label></td>
		<td class="value" valign="top">	<g:select name="assessment.${product?.name}.interestRating" from="${1..5}" value="${interestRating}" tabindex="2"
          noSelection="['':'']" style="width:100px;"/></td>
	</tr>
	<tr class="prop">
		<td class="name" valign="top"><label for="assessment.${product?.name}.likeComment"><g:message code="assessment.likeComment" default="Like Comments" /></label></td>
		<td class="value" valign="top"><g:textArea rows="" tabindex="3" cols="" name="assessment.${product?.name}.likeComment" style="padding:2px; 5px; height:70px; width:270px;"/></td>
	</tr>
	<tr class="prop">
		<td class="name" valign="top"><label for="assessment.${product?.name}.changeComment"><g:message code="assessment.changeComment" default="Change Comments" /></label></td>
		<td class="value" valign="top"><g:textArea rows="" tabindex="4" cols="" name="assessment.${product?.name}.changeComment" style="padding:2px; 5px; height:70px; width:270px;"/></td>
	</tr>
	<g:if test="${product?.id == 23}">
		<tr class="prop">
			<td class="name" valign="top"><label for="assessment.${product?.name}.favorite"><g:message code="assessment.favorite" default="Favorite Pasta" /></label></td>
			<td class="value" valign="top"><g:textArea rows="1" tabindex="4" cols="" name="assessment.${product?.name}.favorite" style="padding:2px; height:16px; width:270px;"/></td>
		</tr>	
	</g:if>
</table>