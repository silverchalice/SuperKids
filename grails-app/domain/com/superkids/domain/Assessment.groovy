package com.superkids.domain

class Assessment {

    Integer likeRating
    Integer iRating
    String likeComment
    String changeComment
    Product product
    Boolean completed = false

    static belongsTo = [ customer : Customer ]

    static constraints = {
        likeRating nullable:true
        iRating nullable:true
        likeComment nullable:true
        changeComment nullable:true
        product nullable:false
        customer nullable:true
    }
}
