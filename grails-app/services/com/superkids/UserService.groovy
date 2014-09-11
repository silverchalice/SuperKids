package com.superkids

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class UserService {

    def bindParams(params) {

        if(params.contractManaged == "NA") {
            params.contractManagedNA = true
            params.contractManaged = false
        }
        if(params.coOpMember == 'NA') {
            params.coOpMemberNA = true
            params.coOpMember = false
        }
        if(params.coOpSamples == 'NA') {
            params.coOpSamplesNA = true
            params.coOpSamples = false
        }
        if(params.hasBakery == 'NA') {
            params.hasBakeryNA = true
            params.hasBakery = false
        }
        if(params.useUltragrainFlour == 'NA') {
            params.useUltragrainFlourNA = true
            params.useUltragrainFlour = false
        }
        if(params.buyCommodityFlour == 'NA') {
            params.buyCommodityFlourNA = true
            params.buyCommodityFlour = false
        }
        if(params.addedPastItemsToMenu == 'NA') {
            params.addedPastItemsToMenuNA = true
            params.addedPastItemsToMenu = false
        }
        if(params.participateInRewardsPrograms == 'NA') {
            params.participateInRewardsProgramsNA = true
            params.participateInRewardsPrograms = false
        }

        println params

        return params
    }
}
