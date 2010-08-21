<html>
    <head>
        <title>SuperKids | Administrative Dashboard</title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <export:resource />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo" style="height:75px;"><g:link controller="home"><img style="float:left" src="${resource(dir:'images/layout',file:'AdminLogo.jpg')}" alt="SuperKids" border="0" /></g:link>
            <h1 style="font-size:32px;">Super Kids Caller Dashboard</h1>
        </div>

        <g:layoutBody />
    </body>
</html>
