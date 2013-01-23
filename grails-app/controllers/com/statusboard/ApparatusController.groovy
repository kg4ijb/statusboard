package com.statusboard

import org.springframework.dao.DataIntegrityViolationException

class ApparatusController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [apparatusInstanceList: Apparatus.list(params), apparatusInstanceTotal: Apparatus.count()]
    }

    def create() {
        [apparatusInstance: new Apparatus(params)]
    }

    def save() {
        def apparatusInstance = new Apparatus(params)
        if (!apparatusInstance.save(flush: true)) {
            render(view: "create", model: [apparatusInstance: apparatusInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), apparatusInstance.id])
        redirect(action: "show", id: apparatusInstance.id)
    }

    def show(Long id) {
        def apparatusInstance = Apparatus.get(id)
        if (!apparatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), id])
            redirect(action: "list")
            return
        }

        [apparatusInstance: apparatusInstance]
    }

    def edit(Long id) {
        def apparatusInstance = Apparatus.get(id)
        if (!apparatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), id])
            redirect(action: "list")
            return
        }

        [apparatusInstance: apparatusInstance]
    }

    def update(Long id, Long version) {
        def apparatusInstance = Apparatus.get(id)
        if (!apparatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (apparatusInstance.version > version) {
                apparatusInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'apparatus.label', default: 'Apparatus')] as Object[],
                        "Another user has updated this Apparatus while you were editing")
                render(view: "edit", model: [apparatusInstance: apparatusInstance])
                return
            }
        }

        apparatusInstance.properties = params

        if (!apparatusInstance.save(flush: true)) {
            render(view: "edit", model: [apparatusInstance: apparatusInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), apparatusInstance.id])
        redirect(action: "show", id: apparatusInstance.id)
    }

    def delete(Long id) {
        def apparatusInstance = Apparatus.get(id)
        if (!apparatusInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), id])
            redirect(action: "list")
            return
        }

        try {
            apparatusInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'apparatus.label', default: 'Apparatus'), id])
            redirect(action: "show", id: id)
        }
    }
}
