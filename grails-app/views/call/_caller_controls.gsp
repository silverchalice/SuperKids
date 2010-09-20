<span class="menuButton"><g:link class="home" action="index"><g:message code="default.home.label"/></g:link></span>
<span class="callerButton" style="margin-left:900px"><g:link controller="call" action="save">Finish Call</g:link></span>
<span class="callerButton"><g:link controller="call" action="get_order_call" id="${customer?.id}" params="${[ offset: 1 ]}">Next Customer</g:link></span>
<span class="callerButton"><g:link controller="call" action="get_order_call" id="${customer?.id}" params="${[ offset: -1 ]}">Previous Customer</g:link></span>
