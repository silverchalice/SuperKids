<table style="width:393px; float:left; margin:10px 5px;">
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.likeRating" default="Rating" /></label></td>
		<td class="value" valign="top"><g:select name="assessment.likeRating" from="${1..10}" style="width:140px; padding:2px; 5px"
          noSelection="['':' ']"/></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.interestRating" default="Interest" /></label></td>
		<td class="value" valign="top"><g:select name="assessment.interestRating" from="${1..10}" style="width:140px; padding:2px; 5px"
          noSelection="['':' ']"/></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.likeComment" default="Like" /></label></td>
		<td class="value" valign="top"><g:textArea name="assessment.likeComment" style="width:220px; height:70px; padding:2px; 5px"
          noSelection="['':' ']"/></td>
	</tr>
	<tr value="prop">
		<td class="name" valign="top"><label>${product?.name} <g:message code="assessment.changeComment" default="Change" /></label></td>
		<td class="value" valign="top"><g:textArea name="assessment.changeComment" style="width:220px; height:70px; padding:2px; 5px"
          noSelection="['':' ']"/></td>
	</tr>
</table>