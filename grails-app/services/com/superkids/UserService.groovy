package com.superkids

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
        if(params.addedPastItemsToMenuA == 'NA') {
            params.addedPastItemsToMenuA = null
        }
        if(params.lookForUltragrain == 'NA') {
            params.lookForUltragrain = null
        }
        if(params.buyCommodityFlour == 'NA') {
            params.buyCommodityFlour = null
        }
        if(params.bakingChallenges == 'NA') {
            params.bakingChallenges = null
        }

        println """bindParams: 
        hasBakery: ${params.hasBakery}
        useUltragrainFlour: ${params.useUltragrainFlour}
        useUltragrainWhiteFlour: ${params.useUltragrainWhiteFlour}
        interestedInMixes: ${params.interestedInMixes}
        addedPastItemsToMenu: ${params.addedPastItemsToMenu}
        addedPastItemsToMenuA: ${params.addedPastItemsToMenuA}
        lookForUltragrain: ${params.lookForUltragrain}
        buyCommodityFlour: ${params.buyCommodityFlour}
        bakingChallenges: ${params.bakingChallenges}
        """

        return params
    }
}
