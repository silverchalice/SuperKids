

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess_landing" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>SuperKids | Online Assessment 4/4</title>
			<style type="text/css">
			#contentInsetUpper {
				width:601px;
				left:309px;

			}

			#contentInsetInner {
				width:581px;
				position:relative;
				left:40px;
				overflow:hidden;
			}

			#contentInsetLower {
				width:601px;
				left:309px;
			}
		</style>
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
            <g:form action="complete" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />

				<div id="assessmentQuestionUpper">
					<img src="${resource(dir:'images', file:'AssessTLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessTRC.gif')}" style="float:right" alt="" />
				</div>

                <div id="assessmentQuestionInner"><br />
				  <p style="position:absolute; top:1px; left:345px; font-size:14px">Assessment Question 4 of 4</p>
                  <p style="font-size:14px;">
                    <label>Please rate your interest in purchasing this product (where 1 is "low interest" and 5 is "high interest"). </label> <br/><br/><br/>
                    <label style="margin-left:20px"><input type="radio" name="iRating" value="1" >1</label>
                    <label><input type="radio" name="iRating" value="2" >2</label>
                    <label><input type="radio" name="iRating" value="3" >3</label>
                    <label><input type="radio" name="iRating" value="4" >4</label>
                    <label><input type="radio" name="iRating" value="5" >5</label>
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
    </body>
</html>
