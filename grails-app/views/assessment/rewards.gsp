

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>Product Assessment | SuperKids</title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assessmentInstance}">
            <div class="errors">
                <g:renderErrors bean="${assessmentInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="finish" >
                <g:hiddenField name="id" value="${assessmentInstance?.id}" />
                <g:hiddenField name="version" value="${assessmentInstance?.version}" />
                <div class="dialog"><br />
                <h1>Rewards For Completing Your Assessment</h1>
                  <p>
                  <h2>Thank You!</h2>
                  Your assessment has been received, qualifying you for the sweepstakes prize drawing.
                  <ol style="list-style-type:decimal; font-size:10px;">  <li><span style="color:#800000">FIVE (5) First Place Prizes</span>--&#36;200 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>  <li><span style="color:#800000">SEVEN (7) Second Place Prizes</span>--&#36;100 Gift Card from your choice of Wal-Mart, Target, Learning Zone Xpress, or the OrganWise Guys</li>  </ol>
                  Please note that you are responsible for ensuring that any rewards provided to you within this program are authorized by your school district. Click sweepstakes rules for more information. <a href="#">Sweepstakes Rules</a>
                  </p>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="Continue" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
