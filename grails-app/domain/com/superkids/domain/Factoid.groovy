package com.superkids.domain

class Factoid {
    String content
    boolean liveFactoid = true

    static constraints = {
        content nullable:false, blank:false
    }

	static mapping = {
        content column: "content", sqlType: "longblob"
    }

    String toString(){
        content
    }
}
