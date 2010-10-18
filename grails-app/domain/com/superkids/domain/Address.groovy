package com.superkids.domain

class Address {

    String street
    String street2
    String city
    String state
    String zip

    static belongsTo = [customer: Customer, sponsor: Sponsor]

    static constraints = {
        street(nullable:false)
        street2(nullable:true)
        city(nullable:false)
        state nullable:false
        zip(nullable:false)
        customer(nullable:true)
        sponsor(nullable:true)
    }


    String toString(){
        "$street ${street2 == null ? " " : street2} $city, $state $zip"
    }          

}
