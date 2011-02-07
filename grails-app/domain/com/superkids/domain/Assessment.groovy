package com.superkids.domain

class Assessment {

    Integer likeRating
    Integer iRating
    String likeComment
    String changeComment		
	String favorite
    Product product
    Boolean completed = false
	OrderType type

    static belongsTo = [ customer : Customer ]

    static constraints = {
        likeRating nullable:true
        iRating nullable:true
        likeComment nullable:true
		favorite nullable:true
        changeComment nullable:true
        product nullable:true
        customer nullable:true
    }

    static mapping = {
        likeComment sqlType:"longtext"
        changeComment sqlType:"longtext"
		favorite sqlType:"longtext"
    }

    String toString(){
        "assessment " + id + " of product " + product + ", assessed by " + customer
    }

}
