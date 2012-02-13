package com.sourceallies

class FinishTimeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [finishTimeInstanceList: FinishTime.list(params), finishTimeInstanceTotal: FinishTime.count()]
    }

    def create = {
        def finishTimeInstance = new FinishTime()
        finishTimeInstance.properties = params
        return [finishTimeInstance: finishTimeInstance]
    }

    def save = {
        def finishTimeInstance = new FinishTime(params)
        if (finishTimeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), finishTimeInstance.id])}"
            redirect(action: "show", id: finishTimeInstance.id)
        }
        else {
            render(view: "create", model: [finishTimeInstance: finishTimeInstance])
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
            return [finishTimeInstance: finishTimeInstance]
        }
    }

    def update = {
        def finishTimeInstance = FinishTime.get(params.id)
        if (finishTimeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (finishTimeInstance.version > version) {
                    
                    finishTimeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'finishTime.label', default: 'FinishTime')] as Object[], "Another user has updated this FinishTime while you were editing")
                    render(view: "edit", model: [finishTimeInstance: finishTimeInstance])
                    return
                }
            }
            finishTimeInstance.properties = params
            if (!finishTimeInstance.hasErrors() && finishTimeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'finishTime.label', default: 'FinishTime'), finishTimeInstance.id])}"
                redirect(action: "show", id: finishTimeInstance.id)
            }
            else {
                render(view: "edit", model: [finishTimeInstance: finishTimeInstance])
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
