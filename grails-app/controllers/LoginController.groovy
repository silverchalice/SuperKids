import org.springframework.security.core.context.SecurityContextHolder as SCH

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter

class LoginController {

	/**
	 * Dependency injection for the authenticationTrustResolver.
	 */
	def authenticationTrustResolver
    def config = SpringSecurityUtils.securityConfig
	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService

	/**
	 * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
	 */
	def index = {
		println "entering login:index"
		if (springSecurityService.isLoggedIn()) {
			//redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
                        redirect controller:"home", action:"index"
		}
		else {
			redirect action: auth, params: params
		}
	}

	/**
	 * Show the login page.
	 */
	def auth = {
		println "entering login:auth"
		session.current_view = "auth"


		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}

		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		 [postUrl: postUrl, rememberMeParameter: config.rememberMe.parameter]
	}

	def demo = {
		println "entering login:demo"
		session.current_view = "demo"
		def config = SpringSecurityUtils.securityConfig

		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}

		String view = 'demo'
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view: view, model: [postUrl: postUrl, rememberMeParameter: config.rememberMe.parameter]
	}

	/**
	 * Show denied page.
	 */
	def denied = {
		println "entering login:denied"
		log.info "hit denied action"
		redirect uri:"/"
                /*if (springSecurityService.isLoggedIn() &&
				authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
			// have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
			redirect action: full, params: params
		}*/
	}

	/**
	 * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
	 */
	def full = {
		println "entering login:full"
		def config = SpringSecurityUtils.securityConfig
		render view: 'auth', params: params,
		model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
				postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
	}

	/**
	 * Callback after a failed login. Redirects to the auth page with a warning message.
	 */
	def authfail = {
		println "entering login:authfail"

        println "User login attempt failed "
        flash.message = "Sorry, we don't recognize that username and password"
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view:'auth',  model: [postUrl: postUrl]
	}

	/**
	 * The Ajax success redirect url.
	 */
	def ajaxSuccess = {
		println "entering login:ajaxSuccess"
		render([success: true, username: springSecurityService.authentication.name] as JSON)
	}

	/**
	 * The Ajax denied redirect url.
	 */
	def ajaxDenied = {
		println "entering login:ajaxDenied"
		render([error: 'access denied'] as JSON)
	}

   def admin_login = {

		println "entering login:admin_login"

		session.current_view = "admin_login"

		def config = SpringSecurityUtils.securityConfig

		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}

		String view = 'admin_login'
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view: view, model: [postUrl: postUrl,
						   	rememberMeParameter: config.rememberMe.parameter]
   }

   def caller_login = {
		println "entering login:caller_login"

		session.current_view = "caller_login"

		def config = SpringSecurityUtils.securityConfig

		if (springSecurityService.isLoggedIn()) {
			redirect uri: config.successHandler.defaultTargetUrl
			return
		}

		String view = 'caller_login'
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		render view: view, model: [postUrl: postUrl,
							   rememberMeParameter: config.rememberMe.parameter]
   }

}
