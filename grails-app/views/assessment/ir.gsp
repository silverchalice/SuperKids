

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>Product Assessment | SuperKids</title>
    </head>
    <body>
        <div class="body">
            <h1>Product Assessment</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assessmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${assessmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="complete" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="interestRating">Exactly how many numbers are you interested in, you know, <em>buying</em> this product?</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assessmentInstance, field: 'interestRating', 'errors')}">
                                    <g:textField name="interestRating" value="${fieldValue(bean: assessmentInstance, field: 'interestRating')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
