

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Add</g:link></span>
        </div>
        <div class="body">
            <div style="margin:20px 0px; border:1px solid; padding:15px; clear:both;">
                <g:form method="post" action="findSchoolDistrict">
                    School District: <input type="text" name="district" />
                    <input type="submit" value="Search" />
                </g:form>
            </div>
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <div style="float:left; width:550px;">
            <g:form method="post">
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
                <div class="dialog">
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
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
            </div>
            <div style="float:right; width:530px;">
                <h1>Manual Order</h1>
                <p>Foo.</p>
                <table cellpadding="5" cellspacing="0" border="1" width="100%">
                    <tr> 
                        <td colspan="2" align="left" class="adminheadline">Manual Order</td> 
                    </tr> 
                    <tr> 
                        <th>ITEM NAME</th> 
                        <th>ORDER</th> 
                    </tr>				
                    <g:form name="OrderProduct" action="add_order" method="post">
                        <g:each in="${products}" var="product">
                            <tr>
                                <td>${product?.sponsor?.name}<sup>®</sup> ${product?.name}</td> 
                                <td><input type="checkbox" name="product" value="${product.id}" /></td>		
                            </tr>
                            <tr> 
                        </g:each>
                                <td colspan="2"> 
                                    <strong>Order Origin:</strong>
                                    <input type="radio" name="OrderOrigin" value="web" checked="checked">Web&nbsp;&nbsp;
                                    <input type="radio" name="OrderOrigin" value="phone">Phone&nbsp;&nbsp;
                                    <input type="radio" name="OrderOrigin" value="fax">Fax&nbsp;&nbsp;
                                    <input type="radio" name="OrderOrigin" value="mail">Mail&nbsp;&nbsp;
                                    <input type="radio" name="OrderOrigin" value="email">Email<br/> 
                        <br />
                        <strong>Requested Ship Date:</strong> 
                        <select id="reqShipDate" name="reqShipDate"> 
                        	<option value="11/2009">November, 2009</option> 
                            <option value="01/2010">January, 2010</option> 
                        </select> 
                        <br /><br /> 
                        <input type="submit" name="ADD" value="Add Checked Items" /> 
                    </td> 
                </tr> 
				</g:form>		
			</table> 
            <div>
        </div>
    </body>
</html>
