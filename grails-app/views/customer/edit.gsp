<%@ page import="com.superkids.domain.CustomerStatus; com.superkids.domain.Customer" %>
<%@ page import="com.superkids.domain.ShippingDate" %>
<%@ page import="com.superkids.domain.CustomerStatus" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <g:javascript library="jquery" plugin="jquery"/>
    <jqui:resources/>
    <style type="text/css">
    input {
        width: auto
    }

    #assessForm {
        width: 500px;
    }

    #assessForm input {
        width: auto
    }

    </style>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'sks.js')}">
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#assessForm').dialog({ autoOpen:false, width:500, modal:true });
            $('#completeAssessmentForm').dialog({ autoOpen:false, width:500, modal:true });
            $('#submitAssessment').button();
            $('#addBrokerButton').button();
        });

        function showAssessForm(poId) {
            $('#productOrderId').val(poId);
            $('#assessForm').dialog("open");
        }

        function showCompleteAssessForm() {
            $('#completeAssessmentForm').dialog("open")
        }

    </script>

</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create">Add</g:link></span>
</div>

<div class="body">
<div style="margin:20px 0px; padding:15px; clear:both;">
    <g:form method="post" action="findSchoolDistrict">

        <strong>School District:</strong> <input type="text" name="query"/>
        <input type="submit" value="Search" id="customerSearchButton"/>
    </g:form>
</div>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${customerInstance}">
    <div class="errors">
        <g:renderErrors bean="${customerInstance}" as="list"/>
    </div>
</g:hasErrors>
<h1 style="display:inline"><g:message code="default.edit.label" args="[entityName]"/></h1>

<g:form method="post">
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
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">Classification</td>

    <td>
        <g:textField name="source" value="${customerInstance?.source}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="topCustomer">Top 100</label>
    </td>
    <td valign="top">
        <g:checkBox name="topCustomer" value="${customerInstance?.topCustomer}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="hasCompletedCurrentAssessment">Completed Assessment</label>
    </td>
    <td valign="top">
        <g:checkBox name="hasCompletedCurrentAssessment" value="${customerInstance?.hasCompletedCurrentAssessment}"/>
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
        <g:checkBox name="deleted" value="${customerInstance?.deleted}"/>
    </td>
</tr>
<tr class="prop">
    <td valign="top" class="name">
        <label for="didNotReceiveMailing">Did Not Receive Email/Mailing</label>
    </td>
    <td valign="top">
        <g:checkBox name="didNotReceiveMailing" value="${customerInstance?.didNotReceiveMailing}"/>
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
        <tr>
            <td colspan="2">
                <strong>1.</strong> Approximately how many students are in your district?
                    <input type="text" name="studentsInDistrict" size="4" maxlength="6" value="${customerInstance?.studentsInDistrict}"></td>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>2.</strong>	Approximately how many students participate in your foodservice program?
                <input type="text" name="studentsParticipate" size="4" maxlength="6" value="${customerInstance?.studentsParticipate}"></td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>3.</strong>	Approximately what percent of those students are free or reduced?
                <input type="text" name="freeStudents" size="4" maxlength="6" value="${customerInstance?.freeStudents}"></td>
        </tr>
        <tr>
            <td colspan="2"><strong>4.</strong>	Is your district’s foodservice cafeterias contract managed?  <g:checkBox name="contractManaged" value="${customerInstance?.contractManaged}" />
            </td>
        </tr>
        <tr>
            <td colspan="2">b) If yes, by who?
                <br/>
                <input type="text" name="contractManager" value="${customerInstance?.contractManager}" size="55" maxlength="1000"></td>
        </tr>

        <tr>
            <td colspan="2"><strong>5.</strong>	Are you a member of a co-op? (Please enter Co-op Name)<br/>
                <input type="text" name="coOpName" value="${customerInstance?.coOpName}" size="55" maxlength="1000">
            </td>
        </tr>
        <tr>
            <td colspan="2">a)	If yes, would you like us to send samples to the co-op? Yes: <g:checkBox name="coOpSamples" value="${customerInstance?.coOpSamples}" />
            </td>
        </tr>
        <tr>
            <td colspan="2">b) Name and address for the co-op sample:
                <br/>
                <input type="text" name="coOpAddress" value="${customerInstance?.coOpAddress}" size="55" maxlength="1000"></td>
        </tr>
        <tr>

            <td colspan="2"><strong>6.</strong>	Who are your primary foodservice distributors?
                <br/>
                <input type="text" name="callerBrokers" value="${customerInstance?.callerBrokers}" size="55" maxlength="1000"></td>
        </tr>
        <tr>

            <td colspan="2"><strong>7.</strong>	When do you start look at new items for your menu?
                <br/>
                <input type="text" name="startLooking" value="${customerInstance?.startLooking}" size="55" maxlength="1000"></td>
        </tr>

        <tr>

            <td colspan="2"><strong>8.</strong>	When do you issue your bid?
                <br/>
                <input type="text" name="startBidding" value="${customerInstance?.startBidding}" size="55" maxlength="1000"></td>
        </tr>


        <tr>
            <td colspan="2"><strong>9.</strong> Do you bake from scratch in your district? Yes: <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
            </td>
        </tr>

        <tr>
            <td colspan="2">a) If yes, do you use commodity flour? &nbsp; Whole Wheat Flour?  Yes: <g:checkBox name="useWholeWheatFlour" value="${customerInstance?.useWholeWheatFlour}" /> <br/> Ultragrain/ Healthy Choice T-2 with Ultragrain? <g:checkBox name="useUltragrainFlour" value="${customerInstance?.useUltragrainFlour}" />
            </td>
        </tr>
        <tr>

            <td colspan="2">b)	If no, do you work with a local bakery to supply your fresh bakery products?<br/>
                If you’d like us to contact them about the program, please list them here:
                <br/>
                <input type="text" name="localBakeries" value="${customerInstance?.localBakeries}" size="55" maxlength="1000"></td>
        </tr>
        <tr>
            <td colspan="2"><strong>10.</strong> About Whole Grain Rich:
            </td>
        </tr>
        <tr>
            <td colspan="2">a) Are you ready for the 2013 Guidelines?  Yes: <g:checkBox name="readyFor2013" value="${customerInstance?.readyFor2013}" /> 2013 Guidelines? Yes: <g:checkBox name="readyFor2014" value="${customerInstance?.readyFor2014}" />
            </td>
        </tr>
        <tr>
            <td colspan="2">b)	What have been your biggest challenges? <br/>
                <input type="text" name="wholeGrainChallenge" value="${customerInstance?.wholeGrainChallenge}" size="55" maxlength="1000"></td>
        </tr>
        <tr>
            <td colspan="2">c)	What would you like to see food companies provide in terms of whole grain-rich? <br/>
                <input type="text" name="wantedProducts" value="${customerInstance?.wantedProducts}" size="55" maxlength="1000"></td>
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
        <span class="button"><g:actionSubmit class="save" action="update"
                                             value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
        <span class="button"><g:actionSubmit class="delete" action="delete"
                                             value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                             onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
    </div>

</div>
</g:form>
<div style="clear: both">&nbsp;</div>
<g:if test="${customerInstance.customerOrder}">
    <g:render template="ordered_items" model="[customerInstance: customerInstance, products: products]"/>
</g:if>
<g:else>
    <g:render template="manual_order" model="[customerInstance: customerInstance, products: products]"/>
</g:else>

</div>

</body>

</html>
