package com.superkids.domain

enum OrderType {

    PHONE {
        String toString() { "Phone" }
    },
    WEB {
        String toString() { "Web" }
    },
    MAIL {
        String toString() { "Mail" }
    }

}
