<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Superkids Sampling</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'public.css')}" media="screen" />
     <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <meta name="layout" content="learn" />

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
    <script> 
        var window1;
        var window2;
        function popUp(htmLoc,width,height,theWindow) {
            var winleft = (screen.width / 2) - (width / 2); // center the window right to left
            var wintop = (screen.height / 2) - (height / 2); // center the window top to bottom
            window.open(htmLoc,"mainwindow","top="+wintop+",left="+winleft+",width="+width+",height="+height                  +",buttons=no,scrollbars=no,location=no,menubar=no,resizable=no,status=no,directories=no,toolbar=no");//YesorNo
}
</script> 
</head>
  <body>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
  		<div id="contentInsetInner">${content}</div>

  </body>
</html>
