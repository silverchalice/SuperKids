<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
    <head>
        <title>SuperKids | Calller Module</title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
 		<g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources/>

		<script type="text/javascript">
			$(document).ready(function() {
				$('#search').button();
				$('.callerButton').button();
				$('.buttonCell a').button();
			});
		</script>
        <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-10797669-2"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-10797669-2');
</script>
    </head>
    <body>
%{--        <div style="margin:0px 0px; border:0; padding:15px 375px;">
            <g:form method="post" controller="call" action="findCustomer">
                Customer: <input type="text" name="query" />
                <input type="submit" value="Go" id="search" />
				<input type="hidden" name="id" value="${customerInstance?.id}">
            </g:form>
        </div>--}%
        <g:layoutBody />
    </body>
</html>
