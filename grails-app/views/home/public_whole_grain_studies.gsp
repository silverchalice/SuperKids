

<%@ page import="com.superkids.domain.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="public_li" />
        <meta name="link" content="public_whole_grain_studies" />
        <title>SuperKids | Whole Grains & Human Health</title>
    </head>
    <body>
		<g:javascript library="jquery" plugin="jquery"/>
		<jqui:resources />
		<style type="text/css">
			.ui-dialog-titlebar { display:none; }
			.ui-widget-content { background:#FEEBA7 }
		</style>

		<script type="text/javascript">
			jQuery.noConflict();
			
			jQuery(document).ready(function() {
				var width = jQuery(document).width() / 2;
				jQuery('.PopUpClass').dialog({
					autoOpen:false,
					width:460,
					position:[width, 370]
				});
			});

			function openPopUp(id) {
				var popUp = '#PopUp' + id
				jQuery(popUp).dialog('open');
			}

			function closePopUp(id) {
				var popUp = '#PopUp' + id
				jQuery(popUp).dialog('close');
			}

			</script>

				<div id="content"> ${content}</div>

    </body>
</html>
