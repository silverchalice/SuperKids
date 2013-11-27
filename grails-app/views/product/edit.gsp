

<%@ page import="com.superkids.domain.Sponsor; com.superkids.domain.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <ckeditor:resources/>
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
                    <legend>Product Information</legend>
                    <p>
                        <label for="name">Product Name:</label>
                        <g:textField name="name" value="${productInstance?.name}" />
                    </p><br />
                    <p>
                        <label for="name">Displayed Title:</label>
                        <g:textField name="title" value="${productInstance?.title}" />
                    </p><br />
                    <p>
                        <label for="name">Sort Order:</label>
                        <g:textField name="sortOrder" value="${productInstance?.sortOrder}" />
                    </p><br />

                    <p>
                        <label for="nutrition">Nutrition Information:</label>
                        <ckeditor:editor
                            name="nutrition"
                            width="100%"
                            height="400">
                            ${productInstance?.nutrition}
                        </ckeditor:editor>
                    </p><br />

                    <p>
                        <label for="details">Details:</label>

                            <ckeditor:editor
                                name="details"
                                width="100%"
                                height="400">
                                ${productInstance?.details}
                            </ckeditor:editor>
                    </p><br/>

                    <p>
                        <label for="description">Description:</label>

                        <ckeditor:editor
                            name="description"
                            width="100%"
                            height="400">
                            ${productInstance?.description}
                        </ckeditor:editor>
                    </p>
                    <p><br />
                        <label for="statesAvailable">States Available:</label><br />
                        <select name="statesAvailable" id="statesAvailable" multiple size="15">
                            <g:each in="${states}" var="state">
                                <option value="${state}" ${productInstance.statesAvailable.contains(state) ? 'selected="selected"' : ''} >${state}</option>
                            </g:each>
                        </select>
                    </p>
                </fieldset>
                <fieldset style="float:left;  width:420px; margin:10px">
                    <legend>Manufacturer </legend>


                            <g:select name="sponsor.id"
                              id="sponsor.id"
                              from="${Sponsor.list()}"
                              style="width:220px;"
                              value="${productInstance.sponsor?.id}"
                              optionKey="id"
                              noSelection="${['null':'Select a Manufacturer...']}" />
                    </p>
                    <br />

                    <p>
                        <label>Product Summary PDF:</label>
                        <g:link action="downloadSummary" id="${productInstance.id}">${productInstance.summaryName}</g:link><br /><br />
                        <g:link controller="product" action="new_summary" id="${productInstance?.id}">New Summary File</g:link>

                    </p><br />

                    <p>

                        <label for="image">Normal Thumbnail:</label>
                        <input type="file" name="image" id="image"/>
						<img src="${createLink(action:'displayImage', id:productInstance.id)}" height="40" width="60" />
                    </p><br />


                    <p>
                        <label for="hoverImage">Selected Thumbnail:</label>
                        <input type="file" name="hoverImage" id="hoverImage"/>
						<img src="${createLink(action:'displayHoverImage', id:productInstance.id)}" height="40" width="60" />
                    </p><br />

                    <p>
                        <label for="backgroundImage">Background Image</label>
                        <input type="text" name="backgroundImage" id="backgroundImage" value="${productInstance.backgroundImage}"/>
						<img src="${resource(dir:'uploads', file:productInstance.backgroundImage)}" height="60" width="60" />
                    </p><br />

					<p>
						<label for="bake">Baked:</label> <g:checkBox name="bake" value="${productInstance?.bake}" />
					</p>

					<p>
						<label for="frozen">Frozen:</label> <g:checkBox name="frozen" value="${productInstance?.frozen}" />
					</p>

					<p>
						<label for="liveProduct">Live:</label> <g:checkBox name="liveProduct" value="${productInstance?.liveProduct}" />
					</p>
                    <p>
                        <label for="ultragrain">Uses Ultragrain:</label> <g:checkBox name="ultragrain" value="${productInstance?.ultragrain}" />
                    </p>
                    <p>
                        <label for="sustagrain">Uses Sustagrain:</label> <g:checkBox name="sustagrain" value="${productInstance?.sustagrain}" />
                    </p>
                     <p>
                        <label for="servings"># of Servings:</label>
                        <g:textField name="servings" value="${productInstance?.servings}" />
                    </p><br />

 					<p><h3>Parent: ${productInstance.parent?.name}</h3><br/></p>
                     <p><g:message code="product.parent" default="Parent ( if part of a Sample Pack)" /><br />


							<g:select name="parentProd"
							  id="parentProd"
							  from="${Product.findAllByParentIsNull()}"
							  style="width:220px;"
							  value="${productInstance.parent}"
                optionKey="id"
                optionValue="name"
							  noSelection="${['null':'Select a Parent Product...']}" />
					</p>
					<br />

					<p>
					 <g:if test="${subProducts}">
						<h3>SAMPLE PACK - SUBPRODUCTS</h3>
						 <br/>
						<ul>
						<g:each in="${subProducts}" var="product">
							<li><g:link action="edit" id="${product?.id}">${product.name}</g:link></li>
						</g:each>
						</ul>


					 </g:if>
					</p>


					</fieldset>
                </div>
                <div class="buttons" style="clear:both">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>

        </div>
    </body>
</html>
