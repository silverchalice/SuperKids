

<%@ page import="com.superkids.domain.ContactRequest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public" />
        <g:set var="entityName" value="${message(code: 'contactRequest.label', default: 'ContactRequest')}" />
        <title>SuperKids | Contact Us</title>
    </head>
    <body>
        <style type="text/css">
			div.errors {
				background: #fff3f3;
				border: 1px solid red;
				color: #cc0000;
				margin: 10px 0 5px 0;
				padding: 5px 0 5px 0;
			}

			td.name {
				text-align:right;
				width:180px;
				line-height:20px;
				font-weight:bolder;
					}


			div.errors ul {
				list-style: none;
				padding: 0;
			}
			div.errors li {
				background: url(../images/skin/exclamation.png) 8px 0% no-repeat;
				line-height: 16px;
				padding-left: 30px;
			}

			td {
				padding:2px
			}

			td.errors select {
				border: 1px solid red;
			}
			td.errors input {
				border: 1px solid red;
			}
		</style>
        <div id="contentInsetInner">
            <h1>Contact Us</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${contactRequestInstance}">
            <div class="errors">
                <g:renderErrors bean="${contactRequestInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <img style="width: 331px; height: 262px" height="280" alt="" hspace="10" width="350" align="left" src="${request.contextPath}/images/kidsjumpingoutoflogo.jpg" />
                    <strong style="color:#993300; font-size:16px">We welcome inquiries, comments and suggestions.</strong>     <br/>
					
					<p><span style="color: #000000"><span style="font-size: x-small">You can contact us via phone or fax at the numbers shown. To send us an email, please use the form below.</span></span></p>
					<p><strong style="color: #993300">SuperKids Headquarters</strong><br/>
						<span style="color: #000000">P.O. Box 16170</span><br />
						St. Louis MO 63105-9713 <br />
						<br />
					Toll Free: (877) 862-8828&nbsp; *&nbsp; Fax: (314) 862-8829<br />
					<span style="color: #ff9900"><a href="mailto:melissac@sdastl.com"><strong><span style="color: #ff6600">melissac@sdastl.com</span></strong></a></span><strong><span style="color: #ff9900"><span style="color: #ff6600"> </span></span></strong></p>
					<br/>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p>&nbsp;</p>
					<p class="required" style="font-size:12px">Text shown in red below is required so that we can follow up with you.</p>
						<table style="border:0; padding:0">
							<tbody>

								<tr class="prop">
									<td valign="top" class="name">
										<label class="required">Full Name:</label>
									</td>
									<td valign="top" style="width:200px" class="value ${hasErrors(bean: contactRequestInstance, field: 'firstName', 'errors')}">
										<g:textField name="firstName" value="${contactRequestInstance?.firstName}" />     <g:textField name="lastName" value="${contactRequestInstance?.lastName}" />
									</td>
								</tr>


								<tr class="prop">
									<td valign="top" class="name">
										<label for="email" class="required">Your Email Address:</label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'email', 'errors')}">
										<g:textField name="email" style="width:200px" value="${contactRequestInstance?.email}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label>Your Telephone Number:</label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'phone', 'errors')}">
										(<g:textField name="phone1" size="3" maxlength="3" value="" />) <g:textField name="phone2" size="3" maxlength="3" value="" />-<g:textField name="phone3" size="4" maxlength="4" value="" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="districtName">Your School District or Company Name:</label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'districtName', 'errors')}">
										<g:textField name="districtName" style="width:200px"  value="${contactRequestInstance?.districtName}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="street">Address:</label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'street', 'errors')}">
										<g:textField name="street" style="width:200px"  value="${contactRequestInstance?.street}" /><br /><br />
										<g:textField name="street2" style="width:200px"  value="${contactRequestInstance?.street2}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="city">City:</label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'city', 'errors')}">
										<g:textField name="city" style="width:200px"  value="${contactRequestInstance?.city}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="state">State:</label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'state', 'errors')}">
										<g:select name="state" from="${states}" value="${contactRequestInstance?.state}" optionValue="value" valueMessagePrefix="state" optionKey="key" noSelection="${['':'Select a state...']}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label for="zip">Zip:</label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'zip', 'errors')}">
										<g:textField name="zip" maxlength="5" value="${fieldValue(bean: contactRequestInstance, field: 'zip')}" />
									</td>
								</tr>

								<tr class="prop">
									<td valign="top" class="name">
										<label class="required">Your Interest:</label>
									</td>
									<td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'firstName', 'errors')}">
									<textarea name="message" rows="10" cols="30" value="${contactRequestInstance?.message}"></textarea>
									</td>
								</tr>
							    <tr>
									<td>&nbsp;</td>
									<td>
										<div class="buttons">
										<span class="button"><g:submitButton name="create" class="save" value="Submit" /></span>
										</div>
									</td>
							    </tr>
							</tbody>
						</table>
					</div><br />

				</g:form>
           </div>
    </body>
</html>
