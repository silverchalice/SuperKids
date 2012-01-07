

<%@ page import="com.superkids.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="admin">Product List</g:link></span>
        </div>
        <div class="body">
            <h1>Product Administration</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" enctype="multipart/form-data">
                <g:hiddenField name="id" value="${productInstance?.id}" />
                <g:hiddenField name="version" value="${productInstance?.version}" />
                <div class="dialog">
                <fieldset style="float:left; width:420px; margin:10px">
                    <legend>Product Summary PDF</legend>

                    <p><br />
                        <label>Current file:</label>
                        <g:link action="downloadSummary" id="${productInstance.id}">${productInstance.summaryName}</g:link>
                    </p><br /><br />
                    <p>
                        <label>New file:</label>
                        <input type="file" name="summary" id="summary"/>&nbsp;
                    </p><br />

		</fieldset>
                </div>
                <div class="buttons" style="clear:both">
                    <span class="button"><g:actionSubmit class="save" action="save_summary" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:link controller="product" action="admin">Cancel</g:link></span>
                </div>
            </g:form>

        </div>
    </body>
</html>
