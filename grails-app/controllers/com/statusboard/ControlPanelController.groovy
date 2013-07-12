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

import org.joda.time.DateTime
import org.springframework.security.access.annotation.Secured

@Secured(['IS_AUTHENTICATED_FULLY'])
class ControlPanelController {
    def springSecurityService
    def shiftService

    def index() {
        def notes = "System notes to users would appear here."

        [notes: notes]
    }

    def personnel() {
        def losapInstance = LOSAP.findAllWhere(offDuty: null)
        def staffInstance = Staff

        losapInstance.each {
            println("${staffInstance.get(it.staffId)}")
        }
        println("DEBUG: losapInstance: ${losapInstance}  ${staffInstance}")

        [losapInstance: losapInstance, staffInstance: staffInstance]
    }

    def savePersonnel() {

        // We need to set everyone off-duty here to catch whether whosHereId was empty/undefined
        // set everyone offDuty
        def offDuty = LOSAP.findAllWhere(offDuty: null)
        offDuty.each {
            it.offDuty = new DateTime()
            if (!it.save(flush: true)) {
                it.errors.each { println("DEBUG: offDuty: ${it}") }
            }
        }

        // if params comes in without whosHere (users), just forget about it...
        if (params.containsKey('whosHereId')) {
            println("ContainsKey is TRUE")

            LOSAP losapInstance = null
            def staffInstance = null
            def staffInstance1 = null
            def imHere = []
            println("DEBUG: ${params}")
            imHere = imHere + params.list("whosHereId")
            println("DEBUG: imHere Size: ${imHere.size()}; ${imHere}")

            //staffInstance = Staff.getAll()
            if (imHere != null) {
                println("DEBUG: imHere != 0: ${imHere}")
                staffInstance1 = Staff.getAll(imHere)

                if (staffInstance1 == null) {
                    println("DEBUG: staffInstance1 is null")

                } else {

                    // loop through staff and add users to losap onDuty
                    staffInstance1.each {
                        println("DEBUG: Adding new LOSAP record for user ${staffInstance1.lastName}")
                        //Staff staffInstance3 = Staff.get(staffInstance1)
                        losapInstance = new LOSAP(staff: it, onDuty: new DateTime())
                        if (!losapInstance.save(flush: true)) {
                            losapInstance.errors.each {
                                println("DEBUG: ${it}")
                            }

                        }
                    }

                }
            } else {
                //def offDuty = LOSAP.findAllWhere(offDuty: null)
                println("DEBUG: ImHere Size <= 0")
                /*offDuty.each {
                    it.offDuty = new DateTime()
                    if (!it.save(flush: true)) {
                        it.errors.each {println("DEBUG: offDuty: ${it}")}
                    }
                } */

            }
        }
        redirect(action: "index")

    }

