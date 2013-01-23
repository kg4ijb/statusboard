package com.statusboard

import org.springframework.dao.DataIntegrityViolationException

class ApparatusStatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [apparatusStatusInstanceList: ApparatusStatus.list(params), apparatusStatusInstanceTotal: ApparatusStatus.count()]
    }

    def create() {
        [apparatusStatusInstance: new ApparatusStatus(params)]
    }

    def save() {
        def apparatusStatusInstance = new ApparatusStatus(params)
        if (!apparatusStatusInstance.save(flush: true)) {
            render(view: "create", model: [apparatusStatusInstance: apparatusStatusInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'apparatusStatus.label', default: 'ApparatusStatus'), apparatusStatusInstance.id])
        redirect(action: "show", id: apparatusStatusInstance.id)
    }

    def show(Long id) {
        def apparatusStatusInstance = ApparatusStatus.get(id)
        if (!apparatusStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apparatusStatus.label', default: 'ApparatusStatus'), id])
            redirect(action: "list")
            return
        }

        [apparatusStatusInstance: apparatusStatusInstance]
    }

    def edit(Long id) {
        def apparatusStatusInstance = ApparatusStatus.get(id)
        if (!apparatusStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apparatusStatus.label', default: 'ApparatusStatus'), id])
            redirect(action: "list")
            return
        }

        [apparatusStatusInstance: apparatusStatusInstance]
    }

    def update(Long id, Long version) {
        def apparatusStatusInstance = ApparatusStatus.get(id)
        if (!apparatusStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apparatusStatus.label', default: 'ApparatusStatus'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (apparatusStatusInstance.version > version) {
                apparatusStatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'apparatusStatus.label', default: 'ApparatusStatus')] as Object[],
                        "Another user has updated this ApparatusStatus while you were editing")
                render(view: "edit", model: [apparatusStatusInstance: apparatusStatusInstance])
                return
            }
        }

        apparatusStatusInstance.properties = params

        if (!apparatusStatusInstance.save(flush: true)) {
            render(view: "edit", model: [apparatusStatusInstance: apparatusStatusInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'apparatusStatus.label', default: 'ApparatusStatus'), apparatusStatusInstance.id])
        redirect(action: "show", id: apparatusStatusInstance.id)
    }

    def delete(Long id) {
        def apparatusStatusInstance = ApparatusStatus.get(id)
        if (!apparatusStatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apparatusStatus.label', default: 'ApparatusStatus'), id])
            redirect(action: "list")
            return
        }

        try {
            apparatusStatusInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'apparatusStatus.label', default: 'ApparatusStatus'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'apparatusStatus.label', default: 'ApparatusStatus'), id])
            redirect(action: "show", id: id)
        }
    }
}
