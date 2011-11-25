

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
    <div id="contentInsetInner">
             <h1>Rewards For Completing Your Assessment</h1>

             <g:form action="finish" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />

				<div id="assessmentQuestionUpper" style="top:65px">
					<img src="${resource(dir:'images', file:'AssessTLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessTRC.gif')}" style="float:right" alt="" />
				</div>

                <div id="assessmentQuestionInner" style="top:75px; padding-top:5px; padding-bottom:0px;">
                  <p style="color:#FA9F1B; font-weight:bold; font-size:14px;">
                    Thank You!Your assessment has been received, qualifying you for the sweepstakes prize drawing.
                  </p>

                    <ol style="list-style-type:decimal; color:#000000; font-weight:normal">
                    <li><span style="color:#800000">FIVE (5) First Place Prizes</span>--&#36;200 Gift Card from your choice of Wal-Mart, Target, Learning ZoneXpress, or The OrganWise Guys</li>
                    <li><span style="color:#800000">TEN (10) Second Place Prizes</span>--&#36;100 Gift Card from your choice of Wal-Mart, Target, Learning ZoneXpress, or The OrganWise Guys</li>
                    </ol>
                    <p style="color:#000000; font-weight:normal">Please note that you are responsible for ensuring that any rewards provided to you within this program are authorized by your school district.
                    Click sweepstakes rules for more information. <g:link controller="home" action="assessment_drawing_rules">Sweepstakes Rules</g:link>    </p>

                </div>

				<div id="assessmentQuestionLower" style="top:239px">
					<img src="${resource(dir:'images', file:'AssessLLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessLRC.gif')}" style="float:right" alt="" />
				</div>

               <input type="submit" id="continueAssessment" style="right:50px" value="" />
            </g:form>

        </div>
       </div>

    </body>
</html>
