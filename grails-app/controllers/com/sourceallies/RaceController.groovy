package com.sourceallies

import grails.plugins.springsecurity.Secured

class RaceController {

	private static final int RESULT_SIZE = 10
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_MANAGER'])
    def index = {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_MANAGER'])
    def list = {
		def entityListSize = Race.count()
		
		def max = params.max ? params.int('max') : 0
		max += RESULT_SIZE
		max = Math.min(entityListSize, max)
		
		def showMoreSize = entityListSize - max
		showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
		
		params.max = max
		[raceInstanceList: Race.list(params), max: max, showMoreSize: showMoreSize]
    }

	@Secured(['ROLE_MANAGER'])
    def create = {
        def raceInstance = new Race()
        raceInstance.properties = params
        return [raceInstance: raceInstance]
    }

	@Secured(['ROLE_MANAGER'])
    def save = {
        def raceInstance = new Race(params)
        if (raceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])}"
            redirect(action: "show", id: raceInstance.id)
        }
        else {
            render(view: "create", model: [raceInstance: raceInstance])
        }
    }

	@Secured(['ROLE_MANAGER'])
    def show = {
        def raceInstance = Race.get(params.id)
        if (!raceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
        else {
            [raceInstance: raceInstance]
        }
    }

	@Secured(['ROLE_MANAGER'])
    def edit = {
        def raceInstance = Race.get(params.id)
        if (!raceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [raceInstance: raceInstance]
        }
    }

	@Secured(['ROLE_MANAGER'])
    def update = {
        def raceInstance = Race.get(params.id)
        if (raceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (raceInstance.version > version) {
                    
                    raceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'race.label', default: 'Race')] as Object[], "Another user has updated this Race while you were editing")
                    render(view: "edit", model: [raceInstance: raceInstance])
                    return
                }
            }
            raceInstance.properties = params
            if (!raceInstance.hasErrors() && raceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])}"
                redirect(action: "show", id: raceInstance.id)
            }
            else {
                render(view: "edit", model: [raceInstance: raceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
    }

	@Secured(['ROLE_MANAGER'])
    def delete = {
        def raceInstance = Race.get(params.id)
        if (raceInstance) {
            try {
                raceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'race.label', default: 'Race'), params.id])}"
            redirect(action: "list")
        }
    }
	
	@Secured(['ROLE_MANAGER'])
	def nextHeat = {
		flash.message = ""
				if(params.id){
					def raceInstance = Race.get(params.id)
					def cars = raceInstance.cars.toList()
					if(!cars){
						flash.message = "Please add cars to the ${raceInstance} race."
						render(view: "selectRace", model: [actionName: "nextHeat"])
						return
					}
					if(cars.size < (raceInstance.numberOfLanes + 1)){
						flash.message = "Please add at least ${raceInstance.numberOfLanes + 1} cars to the ${raceInstance} race."
						render(view: "selectRace", model: [actionName: "nextHeat"])
						return
					}
					if(!raceInstance.lanes || raceInstance.lanes.isEmpty()){
						Collections.shuffle(cars)
						(1..(raceInstance.numberOfLanes)).each{ laneNumber ->
							def lane = new Lane(number: laneNumber);
							cars[laneNumber..-1].each{car ->
							lane.addToCars(car)
						}
						cars[0..(laneNumber-1)].each{car ->
							lane.addToCars(car)
						}
						raceInstance.addToLanes(lane)
						}
						raceInstance.currentHeat = 1
								
								for(int i = 0; i < cars.size; i++){
									def carIds = []
											raceInstance.lanes.each{lane ->
											def car = lane.cars[i]
													carIds.add(car.id)
									}
									carIds.each{ id ->
										def count = carIds.count{it == id}
										if(count != 1){
											throw new IllegalStateException("Heat ${i + 1} contains car id $id $count times.")
										}
									}
								}
						
						if(!raceInstance.save(flush: true)){
							flash.message = "Failed to save ${raceInstance}."
							render(view: "selectRace", model: [actionName: "nextHeat"])
							return
						}
					}
							
					def finishTimes = params.finishTimes
					int heatIndex = (raceInstance.currentHeat - 1)
					
					if(invalidDoubles(finishTimes)){
						flash.message = "Please enter valid times."
						render(view: "nextHeat", model: [id:params.id, heatIndex: heatIndex, lanes: raceInstance.lanes])
						return
					}
					
					if(finishTimes){
						raceInstance.lanes.each{lane ->
							double finishTime = (Double.parseDouble(finishTimes[lane.number - 1]))
							def finishTimeInstance = new FinishTime(laneNumber:(lane.number), seconds: finishTime)
							def car = lane.cars[heatIndex]
							car.addToFinishTimes(finishTimeInstance)
						}
						
						heatIndex += 1
						raceInstance.currentHeat += 1
						if(!raceInstance.save(flush: true)){
							flash.message = "Failed to save ${raceInstance}."
							render(view: "selectRace", model: [actionName: "nextHeat"])
							return
						}
					}
					if(heatIndex >= cars.size){
						redirect(action: "report", id: params.id)
					}
					
					[id:params.id, heatIndex: heatIndex, lanes: raceInstance.lanes]
				}else{
					render(view: "selectRace", model: [actionName: "nextHeat"]) 
				}
	}
	
	private boolean invalidDoubles(def values){
		def invalid = false
		values.each{value ->
			try{
				Double.parseDouble(value)
			}catch(NumberFormatException e){
				invalid = true;
			}
		}
		return invalid;
	}
 
	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def report = {		
		flash.message = ""
		if(params.id){
			def raceInstance = Race.get(params.id)
			def allCars = raceInstance.cars.toList()
			def cars = allCars.findAll{!(it.finishTimes?.isEmpty())}
			cars.sort{ it.averageTime() }

			def entityListSize = cars.size
			
			def max = params.max ? params.int('max') : 0
			max += 5
			max = Math.min(entityListSize, max)
			
			def showMoreSize = entityListSize - max
			showMoreSize = Math.min(showMoreSize, 5)
			def carList = cars.isEmpty() ? [] : cars[0..(max -1)]
			[id:params.id, raceInstance: raceInstance, cars: carList, max: max, showMoreSize: showMoreSize]
		}else{
			render(view: "selectRace", model: [actionName: "report"])
		}
	}
}
