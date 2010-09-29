package com.superkids.domain


class ShippingDate {
    String shipDate

    static constraints = {
        shipDate nullable:false, inList:['November, 2010','January, 2011']
    }

	String toString() {
		shipDate
	}

}
