

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <sec:ifLoggedIn>
        <meta name="layout" content="customer" />
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <meta name="layout" content="public" />
    </sec:ifNotLoggedIn>
        <meta name="link" content="about" />
        <title>SuperKids | About SuperKids</title>
    </head>
    <body>
		<div id="contentInsetInner">

			<div style="width:620px;">
                ${content}

				</div>


		</div>
	</body>
</html>
