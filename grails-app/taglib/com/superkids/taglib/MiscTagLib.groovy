package com.superkids.taglib

import com.superkids.domain.Customer

class MiscTagLib {

    def springSecurityService

    static namespace = 'sks'

    def hasPlacedCurrentOrder = { attrs, body ->
        def customer = Customer.get(springSecurityService.principal.id)
        if(customer?.hasPlacedCurrentOrder){
            out << body()
        } else { out << "" }
    }

}
