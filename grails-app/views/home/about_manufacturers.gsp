

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
        <title>SuperKids | About The Manufacturers</title>
    </head>
    <body>

		<div id="contentInsetInner">

             ${content}

		</div>

    </body>
</html>
