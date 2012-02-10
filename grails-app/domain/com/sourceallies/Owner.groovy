package com.sourceallies

import java.util.Date;

class Owner {

	String firstName
	String lastName
	Car car
	Date dateCreated
	Date lastUpdated

    static constraints = {
		firstName(blank:false)
    }
	
	String toString() { lastName ? lastName + ', ' + firstName : firstName}
}
