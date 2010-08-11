package com.superkids.domain

class Caller {


	String name
    User user

	static hasMany = [calls: Call]

    static constraints = {
    }
}
