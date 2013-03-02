package com.sourceallies

class FinishTime {
	
	Double seconds
	int laneNumber
	Date dateCreated
	Date lastUpdated
	User user

	static belongsTo = [vehicle:Vehicle]
    static constraints = {
		seconds(blank:false)
		laneNumber(blank:false)
    }

	String toString() { '' + seconds + ' second(s): ' + vehicle }
}
