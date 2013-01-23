package com.statusboard

import org.springframework.dao.DataIntegrityViolationException

class DutyShiftController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dutyShiftInstanceList: DutyShift.list(params), dutyShiftInstanceTotal: DutyShift.count()]
    }

    def create() {
        [dutyShiftInstance: new DutyShift(params)]
    }

    def save() {
        def dutyShiftInstance = new DutyShift(params)
        if (!dutyShiftInstance.save(flush: true)) {
            render(view: "create", model: [dutyShiftInstance: dutyShiftInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'shifts.label', default: 'Shifts'), dutyShiftInstance.id])
        redirect(action: "show", id: dutyShiftInstance.id)
    }

    def show(Long id) {
        def dutyShiftInstance = DutyShift.get(id)
        if (!dutyShiftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shifts.label', default: 'Shifts'), id])
            redirect(action: "list")
            return
        }

        [dutyShiftInstance: dutyShiftInstance]
    }

    def edit(Long id) {
        def dutyShiftInstance = DutyShift.get(id)
        if (!dutyShiftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shifts.label', default: 'Duty Shifts'), id])
            redirect(action: "list")
            return
        }

        [dutyShiftInstance: dutyShiftInstance]
    }

    def update(Long id, Long version) {
        def dutyShiftInstance = DutyShift.get(id)
        if (!dutyShiftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shifts.label', default: 'Duty Shift'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dutyShiftInstance.version > version) {
                dutyShiftInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'shifts.label', default: 'Shifts')] as Object[],
                        "Another user has updated this Duty Shift while you were editing")
                render(view: "edit", model: [dutyShiftInstance: dutyShiftInstance])
                return
            }
        }

        dutyShiftInstance.properties = params

        if (!dutyShiftInstance.save(flush: true)) {
            render(view: "edit", model: [dutyShiftInstance: dutyShiftInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'shifts.label', default: 'Shifts'), dutyShiftInstance.id])
        redirect(action: "show", id: dutyShiftInstance.id)
    }

    def delete(Long id) {
        def dutyShiftInstance = DutyShift.get(id)
        if (!dutyShiftInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'shifts.label', default: 'Duty Shift'), id])
            redirect(action: "list")
            return
        }

        try {
            dutyShiftInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'shifts.label', default: 'Shifts'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'shifts.label', default: 'Shifts'), id])
            redirect(action: "show", id: id)
        }
    }
}
