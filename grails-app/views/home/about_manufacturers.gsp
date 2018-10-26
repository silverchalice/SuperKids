<%@ page import="com.superkids.domain.Sponsor; com.superkids.domain.Customer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="about"/>

    <title>SuperKids | About The Manufacturers</title>

    <g:render template="/includes/google_analytics" />
</head>

<body>


<div id="content">

    ${content}


    <g:each in="${com.superkids.domain.Sponsor.findAllByInactive(false, [sort: 'name'])}" var="sponsor">
        <div class="sponsorListItem">
            ${sponsor.description}
        </div>
        <hr/>
    </g:each>
</div>

</body>
</html>
