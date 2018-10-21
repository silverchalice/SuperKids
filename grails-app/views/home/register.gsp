<%@ page import="com.superkids.domain.Sponsor; com.superkids.domain.Customer" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <meta name="layout" content="auth"/>

    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-18800741-2']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>

    <title>SuperKids | Register</title>

    <style type="text/css">

        select {
            float:right;
        }

    div.loginInfo {
        width: 1000px;
    }

    .loginInfo table.loginInfo {
        width: 450px;
        float: left;
    }

    .loginInfo table.loginInfo tr td {
        font-size: 17px;
        padding: 10px;
    }

    .loginInfo table.loginInfo tr td input, .loginInfo table tr td select {
        font-size: 17px;
    }

    table.profileForm {
        width: 600px;
    }

    table.profileForm tr td {
        font-size: 15px;
        padding: 4px 15px;
    }

    table.profileForm tr td input, table.profileForm tr td select {
        font-size: 15px;
        padding: 0;
    }

    table.bakeryProfile {
        width: 500px;
    }

    table.bakeryProfile tr td {
        font-size: 15px;
        padding: 8px 15px;
    }

    table.bakeryProfile tr td input, table.bakeryProfile tr td select {
        font-size: 15px;
        padding: 0;
    }

    table.manufacturerForm {
        background: white;
        margin-left: 15px;
        width: 480px;
        border: 1px solid #d3d3d3;
    }

    table.manufacturerForm td {
        padding: 8px 15px;
    }

    </style>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitButton").click(function () {
                $("#profileForm").submit();
            });
        });

        function help() {
            mywindow = window.open('profile_help', '_blank', 'menubar=0,resizeable=0,scrollbars=1,width=550,height=600');
            mywindow.moveTo(300, 300);
        }
    </script>

</head>


<body id="public">

<div  id="main" style="margin:-35px auto 50px; padding-top:50px; background:none">

<div>

<h1>Sign up for SuperKids</h1>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:hasErrors bean="${customerInstance}">
    <div class="errors">
        <g:renderErrors bean="${customerInstance}" as="list"/>
    </div>
</g:hasErrors>
<g:form method="post" action="save" name="profileForm">

<div class="loginInfo">
<table class="loginInfo">
    <tr>
        <td></td>
        <td>
            <h3>School Contact Information</h3>
        </td>
    </tr>
    <tr>
        <td style="text-align:right">Your Name <span class="req">*</span></td>
        <td><input type="text" name="fsdName" value="${customerInstance?.fsdName}" size="25"
                   maxlength="50"></td>
    </tr>
<tr>
    <td style="text-align:right">Your Title <span class="req">*</span></td>
    <td style="text-align:left"><input type="text" name="fsdTitle" value="${customerInstance?.fsdTitle}" size="25"
                                       maxlength="50"></td>
</tr>
<tr>
    <td style="text-align:right">District Name <span class="req">*</span></td>
    <td style="text-align:left"><input type="text" name="district" value="${customerInstance?.district}" size="25"
                                       maxlength="50"></td>
</tr>
<tr>
    <td style="text-align:right">NCES #</td>
    <td style="text-align:left"><input type="text" name="recipientAgency" value="${customerInstance?.recipientAgency}" size="25"
                                       maxlength="50"></td>
</tr>
<tr>
    <td style="text-align:right">District Address <span class="req">*</span></td>
    <td style="text-align:left"><input type="text" name="address.street" value="${customerInstance?.address?.street}"
                                       size="25"
                                       maxlength="50"></td>
</tr>
<tr>
    <td style="text-align:right">&nbsp;</td>
    <td style="text-align:left"><input type="text" name="address.street2" value="${customerInstance?.address?.street2}"
                                       size="25"
                                       maxlength="50"></td>
</tr>
<tr>
    <td style="text-align:right">City <span class="req">*</span></td>
    <td style="text-align:left"><input type="text" name="address.city" value="${customerInstance?.address?.city}"
                                       size="25"
                                       maxlength="50"></td>
</tr>
<tr>
    <td style="text-align:right">State <span class="req">*</span></td>
    <td style="text-align:left">
        <g:select name="address.state" from="${states}" value="${customerInstance?.address?.state}" noSelection="['':'Select a State']"/>
    </td>
</tr>
<tr>
    <td style="text-align:right">Zip <span class="req">*</span></td>
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
    <td style="text-align:left"><input type="text" name="fax" value="${customerInstance?.fax}" size="25" maxlength="50">
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

<div style="float:right; width:500px;">
    <table class="profileForm">
        <tr>
            <td colspan="2" style="padding-top: 35px">
                <h3 style="display: inline; ">School District Profile</h3>  (<a
                    href="javascript:help();">Why do we ask for this information?</a>)

            </td>
        </tr>

        <g:render template="/includes/orderForm" model="[customerInstance: customerInstance]" />

        <tr>
            <td colspan="2"><strong>9.</strong> By subscribing to SuperKids, Ardent Mills and/or its affiliates
                <br />may send you information about related events, webinars, products
                <br /> and services which we believe will be of interest to you.<br />
                <br />Check this box if you DO NOT wish to receive additional information
                <br />from Ardent Mills and its affiliates.
                <g:checkBox name="doNotReceiveAdditionalInformation" value="${customerInstance?.doNotReceiveAdditionalInformation}" /></td>
             
        </tr>

    </table>
    <p>&nbsp;</p>


</div>

<div style="clear: both; width: 400px; margin: 0 auto; padding: 20px 10px 50px 200px">
    <input type="hidden" name="Register" value="1">
    <a  id="submitButton" class="btn arrow"><span>Save Your Information & Continue</span></a>
</div>

</div>

</g:form>

</div>
</div>

</body>
</html>
