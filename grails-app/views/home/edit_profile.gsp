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
    <!-- Order Form, 2017 -->
    <tr>
        <td colspan="2">
            <strong>1.</strong> How many students are in your district?
            <input type="text" name="studentsInDistrict" size="4" maxlength="6" value="${customerInstance?.studentsInDistrict}">
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <strong>2.</strong>	How many students participate in your<br/> school foodservice program? <input type="text" name="studentsParticipate" size="4" maxlength="6" value="${customerInstance?.studentsParticipate}">
            Breakfast: <input type="text" name="studentsParticipateBreakfast" size="4" maxlength="6" value="${customerInstance?.studentsParticipateBreakfast}">
            Lunch: <input type="text" name="studentsParticipateLunch" size="4" maxlength="6" value="${customerInstance?.studentsParticipateLunch}">
            After School: <input type="text" name="studentsParticipateAfterSchool" size="4" maxlength="6" value="${customerInstance?.studentsParticipateAfterSchool}"></td>
    </tr>

    <tr>

        <td colspan="2"><strong>3.</strong>	Who is your primary distributor?
            <br/>
            <input type="text" name="callerBrokers" value="${customerInstance?.callerBrokers}" size="55" maxlength="1000"></td>
    </tr>

    <tr>
        <td colspan="2"><strong>4.</strong> Do you bake from scratch using flour or mixes in your district (do not include parbaked items)?
        <g:select name="hasBakery" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.hasBakery}"/>
        </td>
    </tr>

    <tr>
        <td colspan="2">a)	Do you use Ultragrain 100% whole wheat flour?
        <g:select name="useUltragrainFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.useUltragrainFlour}"/>
        </td>
    </tr>

    <tr>
        <td colspan="2">b)	Do you use Ultragrain T-2 (55% Ultragrain/45% white flour?)
        <g:select name="useUltragrainWhiteFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.useUltragrainWhiteFlour}"/>
        </td>
    </tr>

    <tr>
        <td colspan="2">c)	Do you use Commodity Flour?
        <g:select name="buyCommodityFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.buyCommodityFlour}"/>
        </td>
    </tr>

    <tr><td colspan="2">d) Do you use other flours (please list)? <br/>
        <input type="text" name="otherFlours" value="${customerInstance?.otherFlours}" size="55" maxlength="1000"></td>
    </tr>

    <tr><td colspan="2">e) Do you use mixes (please list)? <br/>
        <input type="text" name="otherFlours" value="${customerInstance?.otherMixes}" size="55" maxlength="1000"></td>
    </tr>

    <tr>
        <td colspan="2">
            Do you experience any challenges when scratch baking?
            <g:select name="bakingChallenges" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.bakingChallenges}"/>

        </td>
    </tr>

    <tr><td colspan="2">If yes, which items? <br/>
        <input type="text" name="otherFlourIssues" value="${customerInstance?.otherFlourIssues}" size="55" maxlength="1000"></td>
    </tr>

    <tr>
        <td colspan="2"><strong>5.</strong> If you've participated in SuperKids in the past, did you add any of the items <br />you sampled to your menu?
        <g:select name="addedPastItemsToMenu" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.addedPastItemsToMenu}"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">a) If yes, which items? <br/>
            <input type="text" name="pastItemsAddedToMenu" value="${customerInstance?.pastItemsAddedToMenu}" size="55" /></td>
    </tr>

    <tr>
        <td colspan="2"><strong>6.</strong> Do you look for &#8220;Ultragrain&#8221; when trying new whole grain-rich foods?
        <g:select name="lookForUltragrain" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.useUltragrainFlour}"/>
        </td>
    </tr>

    <tr><td colspan="2"><strong>7.</strong>Do you participate in any waivers for whole grain-rich foods?
    <g:select name="participateWaivers" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.participateWaivers}"/>
    </td>
    </tr>
    <tr>
        <td colspan="2">If yes, for what items?
            <input type="text" name="participateWaiversItems" value="${customerInstance?.participateWaiversItems}" size="55" maxlength="1000">
        </td>
    </tr>
    <!-- END Order Form, 2017 -->

</table>

<div style="clear:both; text-align:left;padding-top:20px;">
    <a href="#" id="submitButton" title="Save Changes" style="margin-left: 400px" class="submitButton btn arrow"><span>Save Your Changes</span></a>
</div>
</g:form>


</body>
</html>
