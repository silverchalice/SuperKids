package com.superkids.domain


class ShippingDate {
    Date shipDate

    static constraints = {
        shipDate nullable:false
    }

    String toString() {
      shipDate.format('MMMM, yyyy')
    } 

}
