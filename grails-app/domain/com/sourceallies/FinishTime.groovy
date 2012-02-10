package com.sourceallies

class FinishTime {
	
	Double seconds
	int laneNumber
	Date dateCreated
	Date lastUpdated

	static belongsTo = [car:Car]

    static constraints = {
		seconds(blank:false)
		laneNumber(blank:false)
    }
	
	String toString() { '' + seconds + ' second(s): ' + car }
}
