package com.sourceallies

import java.util.Date;

class Owner {

	String firstName
	String lastName
	Vehicle vehicle
	Date dateCreated
	Date lastUpdated
	User user
	
    static constraints = {
		firstName(blank:false)
    }

	static mapping = {
		vehicle cascade: 'all-delete-orphan'
	}
	
	String toString() { lastName ? lastName + ', ' + firstName : firstName}
}
