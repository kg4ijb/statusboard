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

/**
 * Staff defines a staff member and extends User which is a  class provided by
 * Spring Security.
 *
 * @author cbyam
 * @see User
 * */

package com.statusboard

class Staff extends User {

    String firstName
    String lastName

    String email

    String fdid
    Rank rank
    DutyShift dutyShift
    EmsLevel emsLevel

    //boolean isMedic = false
    boolean isEngineDriver = false
    boolean isTruckDriver = false
    boolean isCarDriver = false

    static constraints = {
        lastName(nullable: false, blank: false)
        firstName(nullable: false, blank: false)
        fdid(blank: false, unique: true, maxSize: 4, matches: '\\d{4}')
        email(email: true, blank: true)
        //isMedic()
        isCarDriver()
        isEngineDriver()
        isTruckDriver()
    }

    String toString() {
        return ("${firstName} ${lastName}")
    }
}
