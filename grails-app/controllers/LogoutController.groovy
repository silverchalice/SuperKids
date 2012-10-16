import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import com.superkids.domain.Customer
import com.superkids.domain.CustomerStatus

class LogoutController {

	/**
	 * Index action. Redirects to the Spring security logout uri.
	 */
    def springSecurityService

        def index = {

            println "entering login:index"
            def user = Customer.get(springSecurityService.principal.id)

            if(user && user.email == 'demo') {
                println "found demo user..."
                user.with {
                    status = CustomerStatus.HAS_NOT_ORDERED
                    hasPlacedCurrentOrder = false
                    hasCompletedCurrentAssessment = false
                }

                user.assessments.each { assessment ->
                    user.removeFromAssessments(assessment)
                    assessment.delete()
                }

                def order = user.customerOrder

                if(order) {
                    user.customerOrder = null
                    order.delete()
                }

                if(!user.save()) {
                    user.errors.allErrors.each { println it }
                }

            }

     // TODO  put any pre-logout code here
		redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'

	}
}
