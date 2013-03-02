package com.sourceallies

import java.util.Date

class Lane {

	int number
	Date dateCreated
	Date lastUpdated
	List vehicles
	User user
	
	static belongsTo = Race
	static hasMany = [vehicles:Vehicle]
	
    static constraints = {
		number(blank:false)
    }

	String toString() { 'Lane ' + number}
}
