package com.sourceallies

import grails.plugins.springsecurity.Secured

class RaceController {
	def springSecurityService

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
		[raceInstanceList: Race.findByUser(springSecurityService.getCurrentUser(), params), max: max, showMoreSize: showMoreSize]
    }

	@Secured(['ROLE_MANAGER'])
    def create = {
        def raceInstance = new Race()
        raceInstance.properties = params
        return [raceInstance: raceInstance, 
			vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser()),
			derbySelectOptions: Derby.findByUser(springSecurityService.getCurrentUser()),
			laneSelectOptions: Lane.findByUser(springSecurityService.getCurrentUser())]
    }

	@Secured(['ROLE_MANAGER'])
    def save = {
        def raceInstance = new Race(params)
		raceInstance.user = springSecurityService.getCurrentUser()
        if (raceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])}"
            redirect(action: "show", id: raceInstance.id)
        }
        else {
            render(view: "create", model: [raceInstance: raceInstance, 
				vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser()),
			derbySelectOptions: Derby.findByUser(springSecurityService.getCurrentUser()),
			laneSelectOptions: Lane.findByUser(springSecurityService.getCurrentUser())])
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
            return [raceInstance: raceInstance, 
				vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser()),
			derbySelectOptions: Derby.findByUser(springSecurityService.getCurrentUser()),
			laneSelectOptions: Lane.findByUser(springSecurityService.getCurrentUser())]
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
                    render(view: "edit", model: [raceInstance: raceInstance, 
						vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser())],
			derbySelectOptions: Derby.findByUser(springSecurityService.getCurrentUser()),
			laneSelectOptions: Lane.findByUser(springSecurityService.getCurrentUser()))
                    return
                }
            }
            raceInstance.properties = params
            if (!raceInstance.hasErrors() && raceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'race.label', default: 'Race'), raceInstance.id])}"
                redirect(action: "show", id: raceInstance.id)
            }
            else {
                render(view: "edit", model: [raceInstance: raceInstance, 
					vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser())],
			derbySelectOptions: Derby.findByUser(springSecurityService.getCurrentUser()),
			laneSelectOptions: Lane.findByUser(springSecurityService.getCurrentUser()))
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
					def vehicles = raceInstance.vehicles.toList()
					if(!vehicles){
						flash.message = "Please add vehicles to the ${raceInstance} race."
						render(view: "selectRace", model: [actionName: "nextHeat"])
						return
					}
					if(vehicles.size < (raceInstance.numberOfLanes + 1)){
						flash.message = "Please add at least ${raceInstance.numberOfLanes + 1} vehicles to the ${raceInstance} race."
						render(view: "selectRace", model: [actionName: "nextHeat"])
						return
					}
					if(!raceInstance.lanes || raceInstance.lanes.isEmpty()){
						Collections.shuffle(vehicles)
						(1..(raceInstance.numberOfLanes)).each{ laneNumber ->
							def lane = new Lane(number: laneNumber)
							lane.user = springSecurityService.getCurrentUser()
							vehicles[laneNumber..-1].each{vehicle ->
							lane.addToVehicles(vehicle)
						}
						vehicles[0..(laneNumber-1)].each{vehicle ->
							lane.addToVehicles(vehicle)
						}
						raceInstance.addToLanes(lane)
						}
						raceInstance.currentHeat = 1
								
								for(int i = 0; i < vehicles.size; i++){
									def vehicleIds = []
											raceInstance.lanes.each{lane ->
											def vehicle = lane.vehicles[i]
													vehicleIds.add(vehicle.id)
									}
									vehicleIds.each{ id ->
										def count = vehicleIds.count{it == id}
										if(count != 1){
											throw new IllegalStateException("Heat ${i + 1} contains vehicle id $id $count times.")
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
							finishTimeInstance.user = springSecurityService.getCurrentUser()
							def vehicle = lane.vehicles[heatIndex]
							vehicle.addToFinishTimes(finishTimeInstance)
						}
						
						heatIndex += 1
						raceInstance.currentHeat += 1
						if(!raceInstance.save(flush: true)){
							flash.message = "Failed to save ${raceInstance}."
							render(view: "selectRace", model: [actionName: "nextHeat"])
							return
						}
					}
					if(heatIndex >= vehicles.size){
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
			def allVehicles = raceInstance.vehicles.toList()
			def vehicles = allVehicles.findAll{!(it.finishTimes?.isEmpty())}
			vehicles.sort{ it.averageTime() }

			def entityListSize = vehicles.size
			
			def max = params.max ? params.int('max') : 0
			max += 5
			max = Math.min(entityListSize, max)
			
			def showMoreSize = entityListSize - max
			showMoreSize = Math.min(showMoreSize, 5)
			def vehicleList = vehicles.isEmpty() ? [] : vehicles[0..(max -1)]
			[id:params.id, raceInstance: raceInstance, vehicles: vehicleList, max: max, showMoreSize: showMoreSize]
		}else{
			render(view: "selectRace", model: [actionName: "report", ,
			raceSelectOptions: Race.list()])
		}
	}
}
