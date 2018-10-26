

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="assess" />
        <meta name="link" content="assessment_tools" />
        <title>SuperKids | Assessment Tools & Resources</title>
        <g:render template="/includes/google_analytics"/>
    </head>
    <body>

    <div id="content">

         	  <h1>Assessment Tools & Resources</h1>

              <div style="float:right; margin-left:50px;">
              <img src="${resource(dir:'images', file:'girleating.jpg')}" id="girleating" /></div>
              <p style="font-size:13px;">You can download the following by clicking on your choice. These tools and resources can be used when conducting in-school taste tests of your SuperKids whole grain product samples:</p>
              <br />
              <p style="font-size:13px"><g:link controller="home" action="minnesota_form">University of Minnesota Module</g:link> - Includes whole grain definitions, nutritional and labeling information.</p>  <br />
              <p style="font-size:13px"><g:link controller="home" action="assessment_form">Printable Assessment Form</g:link> - Download and print the assessment form. When complete, just fax or mail to the fax number or address provided.</p>  <br />
              <p style="font-size:13px"><g:link controller="home" action="student_form">Student Feedback Form</g:link> - This form was developed for use with younger students (K-3).</p>  <br />
              <p style="font-size:13px"><g:link controller="home" action="student_certificate">Student Certificate</g:link> - Download and print it, then give it to student taste-testers to recognize them for participating as a SuperKid.</p> 

      </div>

    </body>
</html>
