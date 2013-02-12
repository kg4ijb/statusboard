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

import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.ui.AbstractS2UiController
import org.springframework.dao.DataIntegrityViolationException

class StaffController extends AbstractS2UiController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [staffInstanceList: Staff.listOrderByLastName(params), staffInstanceTotal: Staff.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        def staff = lookupUserClass().newInstance(params)

        def roles = Role.listOrderByAuthority()

        [staff: staff, authorityList: roles]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {
        println("DEBUG: staffController.save: ${params}")
        def staffInstance = new Staff(params)

        if (!staffInstance.save(flush: true)) {

            render(view: "create", model: [staffInstance: staffInstance])
            return
        }

        if (params.containsKey('authorities.id')) {
            def adminRole = Role.findWhere(authority: 'ROLE_ADMIN')
            def userRole = Role.findWhere(authority: 'ROLE_USER')
            // remove all roles and rebuild
            //UserRole.removeAll(staffInstance)
            List<String> plist = params.list('authorities.id')
            plist.each {
                if (it.toString() == adminRole.authority) {
                    //println("   adding admin role")
                    UserRole.create(staffInstance, adminRole, true)
                }
                if (it.toString() == userRole.authority) {
                    //println("   adding user role")
                    UserRole.create(staffInstance, userRole, true)
                }
            }
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'staff.label', default: 'Staff'), staffInstance.id])
        redirect(action: "show", id: staffInstance.id)
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN'])
    def show(Long id) {
        def staffInstance = Staff.get(id)
        if (!staffInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'staff.label', default: 'Staff'), id])
            redirect(action: "list")
            return
        }

        //println("DEBUG: staff role: ${staffInstance.getAuthorities().authority}")

        [staffInstance: staffInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def staffInstance = Staff.get(id)
        if (!staffInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'staff.label', default: 'Staff'), id])
            redirect(action: "list")
            return
        }

        [staffInstance: staffInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {

        def staffInstance = Staff.get(id)
        if (!staffInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'staff.label', default: 'Staff'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (staffInstance.version > version) {
                staffInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'staff.label', default: 'Staff')] as Object[],
                        "Another user has updated this Staff while you were editing")
                render(view: "edit", model: [staffInstance: staffInstance])
                return
            }
        }

        staffInstance.properties = params
        if (params.containsKey('authorities.id')) {
            def adminRole = Role.findWhere(authority: 'ROLE_ADMIN')
            def userRole = Role.findWhere(authority: 'ROLE_USER')
            // remove all roles and rebuild
            UserRole.removeAll(staffInstance)
            List<String> plist = params.list('authorities.id')
            plist.each {
                if (it.toString() == adminRole.authority) {
                    //println("   adding admin role")
                    UserRole.create(staffInstance, adminRole, true)
                }
                if (it.toString() == userRole.authority) {
                    //println("   adding user role")
                    UserRole.create(staffInstance, userRole, true)
                }
            }
        }

        if (!staffInstance.save(flush: true)) {
            render(view: "edit", model: [staffInstance: staffInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'staff.label', default: 'Staff'), staffInstance.id])
        redirect(action: "show", id: staffInstance.id)
    }

    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def staffInstance = Staff.get(id)
        if (!staffInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'staff.label', default: 'Staff'), id])
            redirect(action: "list")
            return
        }

        try {
            lookupUserRoleClass().removeAll(staffInstance)
            staffInstance.delete(flush: true)

            flash.message = message(code: 'default.deleted.message', args: [message(code: 'staff.label', default: 'Staff'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'staff.label', default: 'Staff'), id])
            redirect(action: "show", id: id)
        }
    }
}
