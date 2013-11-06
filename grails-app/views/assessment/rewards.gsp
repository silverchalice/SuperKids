

<%@ page import="com.superkids.domain.Assessment" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess_landing" />
        <g:set var="entityName" value="${message(code: 'assessment.label', default: 'Assessment')}" />
        <title>Thank You! | SuperKids</title>
    </head>
    <body>
    <div id="content-container">
        <div id="content">
             <h1>Rewards For Completing Your Assessment</h1>

                <p>
                Thank You! Your assessment has been received, qualifying you for the sweepstakes prize drawing.
              </p>

                <ol style="list-style-type:decimal">
                <li>ONE (1) Grand Prize--$2,000 Donation to winning FSD’s school foodservice program</li>
                <li>TEN (10) First Place Prizes--$100 Gift Card from your choice of Wal-Mart, Target, Learning ZoneXpress, or The OrganWise Guys</li>
                </ol>
                <p>Please note that you are responsible for ensuring that any rewards provided to you within this program are authorized by your school district.
                Click sweepstakes rules for more information. <g:link controller="home" action="assessment_drawing_rules">Sweepstakes Rules</g:link>    </p>

            <div style="clear: both; width: 890px; margin: 0 auto; padding-top: 20px">
                <hr />
                <a href="${createLink(controller: 'home', action: 'index')}" title="Home page" class="btn arrow"><span>Return to the Home Page</span></a>
            </div>

        </div>
       </div>

    </body>
</html>
