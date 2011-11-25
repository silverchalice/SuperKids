

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess_landing" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>Product Assessment | SuperKids</title>
    </head>
    <body>
		<div id="contentInsetInner">
             <h1>Please Give Us Your Feedback About The SuperKids Whole Grain Sampling Program</h1>

             <g:form action="reformulations" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />

				<div id="assessmentQuestionUpper" style="top:65px">
					<img src="${resource(dir:'images', file:'AssessTLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessTRC.gif')}" style="float:right" alt="" />
				</div>

                <div id="assessmentQuestionInner" style="top:75px; padding-top:25px;"><br />
				  <p style="position:absolute; top:1px; left:15px; font-size:14px">We welcome your feedback. Please enter any positive or negative comments about the SuperKids program in general.</p>
                  <textarea name="programFeedback" rows="10" cols="50"></textarea>
                </div>

				<div id="assessmentQuestionLower" style="top:275px">
					<img src="${resource(dir:'images', file:'AssessLLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessLRC.gif')}" style="float:right" alt="" />
				</div>

               <input type="submit" id="continueAssessment" style="right:50px" value="" />
            </g:form>

        </div>

    </body>
</html>
