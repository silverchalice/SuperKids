package com.superkids.domain


class ShippingDate {
    String shipDate

    static constraints = {
        shipDate nullable:false
    }

	String toString() {
		shipDate
	}

}
