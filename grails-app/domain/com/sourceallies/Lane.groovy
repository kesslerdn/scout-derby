package com.sourceallies

import java.util.Date

class Lane {

	int number
	Date dateCreated
	Date lastUpdated
	List cars
	
	static belongsTo = Race
	static hasMany = [cars:Car]
	
    static constraints = {
		number(blank:false)
    }
	
	String toString() { 'Lane ' + number}
}
