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

class RidingAssignmentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ridingAssignmentInstanceList: RidingAssignment.list(params), ridingAssignmentInstanceTotal: RidingAssignment.count()]
    }

    def create() {
        [ridingAssignmentInstance: new RidingAssignment(params)]
    }

    def save() {
        def ridingAssignmentInstance = new RidingAssignment(params)
        if (!ridingAssignmentInstance.save(flush: true)) {
            render(view: "create", model: [ridingAssignmentInstance: ridingAssignmentInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ridingAssignment.label', default: 'RidingAssignment'), ridingAssignmentInstance.id])
        redirect(action: "show", id: ridingAssignmentInstance.id)
    }

    def show(Long id) {
        def ridingAssignmentInstance = RidingAssignment.get(id)
        if (!ridingAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ridingAssignment.label', default: 'RidingAssignment'), id])
            redirect(action: "list")
            return
        }

        [ridingAssignmentInstance: ridingAssignmentInstance]
    }

    def edit(Long id) {
        def ridingAssignmentInstance = RidingAssignment.get(id)
        if (!ridingAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ridingAssignment.label', default: 'RidingAssignment'), id])
            redirect(action: "list")
            return
        }

        [ridingAssignmentInstance: ridingAssignmentInstance]
    }

    def update(Long id, Long version) {
        def ridingAssignmentInstance = RidingAssignment.get(id)
        if (!ridingAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ridingAssignment.label', default: 'RidingAssignment'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ridingAssignmentInstance.version > version) {
                ridingAssignmentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'ridingAssignment.label', default: 'RidingAssignment')] as Object[],
                        "Another user has updated this RidingAssignment while you were editing")
                render(view: "edit", model: [ridingAssignmentInstance: ridingAssignmentInstance])
                return
            }
        }

        ridingAssignmentInstance.properties = params

        if (!ridingAssignmentInstance.save(flush: true)) {
            render(view: "edit", model: [ridingAssignmentInstance: ridingAssignmentInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ridingAssignment.label', default: 'RidingAssignment'), ridingAssignmentInstance.id])
        redirect(action: "show", id: ridingAssignmentInstance.id)
    }

    def delete(Long id) {
        def ridingAssignmentInstance = RidingAssignment.get(id)
        if (!ridingAssignmentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ridingAssignment.label', default: 'RidingAssignment'), id])
            redirect(action: "list")
            return
        }

        try {
            ridingAssignmentInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ridingAssignment.label', default: 'RidingAssignment'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ridingAssignment.label', default: 'RidingAssignment'), id])
            redirect(action: "show", id: id)
        }
    }
}
