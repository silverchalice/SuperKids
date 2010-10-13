

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
            <g:form action="rewards" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />
                <div class="dialog"><br />
                  <p>
                    <label for="otherProducts">What other whole grain products are you interested in?</label><br /><br />
                    <textarea name="otherProducts" rows="10" cols="50"></textarea> 
                  </p>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Continue" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
