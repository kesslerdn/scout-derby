package com.sourceallies

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.commons.ConfigurationHolder


class ManageScoutRegistrationController {
	def springSecurityService
	
	def index = {
		def today = new Date()
		def yesterday = today - 1
		def derbies = Derby.findAllByUserAndDateGreaterThan(springSecurityService.getCurrentUser(), yesterday)
		if(derbies.size() == 0){
			flash.message = "There are no derbies.<br/>Please setup a new derby."
		}
		if(derbies.size() == 1){
			redirect(action: "menu", id: derbies[0].id)
		}else{
			render(view: "selectDerby", model: [derbySelectOptions: derbies])
		}
	}
	
    def menu = {
		def derbyInstance = Derby.get(params.id)
		def registrationUrl = "${ConfigurationHolder.config.grails.serverURL}/manageScoutRegistration/registerScout?hashKey=${derbyInstance.hashKey}"
       render(view: "menu", model: [registrationUrl: registrationUrl, hashKey: derbyInstance.hashKey, derbyType: derbyInstance.type])
    }
	
	@Secured(['ROLE_MANAGER'])
	def registerScout = {
		def derbyInstance = Derby.findByHashKey(params.hashKey)
		if(derbyInstance){
			def races = Race.findAll{user == springSecurityService.getCurrentUser()}
			def availableRaces = races.findAll{it.lanes.empty}
				if(availableRaces){
				params.user = springSecurityService.getCurrentUser()
				if(availableRaces.size() == 1){
					params.raceId = availableRaces[0].id
				}
				[vehicleInstance: new Vehicle(params), ownerInstance: new Owner(params), raceInstance: Race.get(params.raceId), availableRaces:availableRaces, hashKey: params.hashKey]
			}else{
				flash.message ="No races for this derby."
				render(view: "error")
			}
		}else{
			flash.message ="No derbies for this key."
			render(view: "error")
		}
	}
	
	def roster = {
		def derbyInstance = Derby.findByHashKey(params.hashKey)
		if(derbyInstance){
			def max = Vehicle.count()
			
			def showMoreSize = 0
			
			params.max = max
			params.sort = 'id'
			params.order = 'asc'
			[vehicleInstanceList: Vehicle.findAllByUser(springSecurityService.getCurrentUser(), params), max: max, showMoreSize: showMoreSize]
		}else{
			flash.message ="No derbies for this key."
			render(view: "error")
		}
	}

	def save = {
		if(params.raceId == "null") params.raceId = null
		
		 def vehicleInstance = new Vehicle(params)
		 vehicleInstance.user = springSecurityService.getCurrentUser()
		 def ownerInstance = new Owner(params)
		 ownerInstance.user = springSecurityService.getCurrentUser()
		 def raceInstance = Race.get(params.raceId)
		 
		 def races = Race.findAll{user == springSecurityService.getCurrentUser()}
		 def availableRaces = races.findAll{it.lanes.empty}

		 if(!raceInstance){
			 flash.message = "Please select a race."
			 render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces, hashKey: params.hashKey])
			 return
		 }
	
		 
		 def hasDupName
		 raceInstance.each{race ->
			 race.vehicles.each{ vehicle ->
				 if(vehicle.vehicleName == vehicleInstance.vehicleName){
					 hasDupName = true
					 flash.message = "The name '" + vehicleInstance.vehicleName + "' is already taken."
				 }
			 }
		 }

		vehicleInstance.owner = null
		raceInstance.addToVehicles(vehicleInstance)
		if (!vehicleInstance.validate() || hasDupName) {
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces, hashKey: params.hashKey])
			return
		}

		ownerInstance.vehicle = vehicleInstance
		if(!ownerInstance.validate()){
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces, hashKey: params.hashKey])
			return
		}
		
		if (!vehicleInstance.save(flush: true)) {
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces, hashKey: params.hashKey])
			return
		}

		if(!ownerInstance.save(flush: true)){
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces, hashKey: params.hashKey])
			return
		}
		
		if(!raceInstance.save(flush: true)){
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces, hashKey: params.hashKey])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])
		redirect(action: "registerScout", params: [hashKey: params.hashKey])
	}

}
