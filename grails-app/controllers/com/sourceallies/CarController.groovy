package com.sourceallies

import com.sourceallies.Car;
import com.sourceallies.Derby;
import com.sourceallies.Owner;
import com.sourceallies.Race;


class CarController {

   static scaffold = true
		   

    def create() {
        [carInstance: new Car(params), ownerInstance: new Owner(params), raceInstance: Race.get(params.raceId)]
    }

    def save() {
 		def carInstance = new Car(params)
 		def ownerInstance = new Owner(params)
 		def raceInstance = Race.get(params.raceId)
		 
		carInstance.owner = null
        if (!carInstance.validate()) {
            render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance])
            return
        }

		ownerInstance.car = carInstance
		if(!ownerInstance.validate()){
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance])
			return
		}
		
		raceInstance.addToCars(carInstance)
		if(!raceInstance.validate()){
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance])
			return
		}
		
		if (!carInstance.save(flush: true)) {
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance])
			return
		}

		if(!ownerInstance.save(flush: true)){
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance])
			return
		}
		
		if(!raceInstance.save(flush: true)){
			render(view: "create", model: [carInstance: carInstance, ownerInstance: ownerInstance, raceInstance: raceInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'car.label', default: 'Car'), carInstance.id])
        redirect(action: "list")
    }
}
