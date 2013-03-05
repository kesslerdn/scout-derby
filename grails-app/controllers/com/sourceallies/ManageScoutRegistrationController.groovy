package com.sourceallies

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.commons.ConfigurationHolder


class ManageScoutRegistrationController {
	def springSecurityService
	
	def index = {
		println "index"
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
		println "menu"
		def derbyInstance = Derby.get(params.id)
		def registrationUrl = "${ConfigurationHolder.config.grails.serverURL}/manageScoutRegistraion/registerScout?hashKey=${derbyInstance.hashKey}"
       render(view: "menu", model: [registrationUrl: registrationUrl, hashKey: derbyInstance.hashKey, derbyType: derbyInstance.type])
    }
	
	def registerScout = {
		println "registerScout"
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
	
	def save = {
		println "save"
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
			 render(view: "create", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			 return
		 }
		 
		vehicleInstance.owner = null
		raceInstance.addToVehicles(vehicleInstance)
		if (!vehicleInstance.validate()) {
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}

		ownerInstance.vehicle = vehicleInstance
		if(!ownerInstance.validate()){
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}
		
		if (!vehicleInstance.save(flush: true)) {
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}

		if(!ownerInstance.save(flush: true)){
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}
		
		if(!raceInstance.save(flush: true)){
			render(view: "registerScout", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])
		redirect(action: "registerScout", params: [hashKey: params.hashKey])
	}

}
