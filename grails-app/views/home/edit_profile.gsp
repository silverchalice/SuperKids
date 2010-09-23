

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public" />
        <title>Edit Profile | SuperKids</title>
    </head>
    <body>
            <h1>Edit Profile</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="update" method="post" >
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
                <div style="height:440px; overflow:auto;">
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

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="customer.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'address', 'errors')}">
                                    <g:select name="address.id" from="${com.superkids.domain.Address.list()}" optionKey="id" value="${customerInstance?.address?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="deliveryAddress"><g:message code="customer.deliveryAddress.label" default="Delivery Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'deliveryAddress', 'errors')}">
                                    <g:select name="deliveryAddress.id" from="${com.superkids.domain.Address.list()}" optionKey="id" value="${customerInstance?.deliveryAddress?.id}" noSelection="['null': '']" />
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

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="receivedCurrentMailing"><g:message code="customer.receivedCurrentMailing.label" default="Received Current Mailing" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'receivedCurrentMailing', 'errors')}">
                                    <g:checkBox name="receivedCurrentMailing" value="${customerInstance?.receivedCurrentMailing}" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="buttons">
                                        <br />
                                        <span class="button"><g:submitButton name="create" class="save" value="Update" /></span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </g:form>
            <g:form action="brokerFromEdit" method="post">
                      <table cellpadding="3" cellspacing="0" border="0" width="300"> 
                          <tr> 
                              <td><strong>Broker/Distributor Name: </strong></td> 
                              <td><input type="text" name="brokerName" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Email: </strong></td> 
                              <td><input type="text" name="brokerEmail" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Telephone: </strong></td> 
                              <td><input type="text" name="brokerPhone" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Fax: </strong></td> 
                              <td><input type="text" name="brokerFax" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>Address: </strong></td> 
                              <td><input type="text" name="brokerStreet" size="20" maxlength="255" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong></strong></td> 
                              <td><input type="text" name="brokerStreet2" size="20" maxlength="255" value=""></td> 
                          </tr> 
                          <tr> 
                              <td><strong>City: </strong></td> 
                              <td><input type="text" name="brokerCity" size="20" maxlength="50" value=""></td> 
                          </tr> 
                          <tr> 			
                              <td>State</td> 
                              <td align="left"> 
                                    <g:select name="brokerState" from="${states}" />
                              </td> 
                          </tr> 
                          <tr> 
                              <td><strong>Zip: </strong></td> 
                              <td><input type="text" name="brokerZip" size="10" maxlength="20" value=""></td> 
                          </tr> 
                            <tr>
                                <td>
                                    <div class="buttons">
                                        <br />
                                        <span class="button"><g:submitButton name="create" class="save" value="Add" /></span>
                                    </div>
                                </td>
                            </tr>

                      </table> 
            </g:form>
    </body>
</html>
