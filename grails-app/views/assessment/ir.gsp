

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
                                  <label for="interestRating">Please rate your interest in purchasing this product (where 1 is "low interest" and 5 is "high interest"). </label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: assessmentInstance, field: 'interestRating', 'errors')}">
                                    <label><input type="radio" name="interestRating" value="1" >1</label>
                                    <label><input type="radio" name="interestRating" value="2" >2</label>
                                    <label><input type="radio" name="interestRating" value="3" >3</label>
                                    <label><input type="radio" name="interestRating" value="4" >4</label>
                                    <label><input type="radio" name="interestRating" value="5" >5</label>
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
