

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
             <h1>Broker or Distributor Contact</h1>

             <g:form action="feedback" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />

				<div id="assessmentQuestionUpper" style="top:40px">
					<img src="${resource(dir:'images', file:'AssessTLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessTRC.gif')}" style="float:right" alt="" />
				</div>

                <div id="assessmentQuestionInner" style="top:50px; padding-top:25px; padding-bottom:5px;"><br />
				  <p style="position:absolute; top:1px; left:15px; font-size:14px">Your Broker or Distributor May Be Contacting You. What is the best time of<br/> year and day?</p>
                  <table style="color:#000000; border:none">
                    <tr>
                      <td style="font-weight:bold; width:30px; text-align:right">Fall:</td>
                      <td> <g:checkBox name="fall" value="${customerInstance?.fall}" /></td>
                    </tr>
                    <tr>
                      <td style="font-weight:bold; width:30px; text-align:right">Spring:</td>
                      <td> <g:checkBox name="spring" value="${customerInstance?.spring}" /></td>
                    </tr>
                    <tr>
                      <td style="font-weight:bold; width:30px; text-align:right">AM:</td>
                      <td> <g:checkBox name="am" value="${customerInstance?.am}" /></td>
                    </tr>
                    <tr>
                      <td style="font-weight:bold; width:30px; text-align:right">PM:</td>
                      <td> <g:checkBox name="pm" value="${customerInstance?.pm}" /></td>
                    </tr>
                  </table>
                </div>

				<div id="assessmentQuestionLower" style="top:220px">
					<img src="${resource(dir:'images', file:'AssessLLC.gif')}" style="float:left" alt="" />
					<img src="${resource(dir:'images', file:'AssessLRC.gif')}" style="float:right" alt="" />
				</div>

               <input type="submit" id="continueAssessment" style="right:50px" value="" />
            </g:form>

        </div>
    </body>
</html>
