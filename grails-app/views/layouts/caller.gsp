<html>
    <head>
        <title>SuperKids | Administrative Dashboard</title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
 		<g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources/>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#search').button();
				$('.callerButton').button();
			});
		</script>
    </head>
    <body>
        <div style="margin:0px 0px; border:0; padding:15px 375px;">
            <g:form method="post" controller="call" action="findCustomer">
                Customer: <input type="text" name="query" />
                <input type="submit" value="Go" id="search" />
            </g:form>
        </div>
        <g:layoutBody />
    </body>
</html>
