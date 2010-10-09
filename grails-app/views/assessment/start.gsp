

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
            <g:form action="lc" >
                <g:hiddenField name="productId" value="${id}" />
                <g:hiddenField name="customerId" value="${customerId}" />
                <div class="dialog"><br />
                  <p>
                    <label for="likeRating">On a scale of 1 to 5 where 1 is 'not liked' and 5 is 'well liked', how did you like this product?</label><br /><br />
                    <label><input type="radio" name="likeRating" value="1" >1</label>
                    <label><input type="radio" name="likeRating" value="2" >2</label>
                    <label><input type="radio" name="likeRating" value="3" >3</label>
                    <label><input type="radio" name="likeRating" value="4" >4</label>
                    <label><input type="radio" name="likeRating" value="5" >5</label>
                    <g:hiddenField name="product.id" value="${id}" />
                  </p>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Next" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>

