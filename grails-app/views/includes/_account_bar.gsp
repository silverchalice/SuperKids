<sec:ifNotLoggedIn>
      <span><g:link controller="login" action="auth" style="float: right; padding: 0">Log In</g:link></span>
  </sec:ifNotLoggedIn>
  <sec:ifLoggedIn>

      <a href="${createLink(controller: 'shopping', action: 'index')}" class="order" title="Review your order and check out">Your Order <sks:itemsInCart /></a> <span class="sep">|</span> <g:link controller="home" action="edit_profile" title="Review and edit your account email">Your Account</g:link> <span class="sep">|</span> <g:link controller="logout" action="index" title="Log in to your account to order">Log Out</g:link>
  </sec:ifLoggedIn>
