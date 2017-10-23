<%@ page import="com.superkids.domain.Customer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="cart" />


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <title>SuperKids | Checkout</title>


    <style type="text/css">


    div.shippingInfo {
        width: 910px;
    }

    #content .shippingInfo table.loginInfo {
        width: 370px;
        float: left;
    }

    #content .shippingInfo table.loginInfo tr td {
        font-size: 14px;
        padding: 10px 5px 10px 0;
        text-align: left
    }

    #content .shippingInfo table.loginInfo tr td input, .loginInfo table tr td select {
        font-size: 16px;
    }

    table.profileForm {
        width: 400px;
    }

    #content table.profileForm tr td {
        font-size: 14px;
        padding: 3px 0 3px 0;
        text-align: left
    }

    #content table.profileForm tr td input, table.profileForm tr td select {
        font-size: 14px;
        padding: 0;
    }

    #content table.bakeryProfile {
        width: 400px;
    }

    #content table.bakeryProfile tr td {
        font-size: 14px;
        padding:10px 0 10px 0;
        text-align: left
    }

    table.bakeryProfile tr td input, table.bakeryProfile tr td select {
        font-size: 14px;
        padding: 0;
    }

    .manufacturerForm {
        background: white;
        width: 420px;
        border: 1px solid #d3d3d3;
        padding: 8px;
    }

    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".submitButton").click(function () {
                $("#shippingInfoForm").submit();
            });
        });

        function help() {
            mywindow = window.open('profile_help', '_blank', 'menubar=0,resizeable=0,scrollbars=1,width=550,height=600');
            mywindow.moveTo(300, 300);
        }
    </script>

</head>
<body>

<div id="content-container">
<ol id="order-process">

    <li class="one"><a href="${createLink(controller: 'shopping', action: 'index')}">
        <span
                class="gradient">1</span> Review Your Order</a></li>
    <li class="two active"><a href="#"><span>2</span> Provide Shipping Address</a></li>
    <li class="three"><a href="#" class="submitButton"><span>3</span> Place Your Free Order</a></li>

</ol>
<div id="content">
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div><br/>
</g:if>
<g:form name="shippingInfoForm" controller="shopping" action="confirm" method="post">
<g:hiddenField name="id" value="${customerInstance?.id}"/>
<g:hiddenField name="version" value="${customerInstance?.version}"/>
<h1 style="text-align: center">Provide Shipping Address</h1>
<div class="shippingInfo">
<table class="loginInfo">
    <tr>
        <td></td>
        <td>
            <h3>School Contact Information</h3>
        </td>
    </tr>
    <tr>
        <td style="text-align:right">Your Name</td>
        <td><input type="text" name="fsdName" value="${customerInstance?.fsdName}" size="25"
                   maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">Your Title <span class="req">*</span></td>
        <td style="text-align:left"><input type="text" name="fsdTitle" value="${customerInstance?.fsdTitle}" size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">School District Name <span class="req">*</span></td>
        <td style="text-align:left"><input type="text" name="district" value="${customerInstance?.district}" size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">NCES #</td>
        <td style="text-align:left"><input type="text" name="recipientAgency" value="${customerInstance?.recipientAgency}" size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">School District Address</td>
        <td style="text-align:left"><input type="text" name="address.street"
                                           value="${customerInstance?.address?.street}"
                                           size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">&nbsp;</td>
        <td style="text-align:left"><input type="text" name="address.street2"
                                           value="${customerInstance?.address?.street2}"
                                           size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">City</td>
        <td style="text-align:left"><input type="text" name="address.city" value="${customerInstance?.address?.city}"
                                           size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">State</td>
        <td style="text-align:left">
            <g:select name="address.state" from="${states}" value="${customerInstance?.address?.state}" noSelection="['':'Select a State']"/>
        </td>
    </tr>
    <tr>
        <td style="text-align:right">Zip</td>
        <td style="text-align:left"><input type="text" name="address.zip" value="${customerInstance?.address?.zip}"
                                           size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">Telephone</td>
        <td style="text-align:left"><input type="text" name="phone" value="${customerInstance?.phone}" size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">Fax</td>
        <td style="text-align:left"><input type="text" name="fax" value="${customerInstance?.fax}" size="25"
                                           maxlength="50">
        </td>
    </tr>
    <tr>
        <td style="text-align:right">Email <span class="req">*</span></td>
        <td style="text-align:left"><input type="text" name="email" value="${customerInstance?.email}" size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">Delivery Address <span class="req">*</span></td>
        <td style="text-align:left"><input type="text" name="deliveryAddress.street"
                                           value="${customerInstance?.deliveryAddress?.street}"
                                           size="25" maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">&nbsp;</td>
        <td style="text-align:left"><input type="text" name="deliveryAddress.street2"
                                           value="${customerInstance?.deliveryAddress?.street2}"
                                           size="25" maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">City <span class="req">*</span></td>
        <td style="text-align:left"><input type="text" name="deliveryAddress.city"
                                           value="${customerInstance?.deliveryAddress?.city}" size="25"
                                           maxlength="50"></td>
    </tr>
    <tr>
        <td style="text-align:right">State <span class="req">*</span></td>
        <td style="text-align:left">
            <g:select name="deliveryAddress.state" from="${states}"
                      value="${customerInstance?.deliveryAddress?.state}" noSelection="['':'Select a State']"/>
        </td>
    </tr>
    <tr>
        <td style="text-align:right">Zip <span class="req">*</span></td>
        <td style="text-align:left"><input type="text" name="deliveryAddress.zip"
                                           value="${customerInstance?.deliveryAddress?.zip}" size="25"
                                           maxlength="50"></td>
    </tr>
    <tr><td></td>
        <td style="font-size: 16px">
            <span class="req">*</span> Indicates Required Field

        </td>

    </tr>
</table>

<div style="float:left; padding-left:10px;width:475px;">
    <g:if test="${flash.message}">
        <div class="message" style="color: #8b0000;">${flash.message}</div>
    </g:if>

    <table class="profileForm">
        <tr>
            <td colspan="2" style="padding-top: 35px">
                <h3 style="display: inline; ">School District Profile</h3>  (<a
                    href="javascript:help();">Why do we ask for this information?</a>)

            </td>
        </tr>
        <!-- Order Form, 2017 -->
        <tr>
            <td colspan="2">
                <strong>1.</strong> How many students are in your district?
                <input type="text" name="studentsInDistrict" size="4" maxlength="6" value="${customerInstance?.studentsInDistrict}">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>2.</strong>	How many students participate in your<br/> school foodservice program?<br/>
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

        <tr>
            <td colspan="2"><strong>8.</strong> By subscribing to SuperKids, Ardent Mills and/or its affiliates
              <br />may send you information about related events, webinars, products
              <br /> and services which we believe will be of interest to you.<br />
              <br />Check this box if you DO NOT wish to receive additional information
              <br />from Ardent Mills and its affiliates.
              <g:checkBox name="doNotReceiveAdditionalInformation" value="${customerInstance?.doNotReceiveAdditionalInformation}" /></td>
            </td>
        </tr>

    </table>

</div>

<div style="clear: both; width: 890px; margin: 0 auto; padding-top: 10px">
    <hr />
    <a href="${createLink(controller: 'shopping', action: 'index')}" style="font-size:larger;"ore >&laquo; Back to Samples</a><a href="#" title="Move to the next step" class="submitButton btn arrow"><span>Proceed with order</span></a>
</div>
</div>
</g:form>
</div>
</div>
</body>
</html>
