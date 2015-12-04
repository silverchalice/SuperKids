  <script type="text/javascript">
    $(document).ready(function(){

            var checkboxes = document.getElementsByTagName('input');

            for (var i=0; i<checkboxes.length; i++)  {
              if (checkboxes[i].type == 'checkbox')   {
                checkboxes[i].checked = false;
              }
            }

        });
    </script>

<div style="width:420px;float:left">
	<table style="margin-top:10px">
		<tr>
			<td>
				<label style="font-size:12px" for="programFeedback" >Please give us feedback on the SuperKids program in general.</label>
				<br/><br/>
				<g:textArea name="programFeedback" style="width:390px; height:110px"/>
			</td>
		</tr>
	</table>
	<table style="margin-top:10px">
		<tr>
    <td colspan="2">
      <label style="font-size:12px">If you&#8217;ve participated in the SuperKids Program in the past, did you add any of the item you&#8217;ve sampled to your menu?</label>
      <br/><br/>
      <label style="float:left; padding-left: 25px;"> Yes:&nbsp; </label> 
      <g:radio name="addedPastItemsToMenuA" value="true" style="float:left; padding-right: 10px" />
      <label style="float:left; padding-left: 25px;"> No:&nbsp; </label> 
      <g:radio name="addedPastItemsToMenuA" value="false" style="float:left; padding-right: 10px" checked="true" />
    </td>
		</tr>

	</table>
	<table style="margin-top:10px">
		<tr>
			<td>
				<label style="font-size:12px" for="overallPerceptions" >What is your overall perception of Ultragrain and foods made with Ultragrain? </label>
				<br/><br/>
				<g:textArea name="overallPerceptions" style="width:390px; height:110px"/>
			</td>
		</tr>
	</table>
</div>
	<!--<table style="width: 450px;">
		<tr>
			<td><strong>Broker/Distributor #1 Name: </strong></td>
			<td><input type="text" name="broker.name" size="20" maxlength="50" value="${broker?.name}"></td>
		</tr>
		<tr>
			<td><strong>Representative Name: </strong></td>
			<td><input type="text" name="broker.rep" size="20" maxlength="50" value="${broker?.rep}"></td>
		</tr>
		<tr>
			<td><strong>Email: </strong></td>
			<td><input type="text" name="broker.email" size="20" maxlength="50" value="${broker?.email}"></td>
		</tr>
		<tr>
			<td><strong>Telephone: </strong></td>
			<td><input type="text" name="broker.phone" size="20" maxlength="50" value="${broker?.phone}"></td>
		</tr>
		<tr>
			<td><strong>Address: </strong></td>
			<td><input type="text" name="broker.street" size="20" maxlength="255" value="${broker?.street}"></td>
		</tr>
		<tr>
			<td><strong>City: </strong></td>
			<td><input type="text" name="broker.city" size="20" maxlength="50" value="${broker?.city}"></td>
		</tr>
		<tr>
			<td><strong>State</strong></td>
			<td align="left">
				<g:textField name="broker.state" value="${broker?.state}" size="20" maxlength="50"/>
			</td>
		</tr>
		<tr>
			<td><strong>Zip: </strong></td>
			<td><input type="text" name="broker.zip" size="10" maxlength="20" value="${broker?.zip}"></td>
		</tr>
	</table>
    <br/>
	<table style="width: 450px;">
		<tr>
			<td><strong>Broker/Distributor #2 Name: </strong></td>
			<td><input type="text" name="broker2.name" size="20" maxlength="50" value="${broker2?.name}"></td>
		</tr>
		<tr>
			<td><strong>Representative Name: </strong></td>
			<td><input type="text" name="broker2.rep" size="20" maxlength="50" value="${broker2?.rep}"></td>
		</tr>
		<tr>
			<td><strong>Email: </strong></td>
			<td><input type="text" name="broker2.email" size="20" maxlength="50" value="${broker2?.email}"></td>
		</tr>
		<tr>
			<td><strong>Telephone: </strong></td>
			<td><input type="text" name="broker2.phone" size="20" maxlength="50" value="${broker2?.phone}"></td>
		</tr>
		<tr>
			<td><strong>Address: </strong></td>
			<td><input type="text" name="broker2.street" size="20" maxlength="255" value="${broker2?.street}"></td>
		</tr>
		<tr>
			<td><strong>City: </strong></td>
			<td><input type="text" name="broker2.city" size="20" maxlength="50" value="${broker2?.city}"></td>
		</tr>
		<tr>
			<td><strong>State</strong></td>
			<td align="left">
				<g:textField name="broker2.state" value="${broker2?.state}" size="20" maxlength="50"/>
			</td>
		</tr>
		<tr>
			<td><strong>Zip: </strong></td>
			<td><input type="text" name="broker2.zip" size="10" maxlength="20" value="${broker2?.zip}"></td>
		</tr>
	</table>
	<table style="width:450px;">
		<tr><td colspan="2"><label style="font:12px" for="programFeedback" >What would be a good time for your broker to contact you?</label></td></tr>
		<tr>
			<td>Fall:</td>
			<td><g:checkBox name="fall" value="${customerInstance?.fall}" /> </td>
		</tr>
		<tr>
			<td>Spring:</td>
			<td><g:checkBox name="spring" value="${customerInstance?.spring}" /> </td>
		</tr>
		<tr>
			<td>AM:</td>
			<td><g:checkBox name="am" value="${customerInstance?.am}" /> </td>
		</tr>
		<tr>
			<td>PM:</td>
			<td><g:checkBox name="pm" value="${customerInstance?.pm}" /> </td>
		</tr>
	</table>-->
