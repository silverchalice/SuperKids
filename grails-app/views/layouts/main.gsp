<html>
    <head>
        <title>SuperKids | Administrative Dashboard</title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo" style="height:75px;"><g:link controller="home"><img style="float:left" src="${resource(dir:'images/layout',file:'AdminLogo.jpg')}" alt="SuperKids" border="0" /></g:link>
            <h1>Super Kids Administrative Dashboard</h1>
        </div>
                <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Adminstrative Tools</h1>
                    <ul>
                        <li><g:link controller="contactRequest">Manage Contact Requests</g:link></li>
                        <li><g:link controller="ecard">View eCards</g:link></li>
                        <li><g:link controller="customer">Manage School Districts</g:link></li>
                        <li><hr /></li>
                        <li><g:link controller="sponsor">Manage Sponsors</g:link></li>
                        <li><g:link controller="product">Manage Products</g:link></li>
                    </ul>

                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <g:layoutBody />
    </body>
</html>