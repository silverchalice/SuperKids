<%@ page import="com.superkids.domain.Customer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'sks.js')}">
    </script>
    <style type="text/css">
    input {
        width: auto
    }

    #assessForm {
        width: 500px;
    }

    label {
        white-space: normal;
    }

    .prop .name {
        width: auto
    }

    .prop .value {
        width: auto
    }

    #assessForm {
        width: 500px;
    }

    #assessForm input {
        width: auto
    }

    </style>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
</div>

<div class="body">
<div style="margin:20px 0; padding:15px;">
    <g:form method="post" action="findSchoolDistrict">
        School District: <input type="text" name="query"/>
        <input type="submit" id="customerSearchButton" value="Search"/>
    </g:form>
</div>

<h1>Add a Customer</h1>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${customerInstance}">
    <div class="errors">
        <g:renderErrors bean="${customerInstance}" as="list"/>
    </div>
</g:hasErrors>
<g:form action="save" method="post">
    <g:hiddenField name="seq" value="9999"/>
<div style="float:left;">

<g:hiddenField name="id" value="${customerInstance?.id}"/>
<g:hiddenField name="version" value="${customerInstance?.version}"/>
<g:hiddenField name="offset" value="${offset}"/>
<g:hiddenField name="query" value="${query}"/>
<g:hiddenField name="sort" value="${sort}"/>
<g:hiddenField name="rController" value="${rController}"/>
<g:hiddenField name="rAction" value="${rAction}"/>

<div class="dialog">

<table style=" width:380px;">
<tbody>
<tr class="prop">
    <td class="name"></td>
    <td class="value">
        <h3>Food Service Director</h3>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="fsdName"><g:message code="customer.fsdName.label" default="Name"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdName', 'errors')}">
        <g:textField class="textField" name="fsdName" value="${customerInstance?.fsdName}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="fsdTitle"><g:message code="customer.fsdTitle.label" default="Title"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdTitle', 'errors')}">
        <g:textField class="textField" name="fsdTitle" value="${customerInstance?.fsdTitle}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="email"><g:message code="customer.email.label" default="Email"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
        <g:textField name="email" value="${customerInstance?.email}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="password"><g:message code="customer.password.label" default="Password"/></label>
    </td>
    <td valign="top">
        <g:link controller="home" action="a_change_c_password" id="${customerInstance?.id}">Change Password</g:link>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="status"><g:message code="customer.status.label" default="Status"/></label>
    </td>
    <td valign="top">
        <g:select name="status" from="${statusList}" optionKey="key" optionValue="value"
                  value="${customerInstance?.status}"/>
</tr>

<tr class="prop">
    <td valign="top" class="name">Classification</td>

    <td>
        <g:textField name="source" value="${customerInstance?.source}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="customerRanking">Customer Ranking</label>
    </td>
    <td valign="top">
        <g:textField name="customerRanking" value="${customerInstance?.customerRanking}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="newCustomer">New Customer</label>
    </td>
    <td valign="top">
        <g:checkBox name="newCustomer" value="${customerInstance?.newCustomer}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="pastParticipant">Previous Participant</label>
    </td>
    <td valign="top">
        <g:checkBox name="pastParticipant" value="${customerInstance?.pastParticipant}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="invalidEmail">Invalid Email</label>
    </td>
    <td valign="top">
        <g:checkBox name="invalidEmail" value="${customerInstance?.invalidEmail}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="duplicate">Duplicate</label>
    </td>
    <td valign="top">
        <g:checkBox name="duplicate" value="${customerInstance?.duplicate}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="deleted">Deleted</label>
    </td>
    <td valign="top">
        <g:checkBox name="deleted" checked="${customerInstance?.deleted}"/>
    </td>
</tr>

