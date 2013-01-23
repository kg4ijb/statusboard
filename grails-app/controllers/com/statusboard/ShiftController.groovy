package com.statusboard

import org.springframework.dao.DataIntegrityViolationException

class ShiftController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [shiftInstanceList: Shift.list(params), shiftInstanceTotal: Shift.count()]
    }

    def create() {
        [shiftInstance: new Shift(params)]
    }

    def save() {
        def shiftInstance = new Shift(params)
        if (!shiftInstance.save(flush: true)) {
            render(view: "create", model: [shiftInstance: shiftInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'shift.label', default: 'Shift'), shiftInstance.id])
        redirect(action: "show", id: shiftInstance.id)
    }

    def show(Long id) {
        def shiftInstance = Shift.get(id)
        if (!shiftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shift.label', default: 'Shift'), id])
            redirect(action: "list")
            return
        }

        [shiftInstance: shiftInstance]
    }

    def edit(Long id) {
        def shiftInstance = Shift.get(id)
        if (!shiftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shift.label', default: 'Shift'), id])
            redirect(action: "list")
            return
        }

        [shiftInstance: shiftInstance]
    }

    def update(Long id, Long version) {
        def shiftInstance = Shift.get(id)
        if (!shiftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shift.label', default: 'Shift'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (shiftInstance.version > version) {
                shiftInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'shift.label', default: 'Shift')] as Object[],
                        "Another user has updated this Shift while you were editing")
                render(view: "edit", model: [shiftInstance: shiftInstance])
                return
            }
        }

        shiftInstance.properties = params

        if (!shiftInstance.save(flush: true)) {
            render(view: "edit", model: [shiftInstance: shiftInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'shift.label', default: 'Shift'), shiftInstance.id])
        redirect(action: "show", id: shiftInstance.id)
    }

    def delete(Long id) {
        def shiftInstance = Shift.get(id)
        if (!shiftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shift.label', default: 'Shift'), id])
            redirect(action: "list")
            return
        }

        try {
            shiftInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'shift.label', default: 'Shift'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shift.label', default: 'Shift'), id])
            redirect(action: "show", id: id)
        }
    }
}
