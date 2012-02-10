package com.sourceallies


class RaceController {

	static scaffold = true
			
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
					if(cars.size < raceInstance.numberOfLanes){
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
					flash.message = "Please select a race."
							render(view: "selectRace", model: [actionName: "nextHeat"])
				}
	}
	
	def report = {
		flash.message = ""
		if(params.id){
			def raceInstance = Race.get(params.id)
			def allCars = raceInstance.cars.toList()
			def cars = allCars.findAll{!(it.finishTimes?.isEmpty())}
			cars.sort{ it.averageTime() }
			[raceInstance: raceInstance, cars: cars]
		}else{
			flash.message = "Please select a race."
			render(view: "selectRace", model: [actionName: "report"])
		}
	}
}
