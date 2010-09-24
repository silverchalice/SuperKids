package com.superkids.domain

class Admin extends User {

    String name
    Date dateCreated
    Date lastUpdated
    Date lastLogin

    static constraints = {
        lastLogin nullable:true
    }
}
