

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
            <g:form action="feedback" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />
                <div class="dialog"><br />
                  <h1>Broker or Distributor Contact</h1>
                  <p>
                             Your Broker or Distributor May Be Contacting You. What is the best time of year and day?
                  </p>
                  <p>
                      <br /> Fall: <g:checkBox name="fall" value="${customerInstance?.fall}" /><br />
                      <br /> Spring: <g:checkBox name="spring" value="${customerInstance?.spring}" /><br />
                      <br /> AM: <g:checkBox name="am" value="${customerInstance?.am}" /><br />
                      <br /> PM: <g:checkBox name="pm" value="${customerInstance?.pm}" /><br />
                  </p>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Next" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
