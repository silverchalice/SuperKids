package com.superkids.domain

enum OrderType {

    PHONE {
        String toString() { "Phone" }
    },
    WEB {
        String toString() { "Web" }
    },
    FAX {
        String toString() { "Fax" }
    },
    EMAIL {
        String toString() { "Email" }
    },
    MAIL {
        String toString() { "Mail" }
    }

}
