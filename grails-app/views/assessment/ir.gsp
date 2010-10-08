

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess_landing" />
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
                <div class="dialog"><br />
                  <p>
                    <label for="iRating">Please rate your interest in purchasing this product (where 1 is "low interest" and 5 is "high interest"). </label><br /><br />
                    <label><input type="radio" name="iRating" value="1" >1</label>
                    <label><input type="radio" name="iRating" value="2" >2</label>
                    <label><input type="radio" name="iRating" value="3" >3</label>
                    <label><input type="radio" name="iRating" value="4" >4</label>
                    <label><input type="radio" name="iRating" value="5" >5</label>
                  </p><br />
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Finish" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
