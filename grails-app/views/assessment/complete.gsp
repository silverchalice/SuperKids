

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
            <h1>Product Assessment: All Done!</h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <br />
            <p><strong>Product:</strong> ${assessmentInstance.product}</p>
            <p><strong>Like Rating:</strong> ${assessmentInstance.likeRating}</p>
            <p><strong>Interest Rating:</strong> ${assessmentInstance.iRating}</p>
            <p><strong>Like Comment:</strong> ${assessmentInstance.likeComment}</p>
            <p><strong>Change Comment:</strong> ${assessmentInstance.changeComment}</p>
        </div>
    </body>
</html>
