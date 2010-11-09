

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="movie" />
        <g:javascript src="swfobject.js" />
        <g:javascript src="flexcroll.js" />
        <g:javascript src="Menu.js" />
        <title>SuperKids</title>
    </head>
    <body>
        <div ID="flashcontent"></div> 
        <script type="text/javascript"> 
                // <![CDATA[
                var so = new SWFObject("${resource(dir:'flash', file:'sk_static.swf')}", "movie", "655", "505", "8", "#FFFFFF");
                so.addParam("scale", "noscale");
                so.write("flashcontent");
                // ]]>
        </script>
        <g:if test="${flash.message}">
        <script>alert('${flash.message}'); </script>
        </g:if>
    </body>
</html>
