

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="broker" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>
        <div class="body" class="dialog">
           <div id="content">
            <div id="contentInset">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <h1>Benefits of Whole Grains</h1>
            <img width="207" height="266" align="right" src="${request.contextPath}/images/SATStethoscope.jpg" />
            <p><strong>The most documented benefits</strong> of whole grain consumption are:</p>

            <ul>
              <li>Better weight management</li>
              <li>Type 2 diabetes risk reduced 21-30%</li>
              <li>Stroke risk reduced 30-36%</li>
              <li>Heart disease risk reduced 25-28%</li>
            </ul>

            <p><strong>Other benefits</strong> indicated by recent studies include:</p>

            <ul>
              <li>Reduced risk of asthma</li>
              <li>Less gum disease and tooth loss</li>
              <li>Healthier carotid arteries</li>
              <li>Reduction of inflammatory disease risk</li>
              <li>Lower risk of colorectal cancer</li>
              <li>Healthier blood pressure levels</li>
            </ul>

            <p>Select Whole Grains & Human Health for recent health studies.  (Source: The Whole Grains Council)</p>
</p>
        </div>
       <div id="contentFooter"> 
      <img id="contentFooterBL" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/> 
      <img id="contentFooterBR" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/> 
      </div>
     </div>
    </body>
</html>
