package com.statusboard

import org.springframework.dao.DataIntegrityViolationException

class RankController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [rankInstanceList: Rank.list(params), rankInstanceTotal: Rank.count()]
    }

    def create() {
        [rankInstance: new Rank(params)]
    }

    def save() {
        def rankInstance = new Rank(params)
        if (!rankInstance.save(flush: true)) {
            render(view: "create", model: [rankInstance: rankInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'rank.label', default: 'Rank'), rankInstance.id])
        redirect(action: "show", id: rankInstance.id)
    }

    def show(Long id) {
        def rankInstance = Rank.get(id)
        if (!rankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rank.label', default: 'Rank'), id])
            redirect(action: "list")
            return
        }

        [rankInstance: rankInstance]
    }

    def edit(Long id) {
        def rankInstance = Rank.get(id)
        if (!rankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rank.label', default: 'Rank'), id])
            redirect(action: "list")
            return
        }

        [rankInstance: rankInstance]
    }

    def update(Long id, Long version) {
        def rankInstance = Rank.get(id)
        if (!rankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rank.label', default: 'Rank'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (rankInstance.version > version) {
                rankInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'rank.label', default: 'Rank')] as Object[],
                        "Another user has updated this Rank while you were editing")
                render(view: "edit", model: [rankInstance: rankInstance])
                return
            }
        }

        rankInstance.properties = params

        if (!rankInstance.save(flush: true)) {
            render(view: "edit", model: [rankInstance: rankInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'rank.label', default: 'Rank'), rankInstance.id])
        redirect(action: "show", id: rankInstance.id)
    }

    def delete(Long id) {
        def rankInstance = Rank.get(id)
        if (!rankInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rank.label', default: 'Rank'), id])
            redirect(action: "list")
            return
        }

        try {
            rankInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'rank.label', default: 'Rank'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'rank.label', default: 'Rank'), id])
            redirect(action: "show", id: id)
        }
    }
}
