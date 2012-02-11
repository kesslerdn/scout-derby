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
		numberOfLanes(blank:false, inList:[2,3,4,5,6,7,8,9,10])
    }

	String toString() { "" + name + ": " + derby}
}
