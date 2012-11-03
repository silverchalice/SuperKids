package com.superkids.domain


class ShippingDate {
    String shipDate
    Boolean active

    static constraints = {
        shipDate nullable:false
        active nullable: true
    }

	String toString() {
		shipDate
	}

}
