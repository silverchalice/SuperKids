package com.superkids.domain

class Assessment {

    Integer likeRating
    Integer interestRating
    String likeComment
    String changeComment
    Product product
    Boolean completed = false

    static belongsTo = [ customer : Customer ]

    static constraints = {
        likeRating nullable:true
        interestRating nullable:true
        likeComment nullable:true
        changeComment nullable:true
        product nullable:false
        customer nullable:false
    }
}
