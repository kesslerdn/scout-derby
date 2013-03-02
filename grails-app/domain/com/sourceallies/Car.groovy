package com.sourceallies

import java.util.Date;

class Car {

	String carName
	Date dateCreated
	Date lastUpdated
	List finishTimes

	static belongsTo = [Race, Lane]
	static hasMany = [finishTimes:FinishTime]
	static hasOne = [owner:Owner]
	
    static constraints = {
		owner(nullable:true)
		carName(blank:false, unique:true)
    }
	
	def averageTime(){
		def total = 0.0
		finishTimes.each{finishTime ->
			total = total + finishTime.seconds
		}
		return (total / (finishTimes.size()))
	}
	
	String toString() { "$id: $carName: $owner"}
}
