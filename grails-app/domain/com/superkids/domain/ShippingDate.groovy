package com.superkids.domain


class ShippingDate {
    String shipDate
    Boolean active
    Date lastUpdated

    static constraints = {
        shipDate nullable:false
        active nullable: true
    }

	String toString() {
		shipDate
	}

}
