package com.superkids.domain

import java.text.SimpleDateFormat

class ShippingDate {
    Date shipDate

    static constraints = {
        shipDate nullable:false
    }

//    String toString() {
//      SimpleDateFormat format = new SimpleDateFormat("MMMM yyyy")
//      def date = shipDate.toString()
//      format.parse(date)
//    }

}
