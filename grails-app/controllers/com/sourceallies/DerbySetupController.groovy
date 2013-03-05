package com.sourceallies

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import java.security.MessageDigest


@Secured(['ROLE_MANAGER'])
class DerbySetupController {
	def springSecurityService
	
	def index = {
		redirect(action: "createDerby", params: params)
	}
	
	def createDerby = {
		def derbyInstance = new Derby()
		derbyInstance.properties = params
		return [derbyInstance: derbyInstance]
	}
	
	def saveDerby = {
		def derbyInstance = new Derby(params)
		derbyInstance.user = springSecurityService.getCurrentUser()
		derbyInstance.hashKey = generateKey(derbyInstance.toString())
		if (derbyInstance.save(flush: true)) {

			flash.message = "${message(code: 'default.created.message', args: [message(code: 'derby.label', default: 'Derby'), derbyInstance.id])}"
			redirect(action: "createRace", params:["derby.id": derbyInstance.id])
		}
		else {
			render(view: "createDerby", model: [derbyInstance: derbyInstance])
		}
	}
	
	def createRace = {
		def raceInstance = new Race()
		raceInstance.properties = params
		return [raceInstance: raceInstance,
			vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()},
			derbySelectOptions: Derby.findAll{user == springSecurityService.getCurrentUser()},
			laneSelectOptions: Lane.findAll{user == springSecurityService.getCurrentUser()}]
	}

	def saveRace = {
		def raceInstance = new Race(params)
		raceInstance.user = springSecurityService.getCurrentUser()
		if (raceInstance.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])}"
			redirect(action: "createRace",  params:["derby.id": raceInstance.derby.id])
		}
		else {
			render(view: "createRace", model: [raceInstance: raceInstance,
				vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()},
			derbySelectOptions: Derby.findAll{user == springSecurityService.getCurrentUser()},
			laneSelectOptions: Lane.findAll{user == springSecurityService.getCurrentUser()}])
		}
	}
	
	
	private String generateKey(String value){
		def now = new Date()
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
		messageDigest.update("${value}-${now}".getBytes())
		BigInteger bigInt = new BigInteger(1, messageDigest.digest())
		bigInt.toString(16)
	}


}
