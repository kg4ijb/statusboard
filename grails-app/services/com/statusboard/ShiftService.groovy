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

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class ShiftService {

    /*
        given parameters
        determine
        - what the apparatus is
        - what seat on apparatus are we referencing
        - who's sitting there
        persit to new com.statusboard.RidingAssignment

     */

    def setSeatAssignments(GrailsParameterMap grailsParameterMap) {
        def appKey
        def appValue
        def appInstance = null
        def staffInstance = null
        def seatInstance = null
        def ridingAssignmentInstance = null


        for (int i = 1; i <= Apparatus.count; i++) {
            appInstance = Apparatus.get(i)
            staffInstance = null
            seatInstance = null

            if (appInstance) {
                for (int x = 1; x <= appInstance.numSeats; x++) {
                    staffInstance = null
                    seatInstance = null
                    ridingAssignmentInstance = null
                    appKey = 'app' << i.toString() << '_seat' << x.toString() << '.id'
                    if (grailsParameterMap.containsKey(appKey.toString())) {
                        appValue = grailsParameterMap.get(appKey.toString())
                        if (appValue != "null") {
                            staffInstance = Staff.get(appValue.toInteger())
                        }

                        if (staffInstance) {
                            seatInstance = Seat.get(x.toInteger())
                        }
                    }
                    if (seatInstance && staffInstance) {
                        ridingAssignmentInstance = new RidingAssignment(
                                apparatus: appInstance,
                                seat: seatInstance,
                                staff: staffInstance)

                        if (!ridingAssignmentInstance.save(flush: true)) {
                            ridingAssignmentInstance.errors.each {
                                println(it)
                            }
                        }
                    }
                }
            }
        }
    }
/*
        When passed the shift parameters, iterate through them and determine what the
        current apparatus status is, then persist to com.statusboard.Apparatus

        parameters: grailsParameterMap
     */

    def setApparatusStatus(GrailsParameterMap grailsParameterMap) {

        def app = null
        def appKey
        def appValue

        for (int i = 1; i <= Apparatus.count; i++) {
            appKey = 'app_status' << i.toString() << '.id'
            if (grailsParameterMap.containsKey(appKey.toString())) {
                app = Apparatus.get(i)
                if (app) {
                    appValue = grailsParameterMap.get(appKey.toString())
                    app.status = ApparatusStatus.get(appValue.toInteger())
                }
            }
        }
    }
}
