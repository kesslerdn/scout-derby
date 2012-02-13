package com.sourceallies

class LaneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [laneInstanceList: Lane.list(params), laneInstanceTotal: Lane.count()]
    }

    def create = {
        def laneInstance = new Lane()
        laneInstance.properties = params
        return [laneInstance: laneInstance]
    }

    def save = {
        def laneInstance = new Lane(params)
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
            return [laneInstance: laneInstance]
        }
    }

    def update = {
        def laneInstance = Lane.get(params.id)
        if (laneInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (laneInstance.version > version) {
                    
                    laneInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'lane.label', default: 'Lane')] as Object[], "Another user has updated this Lane while you were editing")
                    render(view: "edit", model: [laneInstance: laneInstance])
                    return
                }
            }
            laneInstance.properties = params
            if (!laneInstance.hasErrors() && laneInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'lane.label', default: 'Lane'), laneInstance.id])}"
                redirect(action: "show", id: laneInstance.id)
            }
            else {
                render(view: "edit", model: [laneInstance: laneInstance])
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
