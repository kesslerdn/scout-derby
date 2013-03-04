package com.sourceallies

import java.util.Date

class Derby {
	String organizationNumber
	String city
	String state
	String locationName
	String type
	Date date
	Date dateCreated
	Date lastUpdated
	User user
	String hashKey
	
	static hasMany = [races:Race]

	
    static constraints = {
		city(blank:false, maxSize: 25)
		state (blank:false, inList: ['AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 
			'DC', 'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 
			'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 
			'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 
			'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 
			'TX', 'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY'])
		locationName(blank:false, maxSize: 25)
		date(blank:false)
		organizationNumber(blank:true)
		type(blank:false, inList: ['Pinewood Derby', 'Raingutter Regatta', 'Space Derby', 'Cubmobile Derby'])
    }
	
	String toString() { "${date.format('MM/dd/yyyy')}: ${city}, ${state} : ${locationName}" }
}
