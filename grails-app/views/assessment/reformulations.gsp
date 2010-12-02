

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
             <h1>Tell Us About Your Interest In Reformulations</h1>

             <g:form action="other_products" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />

				<div id="assessmentQuestionUpper" style="top:65px">
					<img src="${resource(dir:'images', file:'AssessTLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessTRC.gif')}" style="float:right" alt="" />
				</div>

                <div id="assessmentQuestionInner" style="top:75px; padding-top:25px; padding-bottom:5px;"><br />
				  <p style="position:absolute; top:1px; left:15px; font-size:14px; line-height:16px;">Are there any products you're currently using that you would like to see reformulated with Ultragrain and/or Sustagrain? Please list the product name(s) and their manufacturers. </p>
                  <textarea name="reformulations" rows="9" cols="50" style="margin-top:15px"></textarea>
                </div>

				<div id="assessmentQuestionLower" style="top:279px">
					<img src="${resource(dir:'images', file:'AssessLLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessLRC.gif')}" style="float:right" alt="" />
				</div>

               <input type="submit" id="continueAssessment" style="right:50px" value="" />
            </g:form>

        </div>
    </body>
</html>
