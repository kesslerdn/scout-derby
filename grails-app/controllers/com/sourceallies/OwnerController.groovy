package com.sourceallies

class OwnerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ownerInstanceList: Owner.list(params), ownerInstanceTotal: Owner.count()]
    }

    def create = {
        def ownerInstance = new Owner()
        ownerInstance.properties = params
        return [ownerInstance: ownerInstance]
    }

    def save = {
        def ownerInstance = new Owner(params)
        if (ownerInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'owner.label', default: 'Owner'), ownerInstance.id])}"
            redirect(action: "show", id: ownerInstance.id)
        }
        else {
            render(view: "create", model: [ownerInstance: ownerInstance])
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
            return [ownerInstance: ownerInstance]
        }
    }

    def update = {
        def ownerInstance = Owner.get(params.id)
        if (ownerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ownerInstance.version > version) {
                    
                    ownerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'owner.label', default: 'Owner')] as Object[], "Another user has updated this Owner while you were editing")
                    render(view: "edit", model: [ownerInstance: ownerInstance])
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
