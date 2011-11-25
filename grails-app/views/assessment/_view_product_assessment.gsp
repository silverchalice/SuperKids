<table>
	<tr>
		<th>&nbsp;</th>
		<th>Question</th>
		<th>Answer</th>
	</tr>
	<tr>
		<td rowspan="4" style="width:100px"><img style="width:90px" src="${createLink(controller:'product', action:'displayImage', id:assessment.product.id)}" alt="" /><h3>${assessment?.product.name}</h3></td>
		<td width="60%">On a scale of 1-5 (where 1 is "not liked" and 5 is "well liked" overall, how was the product liked? </td>
		<td>${assessment.likeRating}</td>
	</tr>
	<tr>
		<td width="60%">What two things did you like most about this product? </td>
		<td>${assessment.likeComment}</td>
	</tr>
	<tr>
		<td width="60%">What one thing would you recommend be changed about this sampled product? </td>
		<td>${assessment.changeComment}</td>
	</tr>
	<tr>
		<td width="60%">Please rate your interest in purchasing this product (where 1 is "low interest" and 5 is "high interest). </td>
		<td>${assessment.iRating}</td>
	</tr>
    <g:if test="${assessment.product.id == 23}">
        <tr>
       		<td width="60%">Favorite Pasta </td>
       		<td>${assessment.favorite}</td>
       	</tr>
    </g:if>
</table>
