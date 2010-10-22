

<%@ page import="com.superkids.domain.ContactRequest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public_li" />
        <g:set var="entityName" value="${message(code: 'contactRequest.label', default: 'ContactRequest')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body" style="height:470px; overflow:auto;">
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
                    <strong>We welcome inquiries, comments and suggestions.</strong></span></span><span style="color: #993300"><strong> </strong></span></p> 
<p><span style="color: #000000"><span style="font-size: x-small">You can contact us via phone or fax at the numbers shown. To send us an email, please use the form below.</span></span></p> 
<p><span style="color: #993300"><strong>SuperKids Headquarters</strong></span><span><span><span><strong><span><span><br /> 
</span></span></strong></span></span></span><span style="color: #000000"><span>P.O. Box 16170<br /> 
St. Louis MO 63105-9713 <br /> 
<br /> 
Toll Free: (877) 862-8828&nbsp; *&nbsp; Fax: (314) 862-8829<br /> 
</span></span><span style="color: #ff9900"><a href="mailto:melissac@sdastl.com"><strong><span style="color: #ff6600">melissac@sdastl.com</span></strong></a></span><strong><span style="color: #ff9900"><span style="color: #ff6600"> </span></span></strong></p> 
<p class="required">Text shown in red below is required so that we can follow up with you.</p>
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label class="required">Full Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${contactRequestInstance?.firstName}" /> <g:textField name="lastName" value="${contactRequestInstance?.lastName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email" class="required">Your Email Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${contactRequestInstance?.email}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone">Your Telephone Number:</label>
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
                                    <g:textField name="districtName" value="${contactRequestInstance?.districtName}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="street">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance?.address, field: 'street', 'errors')}">
                                    <g:textField name="street" value="${contactRequestInstance?.address?.street}" /><br /><br />
                                    <g:textField name="street2" value="${contactRequestInstance?.address?.street2}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="city">City:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance?.address, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${contactRequestInstance?.address?.city}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state">State:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance?.address, field: 'state', 'errors')}">
                                    <g:select name="address.state" from="${states}" value="${contactRequestInstance?.address?.state}" optionValue="value" valueMessagePrefix="address.state" optionKey="key" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="zip">Zip:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance?.address, field: 'zip', 'errors')}">
                                    <g:textField name="zip" maxlength="5" value="${fieldValue(bean: contactRequestInstance?.address, field: 'zip')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="message" class="required">Your Interest:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactRequestInstance, field: 'message', 'errors')}">
			        <textarea name="message" rows="10" cols="30" value="${contactRequestInstance?.message}"></textarea> 
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div><br />
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Submit" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
