<html>
    <head>
        <title>SuperKids | Administrative Dashboard</title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <export:resource />
        <g:javascript library="application" />
        <g:javascript library="jquery" plugin="jquery"/>
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo" style="height:75px;"><g:link controller="home"><img style="float:left" src="${resource(dir:'images/layout',file:'AdminLogo.jpg')}" alt="SuperKids" border="0" /></g:link>
            <h1 style="font-size:32px;">Super Kids Administrative Dashboard</h1>
        </div>
                <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">

                    <ul>
                        <li><h1>Adminstrative Tools</h1></li>
                        <li><g:link controller="pageText" action="list">Update Page Content</g:link></li>
                        <li><g:link>Update Factoids</g:link></li>
                        <li><hr /></li>
                        <li><g:link controller="contactRequest">Contact Requests</g:link></li>
                        <li><g:link controller="ecard">View eCards Sent</g:link></li>
                        <li><hr /></li>
                        <li><g:link controller="customer">Update Users</g:link></li>
                        <li><g:link controller="customer">Manage School Districts</g:link></li>
                        <li><hr /></li>
                        <li><g:link controller="order">Order Admin</g:link></li>
                        <li><g:link controller="product">Products Admin</g:link></li>
                        <li><g:link controller="assessment">Assessment Admin</g:link></li>
                        <li><g:link controller="sponsor">Sponsors Admin</g:link></li>
                        <li><hr /></li>
                        <li><h1>Caller Module</h1></li>
                        <li><g:link controller="caller">Manage Callers</g:link></li>
                        <li><g:link controller="call">View Calls</g:link></li>
                        <li><hr /></li>
                        <li><sks:formats formats="['excel']" msg="Download Excel" /></li>
                        <li><sks:formats formats="['excel']" msg="Download Excel (with no assessments)" /></li>
                        <li><hr /></li>
                        <li><g:link>Change Password</g:link></li>
                        <li><g:link controller="logout">Logout</g:link></li>
                    </ul>

                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <g:layoutBody />
    </body>
</html>
