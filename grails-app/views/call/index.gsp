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
        <span class="menuButton"><g:link class="list" action="start"><g:message code="default.caller.start.label" default="Start Call"/></g:link></span>
	</div>

	<div class="body">
		<div class="dialog">
            <h1>Welcome Back ${caller?.username}</h1>
		</div>
    </div>
</body>
</html>