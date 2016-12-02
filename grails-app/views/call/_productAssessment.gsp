<table style="width:440px; height: 300px; float:left; margin:10px 5px 0px 5px;">
    <tr class="prop">
      <td colspan="2"><label>${product.sponsor?.name} - ${product?.title}</label></td>
    </tr>
	<tr class="prop">
		<td class="name" valign="top"><label for="assessment.${product?.id}.likeRating"> <g:message code="assessment.likeRating" default="Product Interest" /></label> </td>
		<td class="value" valign="top">
			<g:select name="assessment.${product?.id}.likeRating" from="${1..5}" value="${likeRating}" tabindex="1"
          noSelection="['':'']" style="width:100px;"/>
			<label style="margin-left:40px;">Did Not Receive</label><g:checkBox style="float:right; margin-top:8px" name="assessment.${product?.id}.didNotReceive" value="${false}"/>
            <br/><label style="margin-left:150px;">Did Not Sample</label><g:checkBox style="float:right; margin-top:8px" name="assessment.${product?.id}.didNotSample" value="${false}"/></td>
	</tr>
	<tr class="prop">
		<td class="name" valign="top"><label for="assessment.${product?.id}.likeComment"><g:message code="assessment.likeComment" default="Like Comments" /></label></td>
		<td class="value" valign="top"><g:textArea rows="" tabindex="3" cols="" name="assessment.${product?.id}.likeComment" style="padding:2px; 5px; height:70px; width:270px;"/></td>
	</tr>
	<tr class="prop">
		<td class="name" valign="top"><label for="assessment.${product?.id}.changeComment"><g:message code="assessment.changeComment" default="Change Comments" /></label></td>
		<td class="value" valign="top"><g:textArea rows="" tabindex="4" cols="" name="assessment.${product?.id}.changeComment" style="padding:2px; 5px; height:70px; width:270px;"/></td>
	</tr>
</table>
