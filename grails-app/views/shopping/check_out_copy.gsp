

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="checkout" />

        <title>SuperKids | Checkout</title>
    </head>
    <body>

		<div id="contentInsetInner">
            <h1>Checkout Step 1 of 2</h1> <br/>
            <h1>School District Profile</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="shopping" action="confirm" method="post" >
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />

                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="district"><g:message code="customer.district.label" default="District" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'district', 'errors')}">
                                    <g:textField name="district" value="${customerInstance?.district}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="customer.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${customerInstance?.email}" />
                                </td>
                            </tr>

                            <tr> 			
                                <td align="right">Address</td> 
                                <td align="left"><input type="text" name="address.street" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">&nbsp;</td> 
                                <td align="left"><input type="text" name="address.street2" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">City</td> 
                                <td align="left"><input type="text" name="address.city" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">State</td>
                                <td align="left"> 
                                    <g:select name="address.state" from="${states}" />
                                </td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Zip</td>
                                <td align="left"><input type="text" name="address.zip" value="" size="20" maxlength="50"></td> 
                            </tr> 

                            <tr> 			
                                <td align="right">Sample Delivery Address</td> 
                                <td align="left"><input type="text" name="deliveryAddress.street" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">&nbsp;</td> 
                                <td align="left"><input type="text" name="deliveryAddress.street2" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">City</td> 
                                <td align="left"><input type="text" name="deliveryAddress.city" value="" size="20" maxlength="50"></td> 
                            </tr> 
                            <tr> 			
                                <td align="right">State</td>
                                <td align="left"> 
                                    <g:select name="deliveryAddress.state" from="${states}" />
                                </td> 
                            </tr> 
                            <tr> 			
                                <td align="right">Zip</td>
                                <td align="left"><input type="text" name="deliveryAddress.zip" value="" size="20" maxlength="50"></td> 
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
                                  <label for="fsdTitle"><g:message code="customer.fsdTitle.label" default="Fsd Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fsdTitle', 'errors')}">
                                    <g:select name="fsdTitle" from="${customerInstance.constraints.fsdTitle.inList}" value="${customerInstance?.fsdTitle}" valueMessagePrefix="customer.fsdTitle" noSelection="['': '']" />
                                </td>
                            </tr>

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
                                    <g:select name="ndTitle" from="${customerInstance.constraints.ndTitle.inList}" value="${customerInstance?.ndTitle}" valueMessagePrefix="customer.ndTitle" noSelection="['': '']" />
                                </td>
                            </tr>

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
                                    <g:select name="cdTitle" from="${customerInstance.constraints.cdTitle.inList}" value="${customerInstance?.cdTitle}" valueMessagePrefix="customer.cdTitle" noSelection="['': '']" />
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
                                <td>
                                    <div class="buttons">
                                        <br />
                                        <span class="button"><g:submitButton name="create" class="save" value="Continue" /></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
            <g:form controller="${broker ? 'product' : 'home'}" action="${broker ? 'updateBroker': 'addBroker'}" method="post">
            <div style="width:250px; float:right;">
                      <table cellpadding="3" cellspacing="0" border="0" width="300"> 
                          <tr> 
                              <td><strong>Broker/Distributor Name: </strong></td> 
                              <td><input type="text" name="name" size="20" maxlength="50" value="${broker?.name}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Email: </strong></td> 
                              <td><input type="text" name="email" size="20" maxlength="50" value="${broker?.email}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Telephone: </strong></td> 
                              <td><input type="text" name="phone" size="20" maxlength="50" value="${broker?.phone}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Fax: </strong></td> 
                              <td><input type="text" name="fax" size="20" maxlength="50" value="${broker?.fax}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Address: </strong></td> 
                              <td><input type="text" name="street" size="20" maxlength="255" value="${broker?.street}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong></strong></td> 
                              <td><input type="text" name="street2" size="20" maxlength="255" value="${broker?.street2}"></td> 
                          </tr> 
                          <tr> 
                              <td><strong>City: </strong></td> 
                              <td><input type="text" name="city" size="20" maxlength="50" value="${broker?.city}"></td> 
                          </tr> 
                          <tr> 			
                              <td><strong>State</strong></td> 
                              <td align="left"> 
                                    <g:select name="state" from="${states}"  value="${broker?.state}" />
                              </td> 
                          </tr> 
                          <tr> 
                              <td><strong>Zip: </strong></td> 
                              <td><input type="text" name="zip" size="10" maxlength="20" value="${broker?.zip}"></td> 
                          </tr> 
                          <tr> 
                              <td><g:hiddenField name="rController" value="product" />
                              <g:hiddenField name="rAction" value="check_out" />
                              <g:hiddenField name="id" value="${broker?.id}" /></td> 
                          </tr> 
                            <tr>
                                <td>
                                    <div class="buttons">
                                        <br />
                                        <span class="button"><g:submitButton name="create" class="save" value="ADD" /></span>
                                    </div>
                                </td>
                            </tr>

                      </table> 
            </g:form>
            </div>
            <div style="width:340px; float:left;">
                    <table>
                        <thead>
                            <th><strong>Name</strong></th>
                            <th><strong>Email</strong></th>
                            <th></th>
                        </thead>
                        <tbody>
                          <g:each in="${customerInstance.brokers}" var="broker">
                             <tr>
                                <td>
                                  ${broker?.name}
                                </td>
                                <td>
                                  ${broker?.email}
                                </td>
                                <td>
                                  <g:link action="brokerEditFromEdit" id="${broker?.id}" params="[rController:'product', rAction:'check_out']">Edit</g:link> | <g:link action="brokerDeleteFromEdit" id="${broker?.id}" params="[rController:'product', rAction:'check_out']">Delete</g:link>
                                </td>
                            </tr>
                          </g:each>
                        </tbody>
                    </table>
		</div>
    </body>
</html>
