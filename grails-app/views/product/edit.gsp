

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
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
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
                <fieldset>
                    <legend>Product Information</legend>
                    <p>
                        <label for="name">Product Name:</label>
                        <g:textField name="name" value="${productInstance?.name}" />
                    </p><br />     
                        
                    <p>
                        <label for="nutrition">Nutrition Information:</label>
                        <g:textArea style="width:95%; height:300px;" name="nutrition" value="${productInstance?.nutrition}" />
                    </p><br />

                    <p>
                        <label for="description">Description:</label>
                        <g:textArea style="width:95%; height:300px;" name="description" value="${productInstance?.description}" />
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Manufacturer Information</legend>
                    <p>
                        <label for="sponsor.name">Manufacturer Name:</label>
                        <g:textField name="sponsor.name" value="${productInstance?.sponsor?.name}" />
                    </p><br />

                    <p>Company Address:<p><br />
                    <p>
                        <label for="sponsor.address.street">Street:</label>
                        <g:textField name="sponsor.address.street" value="${productInstance?.sponsor?.address.street}" />
                    </p><br />

                    <p>
                        <label for="sponsor.address.street2">Street:</label>
                        <g:textField name="sponsor.address.street2" value="${productInstance?.sponsor?.address.street2}" />
                    </p><br />

                    <p>
                        <label for="sponsor.address.city">City:</label>
                        <g:textField name="sponsor.address.city" value="${productInstance?.sponsor?.address.city}" />
                    </p><br />

                    <p>
                        <label for="sponsor.address.state">State:</label>
                        <g:textField name="sponsor.address.state" value="${productInstance?.sponsor?.address.state}" />
                    </p><br />

                    <p>
                        <label for="sponsor.address.zip">Zip:</label>
                        <g:textField name="sponsor.address.zip" value="${productInstance?.sponsor?.address.zip}" />
                    </p><br />

                    <p>
                        <label for="sponsor.phone">Main Telephone # :</label>
                        <g:textField name="sponsor.phone" value="${productInstance?.sponsor?.phone}" />
                    </p><br />

                    <p>
                        <label for="sponsor.website">Website Address:</label>
                        <g:textField name="sponsor.website" value="${productInstance?.sponsor?.website}" />
                    </p><br />

                    <p>
                        <label for="sponsor.salesContact">Sales Contact:</label>
                        <g:textField name="sponsor.salesContact" value="${productInstance?.sponsor?.salesContact}" />
                    </p><br />

                    <p>
                        <label for="sponsor.sampleContact">Samples Contact:</label>
                        <g:textField name="sponsor.sampleContact" value="${productInstance?.sponsor?.sampleContact}" />
                    </p><br />

                    <p>
                        <label for="summaryFile">Print PDF:</label>
                        <input type="file" name="summaryFile" id="summaryFile"/>&nbsp;
                        <a href="${resource(dir:'pdf', file:productInstance.summary)}">${productInstance.summary}</a>
                    </p><br />

                    <p>
                        <img src="${createLink(action:'displayImage', id:productInstance.id)}" height="40" width="60" />
                        <label for="image">Thumbnail:</label>
                        <input type="file" name="image" id="image"/>
                    </p><br />                   
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
