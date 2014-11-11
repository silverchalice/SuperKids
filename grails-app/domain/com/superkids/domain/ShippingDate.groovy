package com.superkids.domain


class ShippingDate {
    String shipDate
    Boolean active
    Integer sortOrder

    static constraints = {
        shipDate nullable:false
        active nullable: true
        sortOrder nullable: true
    }

	String toString() {
		shipDate
	}

}
