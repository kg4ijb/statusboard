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

class LOSAPController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [LOSAPInstanceList: LOSAP.list(params), LOSAPInstanceTotal: LOSAP.count()]
    }

    def create() {
        [LOSAPInstance: new LOSAP(params)]
    }

    def save() {
        def LOSAPInstance = new LOSAP(params)
        println("${params}")
        if (!LOSAPInstance.save(flush: true)) {
            render(view: "create", model: [LOSAPInstance: LOSAPInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'LOSAP.label', default: 'LOSAP'), LOSAPInstance.id])
        redirect(action: "show", id: LOSAPInstance.id)
    }

    def show(Long id) {
        def LOSAPInstance = LOSAP.get(id)
        if (!LOSAPInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'LOSAP.label', default: 'LOSAP'), id])
            redirect(action: "list")
            return
        }

        [LOSAPInstance: LOSAPInstance]
    }

    def edit(Long id) {
        def LOSAPInstance = LOSAP.get(id)
        if (!LOSAPInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'LOSAP.label', default: 'LOSAP'), id])
            redirect(action: "list")
            return
        }

        [LOSAPInstance: LOSAPInstance]
    }

    def update(Long id, Long version) {
        def LOSAPInstance = LOSAP.get(id)
        if (!LOSAPInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'LOSAP.label', default: 'LOSAP'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (LOSAPInstance.version > version) {
                LOSAPInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'LOSAP.label', default: 'LOSAP')] as Object[],
                        "Another user has updated this LOSAP while you were editing")
                render(view: "edit", model: [LOSAPInstance: LOSAPInstance])
                return
            }
        }

        LOSAPInstance.properties = params

        if (!LOSAPInstance.save(flush: true)) {
            render(view: "edit", model: [LOSAPInstance: LOSAPInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'LOSAP.label', default: 'LOSAP'), LOSAPInstance.id])
        redirect(action: "show", id: LOSAPInstance.id)
    }

    def delete(Long id) {
        def LOSAPInstance = LOSAP.get(id)
        if (!LOSAPInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'LOSAP.label', default: 'LOSAP'), id])
            redirect(action: "list")
            return
        }

        try {
            LOSAPInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'LOSAP.label', default: 'LOSAP'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'LOSAP.label', default: 'LOSAP'), id])
            redirect(action: "show", id: id)
        }
    }
}
