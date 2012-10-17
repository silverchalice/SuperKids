<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SuperKids | Sustagrain</title>
    <g:javascript library="jquery" plugin="jquery" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <meta name="layout" content="grain" />
    <meta name="link" content="sustagrain" />

      <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-18800741-2']);
          _gaq.push(['_trackPageview']);

          (function() {
              var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
              ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
              var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
      </script>

  </head>
  <body>
<script type="text/javascript">
    var window1;
    var window2;
    function popUp(htmLoc,width,height,theWindow) {
        var winleft = (screen.width / 2) - (width / 2);
        var wintop = (screen.height / 2) - (height / 2);
        window.open(htmLoc,"mainwindow","top="+wintop+",left="+winleft+",width="+width+",height="+height+",buttons=no,scrollbars=no,location=no,menubar=no,resizable=no,status=no,directories=no,toolbar=no");//YesorNo
    }
</script>
		<div id="content"> ${content}</div>
  </body>
</html>
