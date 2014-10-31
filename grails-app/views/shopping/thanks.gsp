

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="cart" />
        <title>SuperKids | Thank You</title>
    </head>
    <body>
    <div id="content-container">
        <ol id="order-process">

            <li class="one complete"><a href="#"><span class="gradient">1</span> Review Your Order</a></li>
            <li class="two complete"><a href="#"><span>2</span> Provide Shipping Address</a></li>
            <li class="three complete"><a href="#"><span>3</span> Place Your Free Order</a></li>

        </ol>
        <div id="content">
		    ${content}
		</div>
        <div style="clear: both; width: 890px; margin: 0 auto; padding-top: 20px">
            <hr />
            <a href="${createLink(controller: 'home', action: 'index')}" title="Home page" class="btn arrow"><span>Return to the Home Page</span></a>
        </div>
        </div>
    </body>
</html>
