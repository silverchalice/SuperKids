import com.superkids.domain.User
import com.superkids.domain.Role
import com.superkids.domain.UserRole

class SecurityFilters {

    def springSecurityService

    def filters = {

        checkPassword(controller:"home", action:"(c_change_password|c_password)", invert:true){
            before = {
                 if(springSecurityService.isLoggedIn()){
                    def ur = Role.findByAuthority("ROLE_USER")
                    def ar = Role.findByAuthority("ROLE_ADMIN")
                    def loggedInUser = User.get(springSecurityService.principal?.id)
                    def pass = springSecurityService.encodePassword("superkids")
                    if(!UserRole.findByUserAndRole(loggedInUser, ar) && UserRole.findByUserAndRole(loggedInUser, ur)){
                        if(loggedInUser.password == pass){
                            flash.message = "Please enter a new password."
                            log.info flash.message
                            redirect controller:"home", action:"c_change_password"
                            return false
                        } else if(loggedInUser.usingResetPassword) {
                            flash.message = "Please enter a new password."
                            log.info flash.message
                            redirect controller:"home", action:"c_change_password"
                            return false
                        }
                    }
                }
            }
        }

        product(controller:"product", action:"(edit|delete|create|save)") {
          before = {
            if(springSecurityService.loggedIn){
              def user = User.get(springSecurityService.principal.id)
              if(!user.isAdmin()){
                flash.message = "Access denied."
                redirect(controller:"home", action:"index")
                return false
              }            
              return true
            } else {
              flash.message = "Please login.."
              redirect(controller:"home", action:"index")
              return false
            }
          }
        }

    }
}

