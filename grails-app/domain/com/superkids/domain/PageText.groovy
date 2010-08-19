package com.superkids.domain

class PageText {

    String name
    String content

    static constraints = {
        name nullable:false, blank:false
        content maxSize:100000000, nullable:true, blank:true
    }
}
