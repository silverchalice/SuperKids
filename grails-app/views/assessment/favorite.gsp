

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess_landing" />
        <meta name="currentProductId" content="${product?.id}" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>SuperKids | Online Assessment 1/4</title>
			<style type="text/css">
			#contentInsetUpper {
				width:601px;
				left:309px;

			}

			#contentInsetInner {
				width:581px;
				position:relative;
				left:40px;
			}

			#contentInsetLower {
				width:601px;
				left:309px;
			}
		</style>
		<g:javascript library="jquery" plugin="jquery" />
    </head>
    <body>
        <div id="contentInsetInner">
            <h1>${product?.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assessmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${assessmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="favorite" >
                <g:hiddenField name="productId" value="${id}" />
                <g:hiddenField name="customerId" value="${customerId}" />
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />

				<div id="assessmentQuestionUpper">
					<img src="${resource(dir:'images', file:'AssessTLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessTRC.gif')}" style="float:right" alt="" />
				</div>

                <div id="assessmentQuestionInner"><br />
				  <p style="position:absolute; top:1px; left:345px; font-size:14px">Assessment Question 1.5 of 4</p>
                  <p style="font-size:14px;">
                    <label>Please check which varieties of the pasta you like:</label> <br/><br/><br/>
                    <label><input type="checkbox" name="favorites.1" value="Penne" >Penne</label>
                    <label><input type="checkbox" name="favorites.2" value="Spaghetti" >Spaghetti</label>
                    <label><input type="checkbox" name="favorites.3" value="Macaroni" >Macaroni</label>
                    <label><input type="checkbox" name="favorites.4" value="Rotini" >Rotini</label>
                    <label><input type="checkbox" name="favorites.5" value="Lasagna" >Lasagna</label>
                    <label><input type="checkbox" name="favorites.6" value="9-Grain orzo" >9-Grain orzo</label>
                    <g:hiddenField name="product.id" value="${product?.id}" />

                  </p>
                </div>

				<div id="assessmentQuestionLower">
					<img src="${resource(dir:'images', file:'AssessLLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessLRC.gif')}" style="float:right" alt="" />
				</div>

                <input type="submit" id="continueAssessment" value="" />
            </g:form>
        </div>

		<script type="text/javascript">
			jQuery.noConflict();

			jQuery(document).ready(function() {
				var changedFlag;
				jQuery(':input').bind('change', function() {
			    //console.log('changedFlag = true')
				changedFlag = 'true';
				});

				jQuery('#continueAssessment').click(function (e) {
					if(changedFlag == 'true') {
						return true
					}
					else {
						alert('No rating selected');
						return false
					}
				});

			});
		</script>

    </body>
</html>
