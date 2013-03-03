package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_MANAGER'])
class DerbyController {
	def springSecurityService
	
	private static final int RESULT_SIZE = 10

    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def derbyInstanceListSize = Derby.count()
		
		def max = params.max ? params.int('max') : 0
		max += RESULT_SIZE
		max = Math.min(derbyInstanceListSize, max)
		
		def showMoreSize = derbyInstanceListSize - max
		showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
		
		params.max = max
		params.sort = 'id'
		params.order = 'desc'
		[derbyInstanceList: Derby.findByUser(springSecurityService.getCurrentUser(), params), max: max, showMoreSize: showMoreSize]
    }

    def create = {
        def derbyInstance = new Derby()
        derbyInstance.properties = params
        return [derbyInstance: derbyInstance]
    }

    def save = {
        def derbyInstance = new Derby(params)
		derbyInstance.user = springSecurityService.getCurrentUser()
        if (derbyInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'derby.label', default: 'Derby'), derbyInstance.id])}"
            redirect(action: "list", params: params)
        }
        else {
            render(view: "create", model: [derbyInstance: derbyInstance])
        }
    }

    def show = {
        def derbyInstance = Derby.get(params.id)
        if (!derbyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'derby.label', default: 'Derby'), params.id])}"
            redirect(action: "list")
        }
        else {
            [derbyInstance: derbyInstance]
        }
    }

    def edit = {
        def derbyInstance = Derby.get(params.id)
        if (!derbyInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'derby.label', default: 'Derby'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [derbyInstance: derbyInstance]
        }
    }

    def update = {
        def derbyInstance = Derby.get(params.id)
        if (derbyInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (derbyInstance.version > version) {
                    
                    derbyInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'derby.label', default: 'Derby')] as Object[], "Another user has updated this Derby while you were editing")
                    render(view: "edit", model: [derbyInstance: derbyInstance])
                    return
                }
            }
            derbyInstance.properties = params
            if (!derbyInstance.hasErrors() && derbyInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'derby.label', default: 'Derby'), derbyInstance.id])}"
                redirect(action: "show", id: derbyInstance.id)
            }
            else {
                render(view: "edit", model: [derbyInstance: derbyInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'derby.label', default: 'Derby'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def derbyInstance = Derby.get(params.id)
        if (derbyInstance) {
            try {
                derbyInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'derby.label', default: 'Derby'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'derby.label', default: 'Derby'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'derby.label', default: 'Derby'), params.id])}"
            redirect(action: "list")
        }
    }
}
