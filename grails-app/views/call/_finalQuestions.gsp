<div style="width:420px;float:left">
	<table style="margin-top:10px">
		<tr>
			<td>
				<label style="font:12px" for="otherProducts" >What other whole grain products would you like to see developed?</label>
				<br/><br/>
				<g:textArea name="otherProducts" style="width:390px; height:110px"/>
			</td>
		</tr>
	</table>
	<table style="margin-top:10px">
		<tr>
			<td>
				<label style="font:12px" for="programFeedback" >What positive or negative comments do you have about the SuperKids program in general?</label>
				<br/><br/>
				<g:textArea name="programFeedback" style="width:390px; height:110px"/>
			</td>
		</tr>
	</table>
	<table style="margin-top:10px">
		<tr>
			<td colspan="2">
				<label style="font-size:12px">Are there other products that you are currently using that you would like to see reformulated with Sustagrain and/or Ultragrain? Please be specific:</label>
			</td>
		</tr>
		<tr>
			<td>
				<label style="font:11px/12px verdana,arial,helvetica,sans-serif;" for="reformulations.1" >Other S&U MFG #1:</label>
			</td>
			<td>
				<g:textField name="reformulations.1" style="width:250px;"/>
			</td>
		</tr>
		<tr>
			<td>
				<label style="font:11px/12px verdana,arial,helvetica,sans-serif;" for="reformulations.2" >Other S&U Product #1:</label>
			</td>
			<td>
				<g:textField name="reformulations.2" style="width:250px;"/>
			</td>
		</tr>
		<tr>
			<td>
				<label style="font:11px/12px verdana,arial,helvetica,sans-serif;" for="reformulations.4" >Other S&U MFG #2:</label>
			</td>
			<td>
				<g:textField name="reformulations.4" style="width:250px;"/>
			</td>
		</tr>
		<tr>
			<td>
				<label style="font:11px/12px verdana,arial,helvetica,sans-serif;" for="reformulations.3" >Other S&U Product #2:</label>
			</td>
			<td>
				<g:textField name="reformulations.3" style="width:250px;"/>
			</td>
		</tr>

		<tr>
			<td>
				<label style="font:11px/12px verdana,arial,helvetica,sans-serif;" for="reformulations.5" >Other S&U Product #3</label>
			</td>
			<td>
				<g:textField name="reformulations.5" style="width:250px;"/>
			</td>
		</tr>
		<tr>
			<td>
				<label style="font:11px/12px verdana,arial,helvetica,sans-serif;" for="reformulations.6" >Other S&U MFG #3</label>
			</td>
			<td>
				<g:textField name="reformulations.6" style="width:250px;"/>
			</td>
		</tr>

	</table>
</div>
<div style="width:450px;float:left; margin-top:10px; margin-left:20px">
	<table>
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
	<table>
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
	<table>
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
	</table>
	
</div>