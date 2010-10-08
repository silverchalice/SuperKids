<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="caller" />
<title>Caller Home</title>
</head>
<body>
    <div class="nav">
    	<g:render template="caller_nav"/>
		<strong style="margin-left:200px;">Welcome Back ${caller?.username}</strong>
		<span class="callerButton"><g:link controller="logout">Logout</g:link></span>
	</div>

	<div class="body">
		<g:link class="order" action="start_order_call">
			<h1 style="background: url(${resource(dir:'images', file:'/skin/database_add.png')}) center left no-repeat; padding-left:20px; font-size:16pt;">
				<g:message code="default.caller.start.label" default="Start Order Call"/>
			</h1>
		</g:link>

		<g:link class="assess" action="start_assess_call">
			<h1 style="background: url(${resource(dir:'images', file:'/skin/database_add.png')}) center left no-repeat; padding-left:20px; font-size:16pt;">
					<g:message code="default.caller.start.label" default="Start Assess Call"/>
			</h1>
		</g:link>



    </div>
</body>
</html>
