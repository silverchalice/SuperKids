<table style="width:440px; float:left; margin:10px 5px 0px 5px;">
    <tr class="prop">
      <td colspan="2"><label>${product?.name}</label></td>
    </tr>
	<tr class="prop">
		<td class="name" valign="top"><label> <g:message code="assessment.likeRating" default="Like Rating" /></label> </td>
		<td class="value" valign="top"><g:radioGroup name="assessment.${product?.name}.likeRating" values="['1', '2', '3', '4','5']" labels="['1 ', '2 ', '3 ', '4 ','5 ']">
			<g:message code="${it.label}" />${it.radio}
		</g:radioGroup><label style="margin-left:15px">Did not Receive</label><g:checkBox style="float:right" name="assessment.${product?.name}.didNotReceive" value="${false}"/></td>
	</tr>
	<tr class="prop">
		<td class="name" valign="top"><label><g:message code="assessment.interestRating" default="Interest Rating" /></label></td>
		<td class="value" valign="top"><g:radioGroup name="assessment.${product?.name}.interestRating" values="['1', '2', '3', '4','5']" labels="['1 ', '2 ', '3 ', '4 ','5 ']">
			<g:message code="${it.label}" />${it.radio}
		</g:radioGroup></td>
	</tr>
	<tr class="prop">
		<td class="name" valign="top"><label><g:message code="assessment.likeComment" default="Like Comments" /></label></td>
		<td class="value" valign="top"><g:textArea rows="" cols="" name="assessment.${product?.name}.likeComment" style="padding:2px; 5px; height:70px; width:270px;"/></td>
	</tr>
	<tr class="prop">
		<td class="name" valign="top"><label><g:message code="assessment.changeComment" default="Change Comments" /></label></td>
		<td class="value" valign="top"><g:textArea rows="" cols="" name="assessment.${product?.name}.changeComment" style="padding:2px; 5px; height:70px; width:270px;"/></td>
	</tr>
</table>