    def newShift() {
        def stationCommanders = null
        def dutyOfficers = null
        def stationCommandersQuery = null
        def dutyOfficersQuery = null
        def onDutyStaffQuery = null

        // get a list of "on-duty personnel (offDuty == null)
        def losapInstance = LOSAP.where {
            offDuty == null
        }

        if (losapInstance.count() == 0) {
            flash.message = "<strong>Error!</strong> No on-duty personnel defined. Goto Shift->Staff Login"
            redirect(action: "personnel")
            return
        } else {
            //println("DEBUG: NewShift LOSAP has ${losapInstance.count()} records")
            //losapInstance.each {
            //    println("DEBUG: newShift losap contains: staffId:${it.staffId}, offDuty:${it.offDuty}")
            //}

            /*
                Okay, I really don't like this query but it works for now

                TODO: Fix this so that it passes application level variables for rank searches.
             */

            stationCommandersQuery = LOSAP.executeQuery(
                    """select distinct l.staff.id from LOSAP l where l.offDuty = null and
                        (l.staff.rank.rank = 'CPT' or l.staff.rank.rank = 'LT') order by l.staff.id
                    """
            )

            dutyOfficersQuery = LOSAP.executeQuery(
                    """select distinct l.staff.id from LOSAP l where l.offDuty = null and
                        (l.staff.rank.rank = 'CPT' or l.staff.rank.rank = 'BC' or l.staff.rank.rank = 'AC' or
                        l.staff.rank.rank = 'DC' or l.staff.rank.rank = 'C') order by l.staff.id
                        """
            )
            onDutyStaffQuery = LOSAP.executeQuery("select distinct l.staff.id from LOSAP l where l.offDuty = null order by l.staff.id")
        }

        if (stationCommandersQuery != null) {
            stationCommanders = Staff.getAll(stationCommandersQuery)
            //println("Station" +
            //        " CommanderQuery : ${stationCommandersQuery}, StationCommander Count: ${stationCommanders.id}")

        }

        if (dutyOfficersQuery != null) {
            dutyOfficers = Staff.getAll(dutyOfficersQuery)
            //println("DO Query: ${dutyOfficersQuery}")
        }

        def onDutyStaffx = null
        Map<Integer, String> staffSelectMap = [:]
        if (onDutyStaffQuery != null) {
            onDutyStaffx = Staff.getAll(onDutyStaffQuery)
            List<Staff> onDutyStaffList = onDutyStaffx.sort { it.lastName }
            //println("DEBUG: onDutyStaff: ${onDutyStaffList}")
            onDutyStaffList.each { Staff staff ->
                staffSelectMap.put(staff.id.toInteger(), "${staff.firstName} ${staff.lastName}")
            }

            //println("DEBUG: staffSelectMap: ${staffSelectMap}")
        }

        def dutyShiftInstance = DutyShift.getAll()
        def dutyTimeInstance = DutyTime.getAll()
        def apparatusInstance = Apparatus.listOrderByDescription()
        def apparatusStatusInstance = ApparatusStatus.getAll()

        def shiftInstance = new Shift()

        [
                dutyOfficers: dutyOfficers, stationCommanders: stationCommanders, dutyShiftInstance: dutyShiftInstance,
                dutyTimeInstance: dutyTimeInstance, apparatusInstance: apparatusInstance,
                apparatusStatusInstance: apparatusStatusInstance, staffSelectMap: staffSelectMap,
                shiftInstance: shiftInstance, onDutyStaffx: onDutyStaffx
        ]
    }


    def newShiftCreate() {

        println("${params}")

        // who's logged in
        def principal = springSecurityService.principal
        String username = principal.username
        def userInstance = Staff.findWhere(username: username)


        def shiftInstance = new Shift(params)
        def noteInstance = null

        /*
            TODO: This is really bad coding, not DRY at the very least...
         */

        if (params.containsKey('shiftNotes')) {
            noteInstance = new Note(creator: userInstance,
                    text: params.shiftNotes.id,
                    title: new DateTime().toString())

            if (!noteInstance.validate()) {
                noteInstance.errors.each {
                    println(it)
                }
            } else {
                noteInstance.save(flush: true)
                shiftInstance.notes = noteInstance
            }

        } else {
            noteInstance = new Note(creator: userInstance)
            shiftInstance.notes = noteInstance
        }

        // Set the apparatus status
        shiftService.setApparatusStatus(params)

        // Set the seat assignments
        shiftService.setSeatAssignments(params)

        shiftInstance.save(flush: true)

        return [shiftInstance: shiftInstance]
    }




    def newShiftSave() {

        def shiftInstance = new Shift(params)
        if (!shiftInstance.save(flush: true)) {
            shiftInstance.errors.each {
                println("DEBUG: new shift save error: ${it}")
                render(view: "newShift", model: [shiftInstance: shiftInstance])
            }
        }
    }

    def editCurrentShift() {
        //def currentDateTime = DateTime().now()
        def query = "select distinct * limit 1"

        // Get the last updated shift.
        def shiftInstance = Shift.listOrderByDateCreated(max: 1, order: "desc")
        // Find the most
        def ridingAssignmentList = RidingAssignment.listOrderByLastUpdated(order: "desc", max: 1)
        log.error(ridingAssignmentList[0].staff)
        def search = "Charlottesville"
        //def baseurl = "http://api.openweathermap.org/data/2.5/find?q=Charlottesville&units=imperial"
        //def json = baseurl.toURL().text
        //def data = new JsonSlurper().parseText(json)
        def url = new URL("http://weather.yahooapis.com/forecastrss?w=12767088").getText()
        def xml = new XmlSlurper().parseText(url)
        //println xml.attribute("count")
        println shiftInstance[0]

        [shiftInstance: shiftInstance[0], ridingAssignmentList: ridingAssignmentList, data: xml]
    }
}