<tr class="prop">
    <td class="name"></td>
    <td class="value">
        <h3>School District</h3>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="district"><g:message code="customer.district.label" default="District"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'district', 'errors')}">
        <g:textField name="district" value="${customerInstance?.district}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="timezone"><g:message code="customer.timezone.label" default="Timezone"/></label>
    </td>
    <td valign="top">
        <g:textField name="timezone" value="${customerInstance?.timezone}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.address.street.label" default="Street"/></label>
    </td>
    <td valign="top">
        <g:textField name="address.street" value="${customerInstance?.address?.street}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.address.street2.label" default="Street 2"/></label>
    </td>
    <td valign="top">
        <g:textField name="address.street2" value="${customerInstance?.address?.street2}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.address.city.label" default="City"/></label>
    </td>
    <td valign="top">
        <g:textField name="address.city" value="${customerInstance?.address?.city}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.address.state.label" default="State"/></label>
    </td>
    <td valign="top">
        <g:select name="address.state" from="${states}" value="${customerInstance?.address?.state}" noSelection="['':'Select a State']"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.address.zip.label" default="Zip"/></label>
    </td>
    <td valign="top">
        <g:textField name="address.zip" value="${customerInstance?.address?.zip}"/>
    </td>
</tr>


<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.deliveryAddress.street.label" default="Del Street"/></label>
    </td>
    <td valign="top">
        <g:textField name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.deliveryAddress.street2.label" default="Del Street 2"/></label>
    </td>
    <td valign="top">
        <g:textField name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.deliveryAddress.city.label" default="Del City"/></label>
    </td>
    <td valign="top">
        <g:textField name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.deliveryAddress.state.label" default="Del State"/></label>
    </td>
    <td valign="top">
        <g:select name="deliveryAddress.state" from="${states}" value="${customerInstance?.deliveryAddress?.state}" noSelection="['':'Select a State']"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label><g:message code="customer.deliveryAddress.zip.label" default="Del Zip"/></label>
    </td>
    <td valign="top">
        <g:textField name="deliveryAddress.zip" value="${customerInstance?.deliveryAddress?.zip}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="phone"><g:message code="customer.phone.label" default="Phone"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'phone', 'errors')}">
        <g:textField name="phone" value="${customerInstance?.phone}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="fax"><g:message code="customer.fax.label" default="Fax"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
        <g:textField name="fax" value="${customerInstance?.fax}"/>
    </td>
</tr>

</tbody>
</table>

</div>
</div>

<div style="float:left; margin-left:10px; width:420px;">
    <table style="width: auto">
        <tbody>
        <g:render template="/includes/orderForm" model="[customerInstance: customerInstance]" />

        <tr>
            <td colspan="2">
                <strong>10.</strong>	By subscribing to SuperKids, Ardent Mills and/or its affiliates
              <br />may send you information about related events, webinars, products
              <br /> and services which we believe will be of interest to you.<br />
              <br />Check this box if you DO NOT wish to receive additional information
              <br />from Ardent Mills and its affiliates.

                <g:checkBox name="doNotReceiveAdditionalInformation" value="${customerInstance?.doNotReceiveAdditionalInformation}" /></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="seq"><g:message code="customer.recipientAgency.label"
                                            default="NCES #"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'recipientAgency', 'errors')}">
                <g:textField name="recipientAgency" value="${customerInstance.recipientAgency}"/>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name">
                <label for="seq"><g:message code="customer.seq.label"
                                            default="Sequence Number (DO NOT CHANGE)"/></label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'seq', 'errors')}">
                <g:textField name="seq" value="${customerInstance.seq}"/>
            </td>
        </tr>
        <tr class="prop">
            <td colspan="2"><h3>Customer Notes</h3></td>
        </tr>
        <tr class="prop"><td colspan="2"><g:textArea cols="" rows="" value="${customerInstance?.opNotes}" name="opNotes"
                                                     style="width:360px;"/></td>
        </tr>
        </tbody>
    </table>
   

    <div class="buttons">
        <span class="button"><g:actionSubmit class="save" action="save"
                                             value="${message(code: 'default.button.save.label', default: 'Save')}"/></span>
    </div>
</div>

</g:form>

</div>
</body>
</html>
