<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="caller" />
<title>Caller Home</title>
</head>
<body>
    <div class="nav">
        <span class="menuButton"><g:link class="home" action="index"><g:message code="default.home.label"/></g:link></span>
    </div>

    <div class="body" style="width:1100px">
        <div class="dialog">
            <div id="column1" style="float:left; width:360px">
            <table style="width:360px; margin:20px; margin-bottom:10px; margin-left:0">
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="district"><g:message code="customer.district.label" default="District" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'district', 'errors')}">
                            <g:textField name="district" value="${customerInstance?.district}" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3>Address</h3>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="address.street"><g:message code="address.street.label" default="Street" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'street', 'errors')}">
                            <g:textField name="address.street" value="${customerInstance?.address?.street}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="address.city"><g:message code="address.city.label" default="City" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'city', 'errors')}">
                            <g:textField name="address.city" value="${customerInstance?.address?.city}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="state"><g:message code="address.state.label" default="State" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'state', 'errors')}">
                            <g:select name="address.state" from="${customerInstance?.address?.constraints?.state?.inList}" value="${customerInstance?.address?.state}" valueMessagePrefix="address.state"  />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="address.zip"><g:message code="address.zip.label" default="Zip" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance?.address, field: 'zip', 'errors')}">
                            <g:textField name="address.zip" value="${fieldValue(bean: customerInstance?.address, field: 'zip')}" />
                        </td>
                    </tr>
                 </tbody>
             </table>

             <table style="width:360px; margin:10px 20px; margin-left:0">
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="fsdName"><g:message code="customer.fsdName.label" default="Fsd Name" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdName', 'errors')}">
                            <g:textField name="fsdName" value="${customerInstance?.fsdName}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="fsdEmail"><g:message code="customer.fsdEmail.label" default="Fsd Email" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdEmail', 'errors')}">
                            <g:textField name="fsdEmail" value="${customerInstance?.fsdEmail}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="fsdTitle"><g:message code="customer.fsdTitle.label" default="Fsd Title" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdTitle', 'errors')}">
                            <g:textField name="fsdTitle" value="${customerInstance?.fsdTitle}" />
                        </td>
                    </tr>
                </tbody>
            </table>
             <table style="width:360px; margin:10px; 20px; margin-left:0">
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="ndName"><g:message code="customer.ndName.label" default="Nd Name" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'ndName', 'errors')}">
                            <g:textField name="ndName" value="${customerInstance?.ndName}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="ndEmail"><g:message code="customer.ndEmail.label" default="Nd Email" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'ndEmail', 'errors')}">
                            <g:textField name="ndEmail" value="${customerInstance?.ndEmail}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="ndTitle"><g:message code="customer.ndTitle.label" default="Nd Title" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'ndTitle', 'errors')}">
                            <g:textField name="ndTitle" value="${customerInstance?.ndTitle}" />
                        </td>
                    </tr>
                 </tbody>
             </table>
             <table style="width:360px; margin:10px 20px; margin-left:0">
                <tbody>
                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="cdName"><g:message code="customer.cdName.label" default="Cd Name" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdName', 'errors')}">
                            <g:textField name="cdName" value="${customerInstance?.cdName}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="cdEmail"><g:message code="customer.cdEmail.label" default="Cd Email" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdEmail', 'errors')}">
                            <g:textField name="cdEmail" value="${customerInstance?.cdEmail}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="cdTitle"><g:message code="customer.cdTitle.label" default="Cd Title" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'cdTitle', 'errors')}">
                            <g:textField name="cdTitle" value="${customerInstance?.cdTitle}"/>
                        </td>
                    </tr>
                </tbody>
            </table>
            </div>

            <div id="column2" style="float:left;">
	            <table style="margin:20px; width:360px">
	                <tbody>

	                    <tr class="prop">
	                        <td valign="top" class="name">
	                            <label for="email"><g:message code="customer.email.label" default="Email" /></label>
	                        </td>
	                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
	                            <g:textField name="email" value="${customerInstance?.email}" />
	                        </td>
	                    </tr>

	                    <tr class="prop">
	                        <td valign="top" class="name">
	                            <label for="phone"><g:message code="customer.phone.label" default="Phone" /></label>
	                        </td>
	                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'phone', 'errors')}">
	                            <g:textField name="phone" value="${customerInstance?.phone}" />
	                        </td>
	                    </tr>

	                    <tr class="prop">
	                        <td valign="top" class="name">
	                            <label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
	                        </td>
	                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
	                            <g:textField name="fax" value="${customerInstance?.fax}" />
	                        </td>
	                    </tr>


	                    <tr>
	                        <td>
	                            <h3>Delivery Address</h3>
	                        </td>
	                    </tr>
	                    <tr class="prop">
	                        <td valign="top" class="name">
	                            <label for="deliveryAddress.street"><g:message code="address.street.label" default="Street" /></label>
	                        </td>
	                        <td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'street', 'errors')}">
	                            <g:textField name="deliveryAddress.street" value="${customerInstance?.deliveryAddress?.street}" />
	                        </td>
	                    </tr>

	                    <tr class="prop">
	                        <td valign="top" class="name">
	                            <label for="deliveryAddress.city"><g:message code="address.city.label" default="City" /></label>
	                        </td>
	                        <td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'city', 'errors')}">
	                            <g:textField name="deliveryAddress.city" value="${customerInstance?.deliveryAddress?.city}" />
	                        </td>
	                    </tr>


	                    <tr class="prop">
	                        <td valign="top" class="name">
	                            <label for="state"><g:message code="address.state.label" default="State" /></label>
	                        </td>
	                        <td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'state', 'errors')}">
	                            <g:select name="state" from="${customerInstance?.deliveryAddress?.constraints?.state?.inList}" value="${customerInstance?.address?.state}" valueMessagePrefix="address.state"  />
	                        </td>
	                    </tr>

	                    <tr class="prop">
	                        <td valign="top" class="name">
	                            <label for="deliveryAddress.zip"><g:message code="address.zip.label" default="Zip" /></label>
	                        </td>
	                        <td valign="top" class="value ${hasErrors(bean: customerInstance?.deliveryAddress, field: 'zip', 'errors')}">
	                            <g:textField name="deliveryAddress.zip" value="${fieldValue(bean: customerInstance?.deliveryAddress, field: 'zip')}" />
	                        </td>
	                    </tr>

	                </tbody>
	            </table>
                </div>
	            <div id="column3" style="float:right; width:340px">
		            <table style="margin:20px; margin-left:0">
		               <tbody>
                           <tr class="prop">
	                           <td valign="top" class="name">
	                               <label for="hasBakery"><g:message code="customer.hasBakery.label" default="Has Bakery" /></label>
	                           </td>
	                           <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'hasBakery', 'errors')}">
	                               <g:checkBox name="hasBakery" value="${customerInstance?.hasBakery}" />
	                           </td>
	                       </tr>

	                      <tr class="prop">
	                          <td valign="top" class="name">
	                              <label for="purchaseFreshBread"><g:message code="customer.purchaseFreshBread.label" default="Purchase Fresh Bread" /></label>
	                          </td>
	                          <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFreshBread', 'errors')}">
	                              <g:checkBox name="purchaseFreshBread" value="${customerInstance?.purchaseFreshBread}" />
	                          </td>
	                      </tr>

	                      <tr class="prop">
	                          <td valign="top" class="name">
	                              <label for="purchaseFrozenBread"><g:message code="customer.purchaseFrozenBread.label" default="Purchase Frozen Bread" /></label>
	                          </td>
	                          <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFrozenBread', 'errors')}">
	                              <g:checkBox name="purchaseFrozenBread" value="${customerInstance?.purchaseFrozenBread}" />
	                          </td>
	                      </tr>

	                      <tr class="prop">
	                          <td valign="top" class="name">
	                              <label for="purchaseFrozenFood"><g:message code="customer.purchaseFrozenFood.label" default="Purchase Frozen Food" /></label>
	                          </td>
	                          <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchaseFrozenFood', 'errors')}">
	                              <g:checkBox name="purchaseFrozenFood" value="${customerInstance?.purchaseFrozenFood}" />
	                          </td>
	                      </tr>

	                      <tr class="prop">
	                          <td valign="top" class="name">
	                              <label for="purchasePreparedFood"><g:message code="customer.purchasePreparedFood.label" default="Purchase Prepared Food" /></label>
	                          </td>
	                          <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'purchasePreparedFood', 'errors')}">
	                              <g:checkBox name="purchasePreparedFood" value="${customerInstance?.purchasePreparedFood}" />
	                          </td>
	                      </tr>

	                      <tr class="prop">
	                          <td valign="top" class="name">
	                              <label for="receivedCurrentMailing"><g:message code="customer.receivedCurrentMailing.label" default="Received Current Mailing" /></label>
	                          </td>
	                          <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'receivedCurrentMailing', 'errors')}">
	                              <g:checkBox name="receivedCurrentMailing" value="${customerInstance?.receivedCurrentMailing}" />
	                          </td>
	                      </tr>
	                      <tr class="prop">
		                        <td valign="top" class="name">
		                            <label for="studentsInDistrict"><g:message code="customer.studentsInDistrict.label" default="Students In District" /></label>
		                        </td>
		                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'studentsInDistrict', 'errors')}">
		                            <g:textField name="studentsInDistrict" value="${fieldValue(bean: customerInstance, field: 'studentsInDistrict')}" />
		                        </td>
		                    </tr>

		                    <tr class="prop">
		                        <td valign="top" class="name">
		                            <label for="facilities"><g:message code="customer.facilities.label" default="Facilities" /></label>
		                        </td>
		                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'facilities', 'errors')}">
		                            <g:textField name="facilities" value="${fieldValue(bean: customerInstance, field: 'facilities')}" />
		                        </td>
		                    </tr>

		                    <tr class="prop">
		                        <td valign="top" class="name">
		                            <label for="breakfastsServed"><g:message code="customer.breakfastsServed.label" default="Breakfasts Served" /></label>
		                        </td>
		                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'breakfastsServed', 'errors')}">
		                            <g:textField name="breakfastsServed" value="${fieldValue(bean: customerInstance, field: 'breakfastsServed')}" />
		                        </td>
		                    </tr>

		                    <tr class="prop">
		                        <td valign="top" class="name">
		                            <label for="lunchesServed"><g:message code="customer.lunchesServed.label" default="Lunches Served" /></label>
		                        </td>
		                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'lunchesServed', 'errors')}">
		                            <g:textField name="lunchesServed" value="${fieldValue(bean: customerInstance, field: 'lunchesServed')}" />
		                        </td>
		                    </tr>

		                    <tr class="prop">
		                        <td valign="top" class="name">
		                            <label for="snacksServed"><g:message code="customer.snacksServed.label" default="Snacks Served" /></label>
		                        </td>
		                        <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'snacksServed', 'errors')}">
		                            <g:textField name="snacksServed" value="${fieldValue(bean: customerInstance, field: 'snacksServed')}" />
		                        </td>
		                    </tr>

		               </tbody>
		            </table>

	        </div>
        </div>
    </div>
</body>
</html>