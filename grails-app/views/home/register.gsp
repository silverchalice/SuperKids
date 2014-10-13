<%@ page import="com.superkids.domain.Sponsor; com.superkids.domain.Customer" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <meta name="layout" content="public"/>

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


<body>

<div style="width: 1000px; margin: 0 auto">

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
            <td colspan="2"><strong>3.</strong>	Is your district’s foodservice cafeterias contract managed?

            <g:select name="contractManaged" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.contractManaged}"/>

            </td>
        </tr>
        <tr>
            <td colspan="2">a) If yes, by who?
                <br/>
                <input type="text" name="contractManager" value="${customerInstance?.contractManager}" size="55" maxlength="1000"></td>
        </tr>
        <tr>
            <td colspan="2"><strong>4.</strong>	Are you a member of a co-op?<br/>

                <g:select name="coOpMember" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.contractManaged}"/>

            </td>
        </tr>
        <tr>
            <td colspan="2">a) If yes, Co-op name <br/>
                <input type="text" name="coOpName" value="${customerInstance?.coOpName}" size="55" maxlength="1000">
            </td>
        </tr>
        <tr>
            <td colspan="2">b) Contact name, address and email:
                <br/>
                <input type="text" name="coOpAddress" value="${customerInstance?.coOpAddress}" size="55" maxlength="1000"></td>
        </tr>
        <tr>

            <td colspan="2"><strong>5.</strong>	Who are your primary foodservice distributors?
                <br/>
                <input type="text" name="callerBrokers" value="${customerInstance?.callerBrokers}" size="55" maxlength="1000"></td>
        </tr>

        <tr>
            <td colspan="2"><strong>6.</strong> Do you bake from scratch in your district?
                <g:select name="hasBakery" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.hasBakery}"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">(a	Do you use Ultragrain 100% whole wheat flour?
                <g:select name="useUltragrainFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.buyCommodityFlour}"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">(b	Ultragrain T-2 (55% Ultragrain/45% white flour?)
            <g:select name="useUltragrainWhiteFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.buyCommodityFlour}"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">(c	Do you buy USDA commodity flour?
            <g:select name="buyCommodityFlour" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.buyCommodityFlour}"/>
            </td>
        </tr>

        <tr>
            <td colspan="2">(d	If you use bagged flour, would your staff like handles on the bags?
            <g:select name="likesBagHandles" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.buyCommodityFlour}"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">(e	What is your preferred bag size? 25 lb? 50 lb? Other?
                <br/>
                <input type="text" name="preferredBagSize" value="${customerInstance?.preferredBagSize}" size="55" maxlength="1000"></td>
        </tr>
        <tr>
            <td colspan="2"><strong>7.</strong> If you've participated in SuperKids in the past, did you add any of the items you sampled to your menu?
                <g:select name="addedPastItemsToMenu" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.addedPastItemsToMenu}"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">a) If yes, which items?
                <br/>
                <input type="text" name="pastItemsAddedToMenu" value="${customerInstance?.pastItemsAddedToMenu}" size="55" /></td>
        </tr>

        <tr>
            <td colspan="2"><strong>8.</strong> Do you look for &#8220;Ultragrain&#8221; when trying new whole grain-rich foods?
                <g:select name="lookForUltragrain" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.useUltragrainFlour}"/>
            </td>
        </tr>

        <tr>
            <td colspan="2"><strong>9.</strong> Do you participate in any rewards programs?
                <g:select name="participateInRewardsPrograms" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.participateInRewardsPrograms}"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">(a Cool School Cafe?
            <g:select name="participateInCoolSchoolCafe" keys="['NA', 'true', 'false']" from="['Select…', 'Yes', 'No']"  value="${customerInstance?.participateInRewardsPrograms}"/>
            </td>
        </tr>
        <tr>

            <td colspan="2">(b Others (please list)?
                <br/>
                <input type="text" name="programsParticipatedIn" value="${customerInstance?.programsParticipatedIn}" size="55" /></td>
        </tr>

        <tr>
            <td colspan="2"><strong>12.</strong> By subscribing to SuperKids, ConAgra Foods and/or its affiliates
              <br />may send you information about related events, webinars, products
              <br /> and services which we believe will be of interest to you.<br />
              <br />Check this box if you DO NOT wish to receive additional information
              <br />from ConAgra Foods and its affiliates. 
              <g:checkBox name="doNotReceiveAdditionalInformation" value="${customerInstance?.doNotReceiveAdditionalInformation}" /></td>
             
        </tr>

    </table>
    <p>&nbsp;</p>

    <!--<table class="manufacturerForm">
        <tr>
            <td colspan="2">
                <strong>11. Please let us know if you would like any of these manufacturers to contact you immediately.</strong>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <g:each in="${sponsors}" var="sponsor">
                    <span style="display: block; width: 220px; float: left"><g:checkBox name="sponsor.${sponsor.id}"
                                                                                        checked="${customerInstance.contactManufacturers?.contains(sponsor)}"/>${sponsor.name}</span>
                </g:each>
            </td>
        </tr>

        <tr>
            <td colspan="2">Please list any special requests for the manufacturers you checked: <br/>
                <input type="text" name="otherComments" value="" size="75" maxlength="1000"></td>
        </tr>
    </table>  -->

</div>

<div style="clear: both; width: 400px; margin: 0 auto; padding: 20px 10px 50px 200px">
    <input type="hidden" name="Register" value="1">
    <a  id="submitButton" class="btn arrow"><span>Save Your Information & Continue</span></a>
</div>

<!--<div style="clear: both" class="brokerInfo">
     <h2>Optional Broker/Distributor Information</h2>
    <p>One of the objectives of the SuperKids Whole Grain Sampling Program is to communicate demand for these products to foodservice distributors and brokers. <br/><br/>
    </p>
    <p>
        Although it is not mandatory that you provide broker or distributor information below, it will help ensure that the right people know about your interest in these products and improve the  likelihood that you will receive more whole grain foods in the future.  Please provide the following if available. <br/><br/>
    </p>
<g:hiddenField name="seq" value="9998"/>
<table cellpadding="3" cellspacing="0" style="border:none; width:300px">
<tr>
<td><strong>Broker/Distributor Name:</strong></td>
<td><input type="text" name="brokerName" size="25" maxlength="50" value=""></td>
</tr>
<tr>
<td><strong>Email:</strong></td>
<td><input type="text" name="brokerEmail" size="25" maxlength="50" value=""></td>
</tr>
<tr>
<td><strong>Telephone:</strong></td>
<td><input type="text" name="brokerPhone" size="25" maxlength="50" value=""></td>
</tr>
<tr>
<td><strong>Fax:</strong></td>
<td><input type="text" name="brokerFax" size="25" maxlength="50" value=""></td>
</tr>
<tr>
<td><strong>Address:</strong></td>
<td><input type="text" name="brokerStreet" size="25" maxlength="255" value=""></td>
</tr>
<tr>
<td><strong></strong></td>
<td><input type="text" name="brokerStreet2" size="25" maxlength="255" value=""></td>
</tr>
<tr>
<td><strong>City:</strong></td>
<td><input type="text" name="brokerCity" size="25" maxlength="50" value=""></td>
</tr>
<tr>
<td>State</td>
<td style="text-align:left">
<g:select name="brokerState" from="${states}"/>
</td>
      </tr>
      <tr>
          <td><strong>Zip:</strong></td>
          <td><input type="text" name="brokerZip" size="10" maxlength="20" value=""></td>
      </tr>
  </table>

</div>  -->

</g:form>

</div>
</div>

</body>
</html>
