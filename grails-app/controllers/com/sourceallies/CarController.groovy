package com.sourceallies

import com.sourceallies.Car;
import com.sourceallies.Derby;
import com.sourceallies.Owner;
import com.sourceallies.Race;


class CarController {

   static scaffold = true
		   

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
}
