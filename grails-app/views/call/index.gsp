<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="caller" />
    <title>Caller Home</title>
    <g:javascript library="jquery" plugin="jquery"/>
    <jqui:resources/>

    <script type="text/javascript">
        $(document).ready(function() {
            $('.order').button();
            $('.assess').button();
        })
    </script>
</head>
<body>

<div style="margin:0px 0px; border:0; padding:15px 375px;">
    <g:form method="post" controller="call" action="findCustomer">
        Customer: <input type="text" name="query" />
        <input type="submit" value="Go" id="search" />
        <input type="hidden" name="id" value="${customerInstance?.id}">
    </g:form>
</div>
<div class="callerNavBar">
    <g:render template="caller_nav"/>
    <g:link controller="logout" style="float:right; margin-right:40px;" class="callerButton">Logout</g:link>
    <strong style="float:right; margin-right:10px;">Welcome Back ${caller?.username}</strong>

</div>

<div class="body" style="width:100%">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
 <!--   <div style="width:500px; float:left;">
        <g:link class="order" action="start_assess_call" params="[queue:'new']">
            <h1 style="background: url(${resource(dir:'images', file:'/skin/database_add.png')}) center left no-repeat; padding-left:0; font-size:18pt;">
                Start Assess Call<br/> (New Customers)
            </h1>
        </g:link>
    </div> -->

    <g:link class="order" action="start_assess_call" params="[queue:'prev']" style="padding-right:0; margin-right:0; float:left">
    <h1 style="background: url(${resource(dir:'images', file:'/skin/database_add.png')}) center left no-repeat; padding-left:10px; font-size:18pt;">
    Previously Called - Assess
    </h1>
    </g:link>


    <div style="clear:both">&nbsp;</div>

    <div style="width:500px; float:left;">
        <g:link class="order" action="start_order_call" params="[queue:'new']">
            <h1 style="background: url(${resource(dir:'images', file:'/skin/database_add.png')}) center left no-repeat; padding-left:0; font-size:18pt;">
                Start Order Call<br/> (New Customers)
            </h1>
        </g:link>
    </div>


    <g:link class="order" action="start_order_call" params="[queue:'prev']" style="padding-right:0; margin-right:0; float:left">
        <h1 style="background: url(${resource(dir:'images', file:'/skin/database_add.png')}) center left no-repeat; padding-left:10px; font-size:18pt;">
            Previously Called - Order
        </h1>
    </g:link>

    <g:link class="order" action="start_order_call" params="[queue:'top100']" style="padding-right:0; margin-right:0; float:left">
        <h1 style="background: url(${resource(dir:'images', file:'/skin/database_add.png')}) center left no-repeat; padding-left:10px; font-size:18pt;">
            Top 100 - Order
        </h1>
    </g:link>
    <div style="clear:both">&nbsp;</div>


</div>
</body>
</html>
