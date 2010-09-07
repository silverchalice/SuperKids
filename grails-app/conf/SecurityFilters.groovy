class SecurityFilters {

    def springSecurityService

    def filters = {

        product(controller:"product", action:"(edit|delete|list|create|save)") {
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

