package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class VehicleController {
	def springSecurityService
	
	private static final int RESULT_SIZE = 10

    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def vehicleInstanceListSize = Vehicle.count()
		
		def max = params.max ? params.int('max') : 0
		max += RESULT_SIZE
		max = Math.min(vehicleInstanceListSize, max)
		
		def showMoreSize = vehicleInstanceListSize - max
		showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
		
		params.max = max
		params.sort = 'id'
		params.order = 'desc'
		[vehicleInstanceList: Vehicle.findAllByUser(springSecurityService.getCurrentUser(), params), max: max, showMoreSize: showMoreSize]
    }

    def create = {
        def vehicleInstance = new Vehicle()
        params.user = springSecurityService.getCurrentUser()
        vehicleInstance.properties = params
        return [vehicleInstance: vehicleInstance,
    			ownerSelectOptions: Owner.findAll{user == springSecurityService.getCurrentUser()}]
    }

    def save = {
        def vehicleInstance = new Vehicle(params)
        vehicleInstance.user = springSecurityService.getCurrentUser()
        if (vehicleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])}"
            redirect(action: "list", params: params)
        }
        else {
            render(view: "create", model: [vehicleInstance: vehicleInstance,
                               			ownerSelectOptions: Owner.findAll{user == springSecurityService.getCurrentUser()}])
        }
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
            return [vehicleInstance: vehicleInstance,
        			ownerSelectOptions: Owner.findAll{user == springSecurityService.getCurrentUser()}]
        }
    }

    def update = {
        def vehicleInstance = Vehicle.get(params.id)
        if (vehicleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (vehicleInstance.version > version) {
                    
                    vehicleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'vehicle.label', default: 'Vehicle')] as Object[], "Another user has updated this Vehicle while you were editing")
                    render(view: "edit", model: [vehicleInstance: vehicleInstance,
                                     			ownerSelectOptions: Owner.findAll{user == springSecurityService.getCurrentUser()}])
                    return
                }
            }
            vehicleInstance.properties = params
            if (!vehicleInstance.hasErrors() && vehicleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), vehicleInstance.id])}"
                redirect(action: "show", id: vehicleInstance.id)
            }
            else {
                render(view: "edit", model: [vehicleInstance: vehicleInstance,
                                 			ownerSelectOptions: Owner.findAll{user == springSecurityService.getCurrentUser()}])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def vehicleInstance = Vehicle.get(params.id)
        if (vehicleInstance) {
            try {
                vehicleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'vehicle.label', default: 'Vehicle'), params.id])}"
            redirect(action: "list")
        }
    }
}
