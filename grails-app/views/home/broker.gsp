

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="broker" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>

           <div id="content">
            <div id="contentInset">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            ${content}
        </div>
       <div id="contentFooter">
      <img id="contentFooterBL" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/>
      <img id="contentFooterBR" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/>

      </div>
     </div>
    </body>
</html>
