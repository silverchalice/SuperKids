package com.superkids.domain

class Caller extends User {

	static hasMany = [calls: Call]

    static constraints = {
		calls(nullable: true)
    }

	String toString() {
		username
	}
}
