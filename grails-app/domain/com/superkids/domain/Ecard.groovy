package com.superkids.domain

class Ecard {

	String name
	String company
	String email

	String recipient
	String recipientEmail
	String message

    static constraints = {
		name()
		company()
		email (email: true)
		recipient()
		recipientEmail(email: true)
		message(maxSize: 2000)
    }
}
