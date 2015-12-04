

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
             <h1>Thank You For Completing Your Assessment</h1>

                <p>
                    Thank you for filling out our assessment form!  Remember, your feedback is invaluable. It not only lets us know how to improve our SuperKids program, it helps manufacturers better understand your needs.
                </p>

            <div style="clear: both; width: 890px; margin: 0 auto; padding-top: 20px">
                <hr />
                <a href="${createLink(controller: 'home', action: 'index')}" title="Home page" class="btn arrow"><span>Return to the Home Page</span></a>
            </div>

        </div>
       </div>

    </body>
</html>
