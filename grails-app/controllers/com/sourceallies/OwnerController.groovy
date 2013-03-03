package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class OwnerController {
	def springSecurityService

	private static final int RESULT_SIZE = 10
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def entityListSize = Owner.count()
		
		def max = params.max ? params.int('max') : 0
		max += RESULT_SIZE
		max = Math.min(entityListSize, max)
		
		def showMoreSize = entityListSize - max
		showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
		
		params.max = max
		[ownerInstanceList: Owner.findAllByUser(springSecurityService.getCurrentUser(), params), max: max, showMoreSize: showMoreSize]	
    }

    def create = {
        def ownerInstance = new Owner()
        ownerInstance.properties = params
        return [ownerInstance: ownerInstance, vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()}]
    }

    def save = {
        def ownerInstance = new Owner(params)
		ownerInstance.user = springSecurityService.getCurrentUser()
        if (ownerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'owner.label', default: 'Owner'), ownerInstance.id])}"
            redirect(action: "show", id: ownerInstance.id)
        }
        else {
            render(view: "create", model: [ownerInstance: ownerInstance, vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()}])
        }
    }

    def show = {
        def ownerInstance = Owner.get(params.id)
        if (!ownerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'owner.label', default: 'Owner'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ownerInstance: ownerInstance]
        }
    }

    def edit = {
        def ownerInstance = Owner.get(params.id)
        if (!ownerInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'owner.label', default: 'Owner'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ownerInstance: ownerInstance, vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()}]
        }
    }

    def update = {
        def ownerInstance = Owner.get(params.id)
        if (ownerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ownerInstance.version > version) {
                    
                    ownerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'owner.label', default: 'Owner')] as Object[], "Another user has updated this Owner while you were editing")
                    render(view: "edit", model: [ownerInstance: ownerInstance, vehicleSelectOptions: Vehicle.findAll{user == springSecurityService.getCurrentUser()}])
                    return
                }
            }
            ownerInstance.properties = params
            if (!ownerInstance.hasErrors() && ownerInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'owner.label', default: 'Owner'), ownerInstance.id])}"
                redirect(action: "show", id: ownerInstance.id)
            }
            else {
                render(view: "edit", model: [ownerInstance: ownerInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'owner.label', default: 'Owner'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ownerInstance = Owner.get(params.id)
        if (ownerInstance) {
            try {
                ownerInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'owner.label', default: 'Owner'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'owner.label', default: 'Owner'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'owner.label', default: 'Owner'), params.id])}"
            redirect(action: "list")
        }
    }
}
