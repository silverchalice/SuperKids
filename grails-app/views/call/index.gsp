<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="caller" />
<title>Caller Home</title>
</head>
<body>
    <div class="nav">
    	<span class="menuButton"><g:link class="home" action="index"><g:message code="default.home.label"/></g:link></span>
        <span class="menuButton"><g:link class="list" action="start_order_call"><g:message code="default.caller.start.label" default="Start Order Call"/></g:link></span>
        <span class="menuButton"><g:link class="list" action="start_assess_call"><g:message code="default.caller.start.label" default="Start Assessment Call"/></g:link></span>
        <span class="menuButton"><g:link class="list" action="order_list"><g:message code="default.caller.start.label" default="Order Call List"/></g:link></span>
        <span class="menuButton"><g:link class="list" action="assess_list"><g:message code="default.caller.start.label" default="Assessment Call List"/></g:link></span>
        <span class="menuButton"><g:link class="list" action="call_back_list"><g:message code="default.caller.start.label" default="Call Back List"/></g:link></span>
	</div>

	<div class="body">
		<div class="dialog">
            <h1>Welcome Back ${caller?.username}</h1>
		</div>
    </div>
</body>
</html>
