<%@ page import="com.superkids.domain.Sponsor; com.superkids.domain.Customer" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <meta name="layout" content="public"/>
    <title>SuperKids | Register</title>

    <style type="text/css">

    div.loginInfo {
        width: 960px;
    }

    .loginInfo table.loginInfo {
        width: 450px;
        float: left;
    }

    .loginInfo table.loginInfo tr td {
        font-size: 20px;
        padding: 10px;
    }

    .loginInfo table.loginInfo tr td input, .loginInfo table tr td select {
        font-size: 20px;
    }

    table.profileForm {
        width: 550px;
    }

    table.profileForm tr td {
        font-size: 15px;
        padding: 10px 15px;
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

<div style="width: 960px; margin: 0 auto">

<h1>Sign up for SuperKids</h1>

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

<div style="float:right; width:480px;">
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
                1. Approximately how many students are in your district?
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
                2. Approximately how many students are served <strong>breakfast</strong> daily? <span class="req">*</span>
            <input style="float:right" type="text" name="breakfastsServed" size="4" maxlength="6"
                       value="${customerInstance?.breakfastsServed}"></td>
        </tr>
        <tr>
            <td colspan="2">
                3. Approximately how many students are served <strong>lunch</strong> daily? <span class="req">*</span>
            <input style="float:right"  type="text" name="lunchesServed" size="4" maxlength="6"
                       value="${customerInstance?.lunchesServed}"></td>
        </tr>
        <tr>
            <td colspan="2">
                4. Approximately how many students are served <strong>breakfast</strong> daily? <span class="req">*</span>
            <input style="float:right"  type="text" name="snacksServed" size="4" maxlength="6"
                       value="${customerInstance?.snacksServed}"></td>
        </tr>
        <tr>
            <td colspan="2">
                5. Approximately how many cafeterias, food courts and other eating facilities are in your district’s schools in total?
                <select name="facilities">
                    <option value="3">Less Than 3
                    <option value="5">3-5
                    <option value="10">6-10
                    <option value="10+">More Than 10
                </select>
            </td>
        </tr>

    </table>

    <table class="bakeryProfile">
        <tr>
            <td colspan="2">
                <h3>Tell us about your school district’s bakery operation</h3>
            </td>
        </tr>
        <tr>
            <td colspan="2">6. We make our own bread products from scratch in our bakery: <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
            </td>
        </tr>

        <tr>
            <td colspan="2">a) If yes, how much flour does your district use on a monthly basis in pounds?
                <input type="text" name="monthlyFlourUsage" value="" size="25" maxlength="1000"></td>
        </tr>
        <tr>
            <td colspan="2">b) Do you work with a local bakery to supply your fresh bakery products? <br/>
                If you’d like us to contact them about the program, please list them here:<br/>
                <input type="text" name="localBakeries" value="" size="55" maxlength="1000"></td>
        </tr>
        <tr>

            <td colspan="2">7. Do you currently use Ultragrain® or Sustagrain® products in your district? If so, please list:
                <br/>
                <input type="text" name="usedUltragrainSustagrainProducts" value="" size="55" maxlength="1000"></td>
        </tr>
        <tr>

            <td colspan="2">8.	Who are your primary foodservice distributors?
                <br/>
                <input type="text" name="callerBrokers" value="" size="55" maxlength="1000"></td>
        </tr>
        <tr>
            <td colspan="2">9.	Are you a member of a co-op? (Please enter Co-op Name)<br/>
                <input type="text" name="coOpName" value="" size="55" maxlength="1000">
            </td>
        </tr>
        <tr>
            <td colspan="2">a)	If yes, would you like us to send samples to the co-op?  <g:checkBox name="coOpSamples" value="${customerInstance?.coOpSamples}" />
            </td>
        </tr>
        <tr>
            <td colspan="2">b) Name and address for the co-op sample:
                <br/>
                <input type="text" name="coOpAddress" value="" size="55" maxlength="1000"></td>
        </tr>


        <tr>
            <td colspan="2">10.	Is your district’s foodservice cafeterias contract managed?  <g:checkBox name="contractManaged" value="${customerInstance?.contractManaged}" />
            </td>
        </tr>
        <tr>
            <td colspan="2">b) If yes, by who?
                <br/>
                <input type="text" name="contractManager" value="" size="55" maxlength="1000"></td>
        </tr>
    </table>

    <table class="manufacturerForm">
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
    </table>

</div>

<div style="clear: both; width: 400px; margin: 0 auto; padding: 50px 10px 100px 200px">
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
