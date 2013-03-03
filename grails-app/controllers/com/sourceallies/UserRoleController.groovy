package com.sourceallies

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class UserRoleController {
	
	private static final int RESULT_SIZE = 10

    static allowedMethods = [save: "POST", update: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
		def userRoleInstanceListSize = UserRole.count()
		
		def max = params.max ? params.int('max') : 0
		max += RESULT_SIZE
		max = Math.min(userRoleInstanceListSize, max)
		
		def showMoreSize = userRoleInstanceListSize - max
		showMoreSize = Math.min(showMoreSize, RESULT_SIZE)
		
		params.max = max
		params.sort = 'id'
		params.order = 'desc'
		[userRoleInstanceList: UserRole.list(params), max: max, showMoreSize: showMoreSize]
    }

    def create = {
        def userRoleInstance = new UserRole()
        userRoleInstance.properties = params
        return [userRoleInstance: userRoleInstance]
    }

    def save = {
        def userRoleInstance = new UserRole(params)
        if (userRoleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])}"
            redirect(action: "list", params: params)
        }
        else {
            render(view: "create", model: [userRoleInstance: userRoleInstance])
        }
    }

    def show = {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userRoleInstance: userRoleInstance]
        }
    }

    def edit = {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userRoleInstance: userRoleInstance]
        }
    }

    def update = {
        def userRoleInstance = UserRole.get(params.id)
        if (userRoleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userRoleInstance.version > version) {
                    
                    userRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userRole.label', default: 'UserRole')] as Object[], "Another user has updated this UserRole while you were editing")
                    render(view: "edit", model: [userRoleInstance: userRoleInstance])
                    return
                }
            }
            userRoleInstance.properties = params
            if (!userRoleInstance.hasErrors() && userRoleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])}"
                redirect(action: "show", id: userRoleInstance.id)
            }
            else {
                render(view: "edit", model: [userRoleInstance: userRoleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userRoleInstance = UserRole.get(params.id)
        if (userRoleInstance) {
            try {
                userRoleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
    }
}
