package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class VehicleController {

	private static final int RESULT_SIZE = 10
	
    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
   
   def list() {
	   def entityListSize = Vehicle.count()
	   
	   def max = params.max ? params.int('max') : 0
	   max += RESULT_SIZE
	   max = Math.min(entityListSize, max)
	   
	   def showMoreSize = entityListSize - max
	   showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
	   
	   params.max = max
	   params.sort = 'id'
	   params.order = 'desc'
	   [vehicleInstanceList: Vehicle.list(params), max: max, showMoreSize: showMoreSize]
   }

    def create() {
		def races = Race.list()
		def availableRaces = races.findAll{it.lanes.empty}
        [vehicleInstance: new Vehicle(params), ownerInstance: new Owner(params), raceInstance: Race.get(params.raceId), availableRaces:availableRaces]
    }

    def save() {
		if(params.raceId == "null") params.raceId = null
		
 		def vehicleInstance = new Vehicle(params)
 		def ownerInstance = new Owner(params)
 		def raceInstance = Race.get(params.raceId)
		 
		 def races = Race.list()
		 def availableRaces = races.findAll{it.lanes.empty}

		 if(!raceInstance){
			 flash.message = "Please select a race."
			 render(view: "create", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			 return
		 }
		 
		vehicleInstance.owner = null
		raceInstance.addToVehicles(vehicleInstance)
        if (!vehicleInstance.validate()) {
            render(view: "create", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
            return
        }

		ownerInstance.vehicle = vehicleInstance
		if(!ownerInstance.validate()){
			render(view: "create", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}
		
		if (!vehicleInstance.save(flush: true)) {
			render(view: "create", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}

		if(!ownerInstance.save(flush: true)){
			render(view: "create", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}
		
		if(!raceInstance.save(flush: true)){
			render(view: "create", model: [vehicleInstance: vehicleInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])
        redirect(action: "list")
    }

    def show = {
        def vehicleInstance = Vehicle.get(params.id)
        if (!vehicleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
            redirect(action: "list")
        }
        else {
            [vehicleInstance: vehicleInstance]
        }
    }

    def edit = {
        def vehicleInstance = Vehicle.get(params.id)
        if (!vehicleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [vehicleInstance: vehicleInstance]
        }
    }

    def update = {
        def vehicleInstance = Vehicle.get(params.id)
        if (vehicleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (vehicleInstance.version > version) {
                    
                    vehicleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'vehicle.label', default: 'Vehicle')] as Object[], "Another user has updated this Vehicle while you were editing")
                    render(view: "edit", model: [vehicleInstance: vehicleInstance])
                    return
                }
            }
            vehicleInstance.properties = params
            if (!vehicleInstance.hasErrors() && vehicleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])}"
                redirect(action: "show", id: vehicleInstance.id)
            }
            else {
                render(view: "edit", model: [vehicleInstance: vehicleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def vehicleInstance = Vehicle.get(params.id)
		if(vehicleInstance.race?.lanes?.size() > 0){
			flash.message = "Vehicles can not be deleted once they are in a race."
			redirect(action: "list")
			return
		}
        if (vehicleInstance) {
            try {
				def race = vehicleInstance.race
				def ownerInstance = vehicleInstance.owner
				vehicleInstance.owner = null
				ownerInstance.vehicle = null
				ownerInstance.delete(flush: true)
				race.removeFromVehicles(vehicleInstance)
                vehicleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
                redirect(action: "list")
				return
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
                redirect(action: "show", id: params.id)
				return
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
            redirect(action: "list")
			return
        }
    }
}
