package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class CarController {

	private static final int RESULT_SIZE = 10
	
    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }
   
   def list() {
	   def entityListSize = Car.count()
	   
	   def max = params.max ? params.int('max') : 0
	   max += RESULT_SIZE
	   max = Math.min(entityListSize, max)
	   
	   def showMoreSize = entityListSize - max
	   showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
	   
	   params.max = max
	   params.sort = 'id'
	   params.order = 'desc'
	   [carInstanceList: Car.list(params), max: max, showMoreSize: showMoreSize]
   }

    def create() {
		def races = Race.list()
		def availableRaces = races.findAll{it.lanes.empty}
        [carInstance: new Car(params), ownerInstance: new Owner(params), raceInstance: Race.get(params.raceId), availableRaces:availableRaces]
    }

    def save() {
 		def carInstance = new Car(params)
 		def ownerInstance = new Owner(params)
 		def raceInstance = Race.get(params.raceId)
		 
		 def races = Race.list()
		 def availableRaces = races.findAll{it.lanes.empty}

		 if(!raceInstance){
			 flash.message = "Please select a race."
			 render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			 return
		 }
		 
		carInstance.owner = null
        if (!carInstance.validate()) {
            render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
            return
        }

		ownerInstance.car = carInstance
		if(!ownerInstance.validate()){
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}
		
		raceInstance.addToCars(carInstance)
		if(!raceInstance.validate()){
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}
		
		if (!carInstance.save(flush: true)) {
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}

		if(!ownerInstance.save(flush: true)){
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}
		
		if(!raceInstance.save(flush: true)){
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance, availableRaces:availableRaces])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'car.label', default: 'Car'), carInstance.id])
        redirect(action: "list")
    }

    def show = {
        def carInstance = Car.get(params.id)
        if (!carInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
            redirect(action: "list")
        }
        else {
            [carInstance: carInstance]
        }
    }

    def edit = {
        def carInstance = Car.get(params.id)
        if (!carInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [carInstance: carInstance]
        }
    }

    def update = {
        def carInstance = Car.get(params.id)
        if (carInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (carInstance.version > version) {
                    
                    carInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'car.label', default: 'Car')] as Object[], "Another user has updated this Car while you were editing")
                    render(view: "edit", model: [carInstance: carInstance])
                    return
                }
            }
            carInstance.properties = params
            if (!carInstance.hasErrors() && carInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'car.label', default: 'Car'), carInstance.id])}"
                redirect(action: "show", id: carInstance.id)
            }
            else {
                render(view: "edit", model: [carInstance: carInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def carInstance = Car.get(params.id)
        if (carInstance) {
            try {
                carInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'car.label', default: 'Car'), params.id])}"
            redirect(action: "list")
        }
    }
}
