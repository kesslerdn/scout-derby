package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class FinishTimeController {
	def springSecurityService

	private static final int RESULT_SIZE = 10
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def entityListSize = FinishTime.count()
		
		def max = params.max ? params.int('max') : 0
		max += RESULT_SIZE
		max = Math.min(entityListSize, max)
		
		def showMoreSize = entityListSize - max
		showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
		
		params.max = max
		[finishTimeInstanceList: FinishTime.findByUser(springSecurityService.getCurrentUser(), params), max: max, showMoreSize: showMoreSize]
    }

    def create = {
        def finishTimeInstance = new FinishTime()
        finishTimeInstance.properties = params
        return [finishTimeInstance: finishTimeInstance, vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser())]
    }

    def save = {
        def finishTimeInstance = new FinishTime(params)
		finishTimeInstance.user = springSecurityService.getCurrentUser()
        if (finishTimeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), finishTimeInstance.id])}"
            redirect(action: "show", id: finishTimeInstance.id)
        }
        else {
            render(view: "create", model: [finishTimeInstance: finishTimeInstance, vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser())])
        }
    }

    def show = {
        def finishTimeInstance = FinishTime.get(params.id)
        if (!finishTimeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), params.id])}"
            redirect(action: "list")
        }
        else {
            [finishTimeInstance: finishTimeInstance]
        }
    }

    def edit = {
        def finishTimeInstance = FinishTime.get(params.id)
        if (!finishTimeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [finishTimeInstance: finishTimeInstance, vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser())]
        }
    }

    def update = {
        def finishTimeInstance = FinishTime.get(params.id)
        if (finishTimeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (finishTimeInstance.version > version) {
                    
                    finishTimeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'finishTime.label', default: 'FinishTime')] as Object[], "Another user has updated this FinishTime while you were editing")
                    render(view: "edit", model: [finishTimeInstance: finishTimeInstance, vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser())])
                    return
                }
            }
            finishTimeInstance.properties = params
            if (!finishTimeInstance.hasErrors() && finishTimeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), finishTimeInstance.id])}"
                redirect(action: "show", id: finishTimeInstance.id)
            }
            else {
                render(view: "edit", model: [finishTimeInstance: finishTimeInstance, vehicleSelectOptions: Vehicle.findByUser(springSecurityService.getCurrentUser())])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def finishTimeInstance = FinishTime.get(params.id)
        if (finishTimeInstance) {
            try {
                finishTimeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), params.id])}"
            redirect(action: "list")
        }
    }
}
