package com.sourceallies

import java.util.Date

class Race {

	String name
	int numberOfLanes
	int currentHeat;
	Date dateCreated
	Date lastUpdated
	List lanes

	static belongsTo = [derby:Derby]
	static hasMany = [lanes:Lane, cars:Car]
	
    static constraints = {
		name(blank:false)
		numberOfLanes(blank:false)
    }

	String toString() { "" + name + ": " + derby}
}
