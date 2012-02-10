package com.sourceallies

import java.util.Date

class Derby {

	String organizationNumber
	String location
	Date date
	Date dateCreated
	Date lastUpdated
	static hasMany = [races:Race]

    static constraints = {
		location(blank:false)
		date(blank:false)
    }
	
	String toString() { date.format('MM/dd/yyyy') + ': ' + location }
}
