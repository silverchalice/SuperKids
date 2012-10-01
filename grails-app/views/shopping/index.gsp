<%@ page import="com.superkids.domain.Product" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="cart" />
</head>
<body>

<div id="content-container" style="width: 960px">
    <ol id="order-process">
        <sks:hasNotPlacedCurrentOrder>
            <li class="one active"><a href="#"><span class="gradient">1</span> Review Your Order</a></li>
            <li class="two complete"><a href="${createLink(controller: 'product', action: 'check_out')}"><span>2</span> Provide Shipping Address</a></li>
            <li class="three complete"><a href="#"><span>3</span> Place Your Free Order</a></li>
        </sks:hasNotPlacedCurrentOrder>
        <sks:hasPlacedCurrentOrder>
            <li class="one"><a href="#"><span class="gradient">1</span> Review Your Order</a></li>
            <li class="two"><a href="#"><span>2</span> Provide Shipping Address</a></li>
            <li class="three"><a href="#"><span>3</span> Place Your Free Order</a></li>
        </sks:hasPlacedCurrentOrder>

    </ol>
<div id="content">
    <h1>Your Order</h1>

    <sks:hasNotPlacedCurrentOrder>
        <g:render template="/shopping/shoppingCartContent"/>

    </sks:hasNotPlacedCurrentOrder>
    <sks:hasPlacedCurrentOrder>
        <sks:orderList />
    </sks:hasPlacedCurrentOrder>

</div>
    <hr />
    <a href="${createLink(controller: 'home', action: 'order')}">&laquo; Back to Samples</a>
    <sks:hasNotPlacedCurrentOrder>
        <a href="${createLink(controller: 'product', action: 'check_out')}" title="Move to the next step" class="btn arrow"><span>Finish Order</span></a>
    </sks:hasNotPlacedCurrentOrder>
</div>


</body>
</html>
