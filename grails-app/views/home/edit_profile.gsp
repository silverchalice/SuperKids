<%@ page import="com.superkids.domain.Customer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="customer"/>
    <title>SuperKids | Edit Profile</title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitButton").click(function (e) {
                $("#updateForm").submit();
                e.preventDefault();
            });
        });
    </script>

    <style type="text/css">
    .manufacturerForm {
        background: white;
        width: 450px;
        border: 1px solid #d3d3d3;
        padding: 8px;
        float: right
    }
    </style>

    <!--<script type="text/javascript">
        jQuery.noConflict();


        jQuery(document).ready(function () {
            var width = jQuery(document).width() / 2.75;

            jQuery('#help').dialog({
                autoOpen:false,
                width:460,
                position:[width, 170]
            });

            jQuery('#helpPopUp').click(function () {
                jQuery('#help').dialog('open');
            });

            jQuery('#closeHelpPopUp').click(function () {
                jQuery('#help').dialog('close');
            });

        });


    </script>      -->

</head>

<body>

<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${customerInstance}">
    <div class="errors">
        <g:renderErrors bean="${customerInstance}" as="list"/>
    </div>
</g:hasErrors>

<g:form action="update" method="post" name="updateForm">
<g:hiddenField name="id" value="${customerInstance?.id}"/>
<g:hiddenField name="version" value="${customerInstance?.version}"/>
<h1>Your Account Profile</h1>
<table style="float: left; width:460px">
    <tr>
        <td valign="top">
            <label for="fsdName"><g:message code="customer.fsdName.label" default="Your Name"/></label>
        </td>
        <td valign="top">
            <g:textField name="fsdName" value="${customerInstance?.fsdName}"/>
        </td>
    </tr>
    <tr>
        <td>
            <label for="district"><g:message code="customer.district.label" default="School District Name"/></label>
        </td>
        <td>
            <g:textField name="district" value="${customerInstance?.district}"/>
        </td>
    </tr>

    <tr>
        <td>
            <label for="password"><g:message code="customer.password.label" default="Password"/></label>
        </td>
        <td>
            <g:link controller="home" action="c_2_change_password">Change Password</g:link>
        </td>
    </tr>

    <tr class="prop">
        <td>
            <label><g:message code="customer.address.street.label" default="School District Address"/></label>
        </td>
        <td>
            <g:textField name="address.street" value="${customerInstance?.address?.street}"/>
        </td>
    </tr>
    <tr class="prop">
        <td>
            <label><g:message code="customer.address.street2.label" default=""/></label>
        </td>
        <td>
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

    <tr>
        <td valign="top" class="name">
            <label><g:message code="customer.address.state.label" default="State"/></label>
        </td>
        <td valign="top">
            <g:if test="${customerInstance?.address?.state}">
                <g:select from="${states}" name="address.state" value="${customerInstance?.address?.state}"
                          noSelection="${['null': '']}"/>
            </g:if>
            <g:else>
                <g:select from="${states}" name="address.state" noSelection="${['null': '']}"/>
            </g:else>
        </td>
    </tr>
    <tr>
        <td valign="top" class="name">
            <label><g:message code="customer.address.zip.label" default="Zip"/></label>
        </td>
        <td valign="top">
            <g:textField name="address.zip" value="${customerInstance?.address?.zip}"/>
        </td>
    </tr>

    <tr>
        <td valign="top" class="name">
            <label for="phone"><g:message code="customer.phone.label" default="Phone"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'phone', 'errors')}">
            <g:textField name="phone" value="${customerInstance?.phone}"/>
        </td>
    </tr>

    <tr>
        <td valign="top" class="name">
            <label for="fax"><g:message code="customer.fax.label" default="Fax"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
            <g:textField name="fax" value="${customerInstance?.fax}"/>
        </td>
    </tr>

    <tr>
        <td valign="top" class="name" style="color:red">
            <label for="email"><g:message code="customer.email.label" default="Email"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
            <g:textField name="email" value="${customerInstance?.email}"/>
        </td>
    </tr>

    <tr>
        <td valign="top" class="name" style="color:red">
            <label><g:message code="customer.deliveryAddress.street.label" default="Delivery Address"/></label>
        </td>
        <td valign="top">
            <g:textField name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}"/>
        </td>
    </tr>
    <tr>
        <td valign="top" class="name">
            <label><g:message code="customer.deliveryAddress.street2.label" default=" "/></label>
        </td>
        <td valign="top">
            <g:textField name="deliveryAddress.street2" value="${customerInstance?.deliveryAddress?.street2}"/>
        </td>
    </tr>
    <tr>
        <td valign="top" class="name" style="color:red">
            <label><g:message code="customer.deliveryAddress.city.label" default="City"/></label>
        </td>
        <td valign="top">
            <g:textField name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}"/>
        </td>
    </tr>
    <tr>
        <td valign="top" class="name" style="color:red">
            <label><g:message code="customer.deliveryAddress.state.label" default="State"/></label>
        </td>
        <td valign="top">
            <g:if test="${customerInstance?.deliveryAddress?.state}">
                <g:select from="${states}" name="deliveryAddress.state"
                          value="${customerInstance?.deliveryAddress?.state}" noSelection="${['null': '']}"/>
            </g:if>
            <g:else>
                <g:select from="${states}" name="deliveryAddress.state" noSelection="${['null': '']}"/>
            </g:else>
        </td>
    </tr>
    <tr>
        <td valign="top" class="name" style="color:red">
            <label><g:message code="customer.deliveryAddress.zip.label" default="Zip"/></label>
        </td>
        <td valign="top">
            <g:textField name="deliveryAddress.zip" value="${customerInstance?.deliveryAddress?.zip}"/>
        </td>
    </tr>
</table>


<table style="float:right; width:480px">
    <tr>
        <td colspan="2">
            <strong>1.</strong> Approximately how many students are in your district?
            <input style="float:right" type="text" name="studentsInDistrict" size="4" maxlength="6" value="${customerInstance?.studentsInDistrict}">
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <strong>2.</strong>	Approximately how many students participate in your foodservice program?
            <input style="float:right" type="text" name="studentsParticipate" size="4" maxlength="6" value="${customerInstance?.studentsParticipate}">
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <strong>3.</strong>	Do you look for foods that meet the Alliance for a Healthier Generation guidelines?
            <g:checkBox name="lookForAlliance" value="${customerInstance?.lookForAlliance}" /></td>
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

        <td colspan="2"><strong>7.</strong>	When do you start to look at new items for your menu?
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

        <td colspan="2">b)	If no, do you work with a local bakery to supply your fresh bakery products? If you’d like us to contact them about the program, please list them here:
            <br/>
            <input type="text" name="localBakeries" value="${customerInstance?.localBakeries}" size="55" maxlength="1000"></td>
    </tr>
    <tr>
        <td colspan="2"><strong>10.</strong> About Whole Grain Rich:
        </td>
    </tr>
    <tr>
        <td colspan="2">a) Does your current menu meet the 2013 Guidelines?  Yes: <g:checkBox name="readyFor2013" value="${customerInstance?.readyFor2013}" /> 2014 Guidelines? Yes: <g:checkBox name="readyFor2014" value="${customerInstance?.readyFor2014}" />
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

</table>

<div style="clear:both; text-align:left;padding-top:20px;">
    <a href="#" id="submitButton" title="Save Changes" style="margin-left: 400px" class="submitButton btn arrow"><span>Save Your Changes</span></a>
</div>
</g:form>


</body>
</html>
