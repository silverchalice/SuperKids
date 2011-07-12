

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="order" />
        <title>SuperKids | Order</title>
		<style type="text/css">
			#contentInsetUpper {
				width:492px;
				left:419px;

			}

			#contentInsetInner {
				width:472px;
				position:relative;
				left:150px;
			}

			#contentInsetLower {
				width:492px;
				left:419px;
			}
		</style>
    </head>
    <body>

           <g:if test="${flash.message}">
               <div class="message">${flash.message}</div>
           </g:if>
		 <div id="orderSideNav">
			 <g:link controller="testShoppingCart" class="viewCartButton" action="show" style="position:absolute; top:52px; left:20px; height:40px; width:160px; text-decoration:none">&nbsp;</g:link>
		 </div>
         <div id="contentInsetInner">${content}</div>
    </body>
</html>
