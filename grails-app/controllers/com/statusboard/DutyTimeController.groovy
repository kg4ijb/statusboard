/*
 * Copyright 2005-2013 StationStatusboard.com
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.statusboard

import org.springframework.dao.DataIntegrityViolationException

class DutyTimeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dutyTimeInstanceList: DutyTime.list(params), dutyTimeInstanceTotal: DutyTime.count()]
    }

    def create() {
        [dutyTimeInstance: new DutyTime(params)]
    }

    def save() {
        def dutyTimeInstance = new DutyTime(params)
        if (!dutyTimeInstance.save(flush: true)) {
            render(view: "create", model: [dutyTimeInstance: dutyTimeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dutyTime.label', default: 'DutyTime'), dutyTimeInstance.id])
        redirect(action: "show", id: dutyTimeInstance.id)
    }

    def show(Long id) {
        def dutyTimeInstance = DutyTime.get(id)
        if (!dutyTimeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dutyTime.label', default: 'DutyTime'), id])
            redirect(action: "list")
            return
        }

        [dutyTimeInstance: dutyTimeInstance]
    }

    def edit(Long id) {
        def dutyTimeInstance = DutyTime.get(id)
        if (!dutyTimeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dutyTime.label', default: 'DutyTime'), id])
            redirect(action: "list")
            return
        }

        [dutyTimeInstance: dutyTimeInstance]
    }

    def update(Long id, Long version) {
        def dutyTimeInstance = DutyTime.get(id)
        if (!dutyTimeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dutyTime.label', default: 'DutyTime'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dutyTimeInstance.version > version) {
                dutyTimeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'dutyTime.label', default: 'DutyTime')] as Object[],
                        "Another user has updated this DutyTime while you were editing")
                render(view: "edit", model: [dutyTimeInstance: dutyTimeInstance])
                return
            }
        }

        dutyTimeInstance.properties = params

        if (!dutyTimeInstance.save(flush: true)) {
            render(view: "edit", model: [dutyTimeInstance: dutyTimeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dutyTime.label', default: 'DutyTime'), dutyTimeInstance.id])
        redirect(action: "show", id: dutyTimeInstance.id)
    }

    def delete(Long id) {
        def dutyTimeInstance = DutyTime.get(id)
        if (!dutyTimeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dutyTime.label', default: 'DutyTime'), id])
            redirect(action: "list")
            return
        }

        try {
            dutyTimeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dutyTime.label', default: 'DutyTime'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dutyTime.label', default: 'DutyTime'), id])
            redirect(action: "show", id: id)
        }
    }
}
