
<%@ page import="com.superkids.domain.ContactRequest" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactRequest.label', default: 'ContactRequest')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list">Back to Listing</g:link></span>
        </div>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><strong>Name:</strong></td>
                            
                            <td valign="top" class="value">${contactRequestInstance.firstName} ${contactRequestInstance.lastName}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><strong>Email:</strong></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactRequestInstance, field: "email")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><strong>Company/District:</strong></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactRequestInstance, field: "districtName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><strong>Address:</strong></td>
                            
                            <td valign="top" class="value">${contactRequestInstance.address?.street}
                                <g:if test="${contactRequestInstance.address?.street2}">
                                    <br /> ${contactRequestInstance.address?.street2}
                                </g:if>
                            </td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>City:</strong></td>
                            
                            <td valign="top" class="value">${contactRequestInstance.address?.city}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>State:</strong></td>
                            
                            <td valign="top" class="value">${contactRequestInstance.address?.state}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Zip:</strong></td>
                            
                            <td valign="top" class="value">${contactRequestInstance.address?.zip}</td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><strong>Contact Date</strong></td>
                            
                            <td valign="top" class="value"><g:formatDate format="MM/dd/yyyy" date="${contactRequestInstance.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><strong>Interest:</strong></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: contactRequestInstance, field: "message")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
