<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>SuperKids | Sustagrain</title>
    <g:javascript library="jquery" plugin="jquery" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
    <meta name="layout" content="learn" />
    <meta name="link" content="sustagrain" />
  </head>
  <body>
      <g:if test="${flash.message}">
          <div class="message">${flash.message}</div>
      </g:if>
      <div id="contentInsetInner">
          ${content}
      </div>

  </body>
</html>
