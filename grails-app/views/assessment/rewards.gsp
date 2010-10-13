

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
                  <ul>
                      <li>Reward 1. TWO (2) First Place Prizes – $1,000 for travel expenses and registration fees for SNA or other foodservice show in 2010.</li>
                      <li>Reward 2. THREE (3) Second Place Prizes – Three “OrganWise Guys Foods of the Month Club Kits,” which you can use as an educational resource in three of your school district cafeterias ($885 value).</li>
                      <li>Reward 3. FIVE (5) Third Place Prizes – A $200 gift card from your choice of Wal-Mart, Target, Apple, Learning ZoneXpress, or the OrganWise Guys.</li>
                      <li>Reward 4. TEN (10) Fourth Place Prizes – A $100 gift card from your choice of Wal-Mart, Target, Apple, Learning ZoneXpress, or the OrganWise Guys.</li>
                      <li>Reward 5. THIRTY-THREE (33) Fifth Place Prizes – Missy Lapine’s Sneaky Chef paperback ($16 value).</li>
                  </ul>
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
