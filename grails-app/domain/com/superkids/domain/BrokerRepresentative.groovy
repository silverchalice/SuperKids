package com.superkids.domain

class BrokerRepresentative {

    String name
    String title
    String phone
    String email

    static belongsTo = [broker: Broker]

    static constraints = {
    }
}
