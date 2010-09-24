<span class="menuButton"><g:link class="home" action="index"><g:message code="default.home.label"/></g:link></span>
<span class="callerButton" style="margin-left:900px"><g:link controller="call" action="save">Finish Call</g:link></span>
<span class="callerButton"><g:link controller="call" action="next_order_call" id="${customerInstance?.id}" params="${[ offset: offset ]}">Next Customer</g:link></span>
<span class="callerButton"><g:link controller="call" action="prev_order_call" id="${customerInstance?.id}" params="${[ offset: offset ]}">Previous Customer</g:link></span>
