package com.superkids.domain

class Admin extends User {

    String firstName
    String lastName
    Date dateCreated
    Date lastUpdated
    Date lastLogin
    String email

    static constraints = {
        lastLogin nullable:true
    }
}