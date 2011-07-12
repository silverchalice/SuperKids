package com.superkids.domain

class User {

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

        def isAdmin(){
            def adminRole = Role.findByAuthority("ROLE_ADMIN")
            if(getAuthorities().contains(adminRole)){
                return true
            } else {
                return false
            }
        }

}
