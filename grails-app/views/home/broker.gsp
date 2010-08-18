

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public" />
        <title>You landed on: The Landing Page.</title>
    </head>
    <body>
        <div class="body" class="dialog">
           <div id="content">
            <div id="contentInset">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <h1>SuperKids Program Overview</h1>
            <img width="160" hspace="8" height="442" align="right" src="${request.contextPath}/images/NEWGIRLeatingpizzaVERTICAL.jpg" alt="">
            <p>SuperKids gives foodservice directors free samples of whole grain products from a variety of trusted food companies and bakeries. All products are made with Ultragrain<sup>® </sup>and/or Sustagrain<sup>®</sup>. Sample products are free and come with no purchase obligation.</p>
            <p>SuperKids asks for foodservice director feedback on how they liked the products. This feedback (in the form of trial assessment data) will be used by our food manufacturers to develop new products. In addition, we use it to report demand to foodservice distributors and brokers like you.</p>
            <p><strong>We can prove high acceptance of whole grain products in our nation's schools.</strong> SuperKids is in its fourth year. Last year, over 1,284 of the largest public school districts in America requested and received 6,079 product samples from a pool of 16 products made with Ultragrain. In independent studies, elementary school students consumed products made with Ultragrain at the same levels as products made with refined flour. The difference is Ultragrain's taste, look and texture. It's revolutionary, innovative, and a major technological breakthrough.</p>
            <p><strong>Ultragrain: Whole Grain Nutrition. White Flour Appeal.</strong> Ultragrain makes it possible for students to receive higher amounts of fiber, along with the full nutritive value of whole grains in foods they are familiar with and love. With Ultragrain, students don't notice changes in color, taste or texture that they often complain about when eating foods that use traditional whole grain flour.</p>
            <p><strong>Sustragrain: The Ultra High-Fiber Whole Grain.</strong> SuperKids products made with Sustagrain offer another way to increase whole grain and fiber consumption in school lunches. In flour form, Sustagrain can be used in baked goods, meat preparations, sauces and dips. In flake form, it works great in hot cereals, snacks, desserts and toppings. <strong>Select your choice from the menu options on the left.</strong></p>
        </div>
       <div id="contentFooter"> 
      <img id="contentFooterBL" src="/SuperKids/images/layout/contentFooter-bl-bg.gif"/> 
      <img id="contentFooterBR" src="/SuperKids/images/layout/contentFooter-br-bg.gif"/> 
      </div>
     </div>
    </body>
</html>
