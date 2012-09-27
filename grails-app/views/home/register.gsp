<%@ page import="com.superkids.domain.Sponsor; com.superkids.domain.Customer" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <meta name="layout" content="public"/>
    <title>SuperKids | Register</title>

    <style type="text/css">

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
    <td style="text-align:right">District Name <span class="req">*</span></td>
    <td style="text-align:left"><input type="text" name="district" value="${customerInstance?.district}" size="25"
                                       maxlength="50"></td>
</tr>
<tr>
    <td style="text-align:right">District Address</td>
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
    <td style="text-align:right">City</td>
    <td style="text-align:left"><input type="text" name="address.city" value="${customerInstance?.address?.city}"
                                       size="25"
                                       maxlength="50"></td>
</tr>
<tr>
    <td style="text-align:right">State</td>
    <td style="text-align:left">
        <g:select name="address.state" from="${states}" value="${customerInstance?.address?.state}"/>
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
                  value="${customerInstance?.deliveryAddress?.state}"/>
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
        <tr>
            <td colspan="2">
                <strong>1.<strong> Approximately how many students are in your district?
                <select name="studentsInDistrict">
                    <option value="500">Less than 500
                    <option value="1000">500 - 1,000
                    <option value="2000">1,000 - 2,000
                    <option value="5000">3,000 - 5,000
                    <option value="10000">5,000 - 10,000
                    <option value="20000">10,000 - 20,000
                    <option value="50000">20,000 - 50,000
                    <option value="50000+">Over 50,000
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>2.</strong>	Approximately how many students participate in your foodservice program?
            <input style="float:right" type="text" name="breakfastsServed" size="4" maxlength="6"
                       value="${customerInstance?.studentsParticipate}"></td>
        </tr>
        <tr>
            <td colspan="2">
                <strong>3.</strong>	Approximately what percent of those students are free or reduced?
            <input style="float:right"  type="text" name="lunchesServed" size="4" maxlength="6"
                       value="${customerInstance?.freeStudents}"></td>
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
            <td colspan="2">a)	If yes, would you like us to send samples to the co-op?  <g:checkBox name="coOpSamples" value="${customerInstance?.coOpSamples}" />
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
            <td colspan="2"><strong>9.</strong> Do you bake from scratch in your district? <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
            </td>
        </tr>

        <tr>
            <td colspan="2">a) If yes, do you use commodity flour? &nbsp; Whole Wheat Flour?  <g:checkBox name="useWholeWheatFlour" value="${customerInstance?.useWholeWheatFlour}" /> <br/> Ultragrain/ Healthy Choice T-2 with Ultragrain? <g:checkBox name="useUltragrainFlour" value="${customerInstance?.useUltragrainFlour}" />
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
            <td colspan="2">a) Are you ready for the 2013 Guidelines?  <g:checkBox name="readyFor2013" value="${customerInstance?.readyFor2013}" /> 2013 Guidelines? <g:checkBox name="readyFor2014" value="${customerInstance?.readyFor2014}" />
            </td>
        </tr>
        <tr>
            <td colspan="2">b)	What have been your biggest challenges? <br/>
                <input type="text" name="wholeGrainChallenge" value="${customerInstance?.wholeGrainChallenge}" size="55" maxlength="1000"></td></td>
        </tr>
        <tr>
            <td colspan="2">c)	What would you like to see food companies provide in terms of whole grain-rich? <br/>
                <input type="text" name="wantedProducts" value="${customerInstance?.wantedProducts}" size="55" maxlength="1000"></td></td>
        </tr>

    </table>

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
