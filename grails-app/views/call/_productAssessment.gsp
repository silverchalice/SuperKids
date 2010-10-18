<table style="width:440px; float:left; margin:10px 5px;">
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.likeRating" default="Rating" /></label> </td>
		<td class="value" valign="top"><g:radioGroup name="assessment.${product?.name}.likeRating" values="['1', '2', '3', '4','5']" labels="['1 ', '2 ', '3 ', '4 ','5 ']">
			<g:message code="${it.label}" />${it.radio}
		</g:radioGroup><label style="margin-left:50px">Did not Receive</label><g:checkBox style="float:right" name="assessment.${product?.name}.didNotReceive" value="${false}"/></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.interestRating" default="Interest" /></label></td>
		<td class="value" valign="top"><g:radioGroup name="assessment.${product?.name}.interestRating" values="['1', '2', '3', '4','5']" labels="['1 ', '2 ', '3 ', '4 ','5 ']">
			<g:message code="${it.label}" />${it.radio}
		</g:radioGroup></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.likeComment" default="Like" /></label></td>
		<td class="value" valign="top"><g:textArea name="assessment.${product?.name}.likeComment" style="width:220px; height:70px; padding:2px; 5px"/></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.changeComment" default="Change" /></label></td>
		<td class="value" valign="top"><g:textArea name="assessment.${product?.name}.changeComment" style="width:220px; height:70px; padding:2px; 5px"/></td>
	</tr>
</table>