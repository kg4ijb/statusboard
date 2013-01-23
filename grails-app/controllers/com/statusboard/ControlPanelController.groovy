package com.statusboard

import grails.plugins.springsecurity.Secured
import org.joda.time.DateTime

@Secured(['IS_AUTHENTICATED_FULLY'])

class ControlPanelController {

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
        def onDutyStaff = null

        // get a list of "on-duty personnel (offDuty == null)
        def losapInstance = LOSAP.where {
            offDuty == null
        }

        if (losapInstance.count() == 0) {
            flash.message = "<strong>Error!</strong> No on-duty personnel defined. Goto Shift->Staff Login"
            redirect(action: index())
        } else {
            println("DEBUG: NewShift LOSAP has ${losapInstance.count()} records")
            losapInstance.each {
                println("DEBUG: newShift losap contains: staffId:${it.staffId}, offDuty:${it.offDuty}")
            }

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
            println("Station" +
                    " CommanderQuery : ${stationCommandersQuery}, StationCommander Count: ${stationCommanders.id}")

        }

        if (dutyOfficersQuery != null) {
            dutyOfficers = Staff.getAll(dutyOfficersQuery)
            println("DO Query: ${dutyOfficersQuery}")
        }

        def onDutyStaffx = null
        Map<Integer, String> staffSelectMap = [:]
        if (onDutyStaffQuery != null) {
            onDutyStaffx = Staff.getAll(onDutyStaffQuery)
            List<Staff> onDutyStaffList = onDutyStaffx.sort { it.lastName }
            println("DEBUG: onDutyStaff: ${onDutyStaffList}")
            onDutyStaffList.each { Staff staff ->
                staffSelectMap.put(staff.id.toInteger(), "${staff.firstName} ${staff.lastName}")
            }

            println("DEBUG: staffSelectMap: ${staffSelectMap}")
        }

        def dutyShiftInstance = DutyShift.getAll()
        def dutyTimeInstance = DutyTime.getAll()
        def apparatusInstance = Apparatus.listOrderByDescription()
        def apparatusStatusInstance = ApparatusStatus.getAll()

        println("DEBUG: onDutyStaffx")
        println("DEBUG: dutyTime")
        dutyTimeInstance.each {
            println("${it.id} : ${it.name}")
        }

        def shiftInstance = new Shift()

        [
                dutyOfficers: dutyOfficers, stationCommanders: stationCommanders, dutyShiftInstance: dutyShiftInstance,
                dutyTimeInstance: dutyTimeInstance, apparatusInstance: apparatusInstance,
                apparatusStatusInstance: apparatusStatusInstance, staffSelectMap: staffSelectMap,
                shiftInstance: shiftInstance, onDutyStaffx: onDutyStaffx
        ]
    }

    def newShiftSave() {
        params.each {
            println("${it}")
        }
        def newShift = new Shift()
        bindData(newShift, params, "newShift")
        if (!newShift.save(flush: true)) {
            newShift.errors.each {
                println("DEBUG: new shift save error: ${it}")
            }
        }

        //render([shiftInstance: shiftInstance])
    }
}
