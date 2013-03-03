package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class LaneController {
	def springSecurityService

	private static final int RESULT_SIZE = 10
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def entityListSize = Lane.count()
		
		def max = params.max ? params.int('max') : 0
		max += RESULT_SIZE
		max = Math.min(entityListSize, max)
		
		def showMoreSize = entityListSize - max
		showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
		
		params.max = max
		[laneInstanceList: Lane.findAllByUser(springSecurityService.getCurrentUser(), params), max: max, showMoreSize: showMoreSize]	
    }

    def create = {
        def laneInstance = new Lane()
        laneInstance.properties = params
        return [laneInstance: laneInstance, vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()}]
    }

    def save = {
        def laneInstance = new Lane(params)
		laneInstance.user = springSecurityService.getCurrentUser()
        if (laneInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'lane.label', default: 'Lane'), laneInstance.id])}"
            redirect(action: "show", id: laneInstance.id)
        }
        else {
            render(view: "create", model: [laneInstance: laneInstance])
        }
    }

    def show = {
        def laneInstance = Lane.get(params.id)
        if (!laneInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])}"
            redirect(action: "list")
        }
        else {
            [laneInstance: laneInstance]
        }
    }

    def edit = {
        def laneInstance = Lane.get(params.id)
        if (!laneInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [laneInstance: laneInstance, vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()}]
        }
    }

    def update = {
        def laneInstance = Lane.get(params.id)
        if (laneInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (laneInstance.version > version) {
                    
                    laneInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'lane.label', default: 'Lane')] as Object[], "Another user has updated this Lane while you were editing")
                    render(view: "edit", model: [laneInstance: laneInstance, vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()}])
                    return
                }
            }
            laneInstance.properties = params
            if (!laneInstance.hasErrors() && laneInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'lane.label', default: 'Lane'), laneInstance.id])}"
                redirect(action: "show", id: laneInstance.id)
            }
            else {
                render(view: "edit", model: [laneInstance: laneInstance, vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()}])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def laneInstance = Lane.get(params.id)
        if (laneInstance) {
            try {
                laneInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])}"
            redirect(action: "list")
        }
    }
}
