package com.sourceallies

import org.springframework.dao.DataIntegrityViolationException

class LaneController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [laneInstanceList: Lane.list(params), laneInstanceTotal: Lane.count()]
    }

    def create() {
        [laneInstance: new Lane(params)]
    }

    def save() {
        def laneInstance = new Lane(params)
        if (!laneInstance.save(flush: true)) {
            render(view: "create", model: [laneInstance: laneInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'lane.label', default: 'Lane'), laneInstance.id])
        redirect(action: "show", id: laneInstance.id)
    }

    def show() {
        def laneInstance = Lane.get(params.id)
        if (!laneInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])
            redirect(action: "list")
            return
        }

        [laneInstance: laneInstance]
    }

    def edit() {
        def laneInstance = Lane.get(params.id)
        if (!laneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])
            redirect(action: "list")
            return
        }

        [laneInstance: laneInstance]
    }

    def update() {
        def laneInstance = Lane.get(params.id)
        if (!laneInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (laneInstance.version > version) {
                laneInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'lane.label', default: 'Lane')] as Object[],
                          "Another user has updated this Lane while you were editing")
                render(view: "edit", model: [laneInstance: laneInstance])
                return
            }
        }

        laneInstance.properties = params

        if (!laneInstance.save(flush: true)) {
            render(view: "edit", model: [laneInstance: laneInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'lane.label', default: 'Lane'), laneInstance.id])
        redirect(action: "show", id: laneInstance.id)
    }

    def delete() {
        def laneInstance = Lane.get(params.id)
        if (!laneInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])
            redirect(action: "list")
            return
        }

        try {
            laneInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lane.label', default: 'Lane'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
