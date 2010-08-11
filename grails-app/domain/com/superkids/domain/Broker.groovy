package com.superkids.domain

class Broker {

	String name
	String phone
	String fax
	String email

	String street
	String city
	String state
	Integer zip

	static belongsTo = [customer: Customer]

    static constraints = {
		street()
		city()
		state(inList:['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
			'Colorado', 'Connecticut', 'Delaware', 'District of Columbia',
			'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana',
			'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland',
			'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri',
			'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey',
			'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio',
			'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina',
			'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
			'Virgin Islands', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'])
		zip()
		customer(nullable:true)
		sponsor(nullable:true)
    }
}

