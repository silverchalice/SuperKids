<%@ page import="com.superkids.domain.Customer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="customer"/>
    <title>SuperKids | Edit Profile</title>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#submitButton").click(function () {
                $("#updateForm").submit();
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
    <div class="message">${flash.message}</div><br/>
</g:if>
<g:hasErrors bean="${customerInstance}">
    <div class="errors">
        <g:renderErrors bean="${customerInstance}" as="list"/>
    </div>
</g:hasErrors>

<g:form action="update" method="post" name="updateForm">
<g:hiddenField name="id" value="${customerInstance?.id}"/>
<g:hiddenField name="version" value="${customerInstance?.version}"/>

<table style="float: left; width:480px">
    <tr>
        <td valign="top" colspan="2">
            <h1>Your Account Profile</h1>
        </td>
    </tr>
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
            <h3 style="margin-top: 40px">Please tell us about your school district foodservice program:</h3>

        </td>

    </tr>
    <tr style="padding-bottom:10px;">
        <td valign="top">
            <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}"/>

            <label for="hasBakery">Make our own bread products from
                scratch in our bakery (proof & bake)</label>
        </td>

    </tr>
    <tr>
        <td valign="top" colspan="2">
            <label for="monthlyFlourUsage">If yes, how much flour does your district use on a monthly basis in pounds?</label>
            <g:textField name="monthlyFlourUsage" value="${customerInstance?.monthlyFlourUsage}" style="float:right; width:240px"/>
        </td>

    </tr>



    <tr>
        <td valign="top" colspan="2">

            <p>Do you work with a local bakery to supply your fresh bakery products? If you’d like us to
            contact them about the program, please list them here. <g:textField name="localBakeries" value="${customerInstance?.localBakeries}" style="float:right; width: 360px"/>  </p>
        </td>

    </tr>


    <tr>
        <td valign="top" colspan="2">

            <p>Do you currently use Ultragrain® or Sustagrain® products in your district? If so, please list:
            <g:textField name="usedUltragrainSustagrainProducts" value="${customerInstance?.usedUltragrainSustagrainProducts}" style="float:right; width:360px"/></p>

        </td>

    </tr>
    <tr>
        <td colspan="2">
            Number of students in your school district
            <g:select name="studentsInDistrict"
                      from="${['Less than  500', '500 - 1,000', '1,000 - 2,000', '3,000 - 5,000', '5,000 - 10,000', '10,000 - 20000', '20,000 - 50,000', 'Over 50,000']}"
                      value="${customerInstance?.studentsInDistrict}"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            Approximate number of cafeterias, food courts or other eating facilities (District Total)
            <g:select name="facilities" from="${['Less than 3', '3-5', '6-10', 'More than 10']}"
                      value="${customerInstance?.facilities}"/>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            Number of students served daily (in your total school district - not just your individual school). Please confirm/enter these numbers:
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: right;">

            <g:textField name="breakfastsServed" value="${fieldValue(bean: customerInstance, field: 'breakfastsServed')}"
                        style="width:80px"/><g:message code="customer.breakfastsServed.label"
                                                     default=" Breakfasts"/> &nbsp;&nbsp;

            <g:textField name="lunchesServed" value="${fieldValue(bean: customerInstance, field: 'lunchesServed')}"
                                     style="width:80px"/> <g:message code="customer.lunchesServed.label" default=" Lunches"/>  &nbsp; &nbsp;

            <g:textField name="snacksServed" value="${fieldValue(bean: customerInstance, field: 'snacksServed')}"
                                     style="width:80px"/> <g:message code="customer.snacksServed.label" default=" Snacks"/> &nbsp;

        </td>
    </tr>
</table>
<div class="manufacturerForm">
    <p><strong>Please let us know if you would like any of these manufacturers to contact you immediately.</strong>  </p>

    <g:each in="${sponsors}" var="sponsor">
        <span style="display: block; font-size: 14px; width: 220px; float: left"><g:checkBox name="sponsor.${sponsor.id}"
                                                                                             checked="${customerInstance.contactManufacturers?.contains(sponsor)}"/>${sponsor.name}</span>
    </g:each>
    <p style="display: block; clear: both; padding-top: 10px">Please list any special requests for the manufacturers you checked: <br/>
        <input type="text" name="otherComments" value="${customerInstance?.otherComments}" size="60" maxlength="1000"></p>
</div>
<div style="float:left; text-align:left;padding-top:20px;">
    You must click 'Save Changes' to continue.  If possible, please update or
    provide the optional broker/distributor information below before doing so.

    <a href="#" id="submitButton" title="Save Changes" style="margin-left: 500px" class="submitButton btn arrow"><span>Save Changes</span></a>
</div>
</g:form>


</body>
</html>
