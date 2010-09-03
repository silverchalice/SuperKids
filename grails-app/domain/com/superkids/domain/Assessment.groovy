package com.superkids.domain

class Assessment {

    Integer likeRating
    Integer interestRating
    String likeComment
    String changeComment
    Product product

    static belongsTo = [ customer : Customer ]

    static constraints = {
        likeRating nullable:false
        interestRating: nullable:false
        likeComment: nullable:false
        changeComment nullable:false
        product nullable:false
        customer nullable:false
    }
}
