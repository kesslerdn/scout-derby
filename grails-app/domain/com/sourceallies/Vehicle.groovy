package com.sourceallies

import java.util.Date;

class Vehicle {

	String vehicleName
	Date dateCreated
	Date lastUpdated
	List finishTimes
	User user

	static belongsTo = [race:Race]
	static hasMany = [finishTimes:FinishTime]
	static hasOne = [owner:Owner]
	
    static constraints = {
		owner(nullable:true)
		vehicleName(blank:false)
    }
	
	def averageTime(){
		def total = 0.0
		finishTimes.each{finishTime ->
			total = total + finishTime.seconds
		}
		return (total / (finishTimes.size()))
	}

	String toString() { "$id: $vehicleName: $owner"}
}
