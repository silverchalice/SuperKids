package com.superkids.domain

class Factoid {
    String content

    static constraints = {
        content nullable:false, blank:false
    }

    String toString(){
        content
    }
}
