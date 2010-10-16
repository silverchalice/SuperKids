<%@ page import="com.superkids.domain.Product" %>
<%@ page import="com.superkids.domain.Customer" %>
<%@ page import="com.superkids.domain.ShippingDate" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <div style="margin:20px 0px; border:1px solid; padding:15px;">
                <g:form method="post" action="findSchoolDistrict">
                    School District: <input type="text" name="query" />
                    <input type="submit" value="Search" />
                </g:form>
            </div>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <h2>School District Information</h2>
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">School District</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "district")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Order Placed</td>
                            
                            <td valign="top" class="value"><sks:orderCheckbox id="${customerInstance.id}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Assessment Taken</td>
                            
                            <td valign="top" class="value"><sks:assessmentCheckbox id="${customerInstance.id}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Phone</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "phone")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Fax</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fax")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Email</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "email")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Sign up Date</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "dateCreated")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Last Updated Date</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "lastUpdated")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Address</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "address.street")}<br />
                            ${fieldValue(bean: customerInstance, field: "address.street2")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">City, State Zip</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "address.city")}, ${fieldValue(bean: customerInstance, field: "address.state")} ${fieldValue(bean: customerInstance, field: "address.zip")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Added By</strong></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Entry Name</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdName")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Delivery Information</strong></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Address</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "deliveryAddress.street")}<br />
                            ${fieldValue(bean: customerInstance, field: "deliveryAddress.street2")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">City, State Zip</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "deliveryAddress.city")}, ${fieldValue(bean: customerInstance, field: "deliveryAddress.state")} ${fieldValue(bean: customerInstance, field: "deliveryAddress.zip")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Properties</strong></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">proof and bake</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="hasBakery" property="hasBakery" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Bake Frozen Bread</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="purchaseFrozenBread" property="purchaseFrozenBread" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Purchase prepared foods</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="purchasePreparedFood" property="purchasePreparedFood" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Purchase frozen foods</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="purchaseFrozenFood" property="purchaseFrozenFood" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Purchase fresh bakery</td>
                            
                            <td valign="top" class="value"><sks:propertyCheckbox id="${customerInstance.id}" name="purchaseFreshBread" property="purchaseFreshBread" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Student Information</strong></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># of Facilities</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "facilities")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># of Students in District</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "studentsInDistrict")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># of Students Served</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "studentsInDistrict")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># Breakfasts Served</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "breakfastsServed")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># Lunches Served</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "lunchesServed")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># Snacks Served</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "snacksServed")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"># of Meals Served</td>
                            
                            <td valign="top" class="value">${customerInstance.breakfastsServed.toInteger() + customerInstance.lunchesServed.toInteger() + customerInstance.snacksServed.toInteger()}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Entry Name</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdName")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
                <h2>FSD Login Information</h2>
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Username</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdEmail")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Name</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fsdName")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Entry Date</td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "dateCreated")}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">Last Login</td>
                            
                            <td valign="top" class="value"></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
                <h2>Manual Order</h2>
                <table>
                    <tr> 
                        <th>Item Name</th> 
                        <th>Order</th> 
                    </tr>				
                    <g:form name="OrderProduct" action="add_order" method="post">
                    <g:hiddenField name="id" value="${customerInstance.id}" />
                        <g:each in="${Product.list()}" var="product">
                            <tr>
                                <td width="500">${product?.sponsor?.name}<sup>®</sup> ${product?.name}</td> 
                                <td><input type="checkbox" name="product" value="${product.id}" /></td>		
                            </tr>
                            <tr> 
                        </g:each>
                                <td colspan="2"> 
                                    <strong>Order Origin:</strong>
                                    <input type="radio" name="OrderOrigin" value="WEB" checked="checked">Web&nbsp;&nbsp;
                                    <input type="radio" name="OrderOrigin" value="PHONE">Phone&nbsp;&nbsp;
                                    <input type="radio" name="OrderOrigin" value="FAX">Fax&nbsp;&nbsp;
                                    <input type="radio" name="OrderOrigin" value="MAIL">Mail&nbsp;&nbsp;
                                    <input type="radio" name="OrderOrigin" value="EMAIL">Email<br/> 
                        <br />
                        <strong>Requested Ship Date:</strong> 
                        <g:select id="reqShipDate"
                                  name="reqShipDate"
                                  from="${ShippingDate.list()}"
                                  value="shipDate"
                                  optionKey="id"
                                  optionValue="${g.formatDate(format:'MMMM, yyyy', date:shipDate)}" />
                        <br /><br /> 
                        <input type="submit" name="ADD" value="Add Checked Items" /> 
                    </td> 
                </tr> 
				</g:form>		
			</table>
                      <p>&nbsp;</p>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${customerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>s
