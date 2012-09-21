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

    .shippingInfo table.loginInfo {
        width: 370px;
        float: left;
    }

    .shippingInfo table.loginInfo tr td {
        font-size: 14px;
        padding: 10px 5px 10px 0;
    }

    .shippingInfo table.loginInfo tr td input, .loginInfo table tr td select {
        font-size: 16px;
    }

    table.profileForm {
        width: 400px;
    }

    table.profileForm tr td {
        font-size: 14px;
        padding: 10px 0 10px 0;
    }

    table.profileForm tr td input, table.profileForm tr td select {
        font-size: 14px;
        padding: 0;
    }

    table.bakeryProfile {
        width: 400px;
    }

    table.bakeryProfile tr td {
        font-size: 14px;
        padding:10px 0 10px 0;
    }

    table.bakeryProfile tr td input, table.bakeryProfile tr td select {
        font-size: 14px;
        padding: 0;
    }

    .manufacturerForm {
        background: white;
        margin-left: 15px;
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

<div style="float:right; width:475px;">
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
                Number of students in your school district
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
                Approximately how many cafeterias, food courts and other eating <br/> facilities are in your district’s schools in total
                <select name="facilities">
                    <option value="3">Less Than 3
                    <option value="5">3-5
                    <option value="10">6-10
                    <option value="10+">More Than 10
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Approximately how many students are served <strong>breakfast</strong> daily? <span class="req">*</span>
            </td>
            <td><input type="text" name="breakfastsServed" size="4" maxlength="6"
                       value="${customerInstance?.breakfastsServed}"></td>
        </tr>
        <tr>
            <td>
                Approximately how many students are served <strong>lunch</strong> daily? <span class="req">*</span>
            </td>
            <td><input type="text" name="lunchesServed" size="4" maxlength="6"
                       value="${customerInstance?.lunchesServed}"></td>
        </tr>
        <tr>
            <td>
                Approximately how many students are served <strong>breakfast</strong> daily? <span class="req">*</span>
            </td>
            <td><input type="text" name="snacksServed" size="4" maxlength="6"
                       value="${customerInstance?.snacksServed}"></td>
        </tr>
    </table>

    <table class="bakeryProfile">
        <tr>
            <td colspan="2">
                <h3>Tell us about your district’s bakery operation</h3>
            </td>
        </tr>
        <tr>
            <td>We make our own bread products from scratch in our bakery<br/> (proof and bake)</td>
            <td>
                <input type="checkbox" name="hasBakery" value="1">
            </td>
        </tr>

        <tr>
            <td colspan="2">If yes, how much flour does your district use on a monthly basis in pounds?<br/>
                <input type="text" name="monthlyFlourUsage" value="" size="25" maxlength="1000"></td>
        </tr>
        <tr>
            <td colspan="2">Do you work with a local bakery to supply your fresh bakery products?<br/> If you’d like us to
            contact them about the program, please list them here:<br/>
                <input type="text" name="localBakeries" value="" size="35" maxlength="1000"></td>
        </tr>
        <tr>

            <td colspan="2">Do you currently use Ultragrain® or Sustagrain® products in your district?<br/> If so, please list:
                <input type="text" name="usedUltragrainSustagrainProducts" value="" size="35" maxlength="1000"></td>
        </tr>
    </table>


    <div class="manufacturerForm">
        <p><strong>Please let us know if you would like any of these manufacturers to contact you immediately.</strong>  </p>

        <g:each in="${sponsors}" var="sponsor">
            <span style="display: block; font-size: 14px; width: 200px; float: left"><g:checkBox name="sponsor.${sponsor.id}"
                                                                                checked="${customerInstance.contactManufacturers?.contains(sponsor)}"/>${sponsor.name}</span>
        </g:each>
        <p style="display: block; clear: both; padding-top: 10px">Please list any special requests for the manufacturers you checked: <br/>
            <input type="text" name="otherComments" value="" size="60" maxlength="1000"></p>
    </div>


</div>

<div style="clear: both; width: 890px; margin: 0 auto; padding-top: 20px">
    <hr />
    <a href="${createLink(controller: 'shopping', action: 'index')}">&laquo; Back</a><a href="#" title="Move to the next step" class="submitButton btn arrow"><span>Proceed with order</span></a>
</div>
</div>
</g:form>
</div>
</div>
</body>
</html>
