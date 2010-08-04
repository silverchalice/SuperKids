package com.superkids.domain

class Broker {

    String name
    Address address

    static hasMany = [representatives: BrokerRepresentative]

    static constraints = {
    }
}
