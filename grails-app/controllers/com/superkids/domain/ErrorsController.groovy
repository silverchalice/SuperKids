package com.superkids.domain

class ErrorsController {

    def internal_server_error = {
        println "oh nooooooooooooooooes! " + params
        /*log.error "Error ${request.'javax.servlet.error.status_code'}: ${request.'javax.servlet.error.message'}"
	log.error "Servlet: ${request.'javax.servlet.error.servlet_name'}"
        log.error "URI: ${request.'javax.servlet.error.request_uri'}"
        if(exception){
            log.error "Exception Message: ${exception.message}"
            log.error "Caused by: ${exception.cause?.message}"
            log.error "Class: ${exception.className}"
            log.error "At Line: [${exception.lineNumber}]"
            log.error "Code Snippet:"
            exception.codeSnippet?.each { cs ->
                log.error cs
            }
            log.error "Stack Trace:"
            exception.stackTraceLines?.each {
                log.error it
            }
        }*/
        render view: "/error"
    }
}
