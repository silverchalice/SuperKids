<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SuperKids | Sustagrain</title>

    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <sec:ifLoggedIn>
        <meta name="layout" content="learn" />
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <meta name="layout" content="learn" />
    </sec:ifNotLoggedIn>
    <meta name="link" content="sustagrain" />
    <script type="text/javascript">
    var window1;
    var window2;
    function popUp(htmLoc,width,height,theWindow) {
        var winleft = (screen.width / 2) - (width / 2);
        var wintop = (screen.height / 2) - (height / 2);
        window.open(htmLoc,"mainwindow","top="+wintop+",left="+winleft+",width="+width+",height="+height+",buttons=no,scrollbars=no,location=no,menubar=no,resizable=no,status=no,directories=no,toolbar=no");//YesorNo
    }
</script>
  </head>
  <body>

		<div id="content"> ${content}</div>


  </body>
</html>
