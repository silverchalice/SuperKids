package com.superkids

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class UserService {

    def bindParams(params) {

        if(params.hasBakery == 'NA') {
            params.hasBakery = null
        }
        if(params.useUltragrainFlour == 'NA') {
            params.useUltragrainFlour = null
        }
        if(params.useUltragrainWhiteFlour == 'NA') {
            params.useUltragrainWhiteFlour = null
        }
        if(params.interestedInMixes == 'NA') {
            params.interestedInMixes = null
        }
        if(params.addedPastItemsToMenu == 'NA') {
            params.addedPastItemsToMenu = null
        }
        if(params.lookForUltragrain == 'NA') {
            params.lookForUltragrain = null
        }

        println params

        return params
    }
}
