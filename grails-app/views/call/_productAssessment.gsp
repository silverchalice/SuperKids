<table style="width:440px; float:left; margin:10px 5px;">
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.likeRating" default="Rating" /></label> </td>
		<td class="value" valign="top"><g:select name="assessment.${product?.name}.likeRating" from="${1..10}" style="width:140px; padding:2px; 5px"
          noSelection="['':' ']"/> <label style="margin-left:20px">Did not Receive</label><g:checkBox style="margin-left:8px" name="assessment.${product?.name}.didNotReceive" value="${false}"/></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.interestRating" default="Interest" /></label></td>
		<td class="value" valign="top"><g:select name="assessment.${product?.name}.interestRating" from="${1..10}" style="width:140px; padding:2px; 5px"
          noSelection="['':' ']"/></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.likeComment" default="Like" /></label></td>
		<td class="value" valign="top"><g:textArea name="assessment.${product?.name}.likeComment" style="width:240px; height:70px; padding:2px; 5px"/></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.changeComment" default="Change" /></label></td>
		<td class="value" valign="top"><g:textArea name="assessment.${product?.name}.changeComment" style="width:220px; height:70px; padding:2px; 5px"/></td>
	</tr>
</table>