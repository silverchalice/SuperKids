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
    <div class="callerNavBar">
    	<g:render template="caller_nav"/>
      <g:link controller="logout" style="float:right; margin-right:40px;" class="callerButton">Logout</g:link>
		<strong style="float:right; margin-right:10px;">Welcome Back ${caller?.username}</strong>

	</div>

	<div class="body" style="width:100%">
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
		<div style="width:300px;">
			<g:link class="assess" action="start_assess_call" params="[queue:'new']">
				<h1 style="background: url(${resource(dir:'images', file:'/skin/database_add.png')}) center left no-repeat; padding-left:10px; margin-left:0; font-size:18pt;">
					Start Assess Call
				</h1>
			</g:link>
		</div>

    </div>
</body>
</html>
