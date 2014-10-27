package com.superkids

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class UserService {

    def bindParams(params) {

        if(params.contractManaged == "NA") {
            params.contractManaged = null
        }
        if(params.coOpMember == 'NA') {
            params.coOpMember = null
        }
        if(params.hasBakery == 'NA') {
            params.hasBakery = null
        }
        if(params.useUltragrainFlour == 'NA') {
            params.useUltragrainFlour = null
        }
        if(params.useUltragrainWhiteFlour == 'NA') {
            params.useUltragrainWhiteFlour = null
        }
        if(params.buyCommodityFlour == 'NA') {
            params.buyCommodityFlour = null
        }
        if(params.likesBagHandles == 'NA') {
            params.likesBagHandles = null
        }
        if(params.addedPastItemsToMenu == 'NA') {
            params.addedPastItemsToMenu = null
        }
        if(params.participateInRewardsPrograms == 'NA') {
            params.participateInRewardsPrograms = null
        }
        if(params.participateInCoolSchoolCafe == 'NA') {
            params.participateInCoolSchoolCafe = null
        }
        if(params.lookForUltragrain == 'NA') {
            params.lookForUltragrain = null
        }

        println params

        return params
    }
}
