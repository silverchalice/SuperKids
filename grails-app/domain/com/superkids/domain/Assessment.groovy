package com.superkids.domain

class Assessment {


    Integer rating
    Integer interest

    String commentsLike
    String commentsChange

    static belongsTo = [customer: Customer, product: Product]

    static constraints = {
    }
}
