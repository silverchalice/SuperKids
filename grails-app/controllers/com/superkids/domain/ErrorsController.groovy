package com.superkids.domain

class ErrorsController {

    def mailService

    def internal_server_error = {
        println "oh nooooooooooooooooes!"
        mailService.sendMail {
            to "ben@silver-chalice.com","zak@silver-chalice.com"
            from "superkidssampling@gmail.com"
            subject "[SuperKids] An error occurred"
            html g.render(template:"/errors/error500")
        }
        render view:"/error"
    }
}
