<table>
	<tr>
		<th>&nbsp;</th>
		<th>Question</th>
		<th>Answer</th>
	</tr>
	<tr>
		<td rowspan="4" style="width:100px"><img style="width:90px" src="${createLink(controller:'product', action:'displayImage', id:assessment.product.id)}" alt="" /><h3>${assessment?.product.name}</h3></td>
		<td width="60%">On a scale of 1-5 (1-very low; 5-very high), please rate your interest in adding this item to your school menu.</td>
		<td>${assessment.likeRating}</td>
	</tr>
	<tr>
		<td width="60%">What things did you like most (list as many as necessary)?</td>
		<td>${assessment.likeComment}</td>
	</tr>
	<tr>
		<td width="60%">What things would you change (list as many as necessary)?</td>
		<td>${assessment.changeComment}</td>
	</tr>
    <g:if test="${assessment.product.id == 23}">
        <tr>
       		<td width="60%">Favorite Pasta </td>
       		<td>${assessment.favorite}</td>
       	</tr>
    </g:if>
</table>
