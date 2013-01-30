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

/*
* Tracks LOSAP credits; duty time per person
* */

package com.statusboard

import org.joda.time.*
import org.jadira.usertype.dateandtime.joda.*


class LOSAP {

    DateTime onDuty
    DateTime offDuty
    Staff staff

    static mapping = {
        version false
        onDuty type: PersistentDateTime
        offDuty type: PersistentDateTime
    }

    static constraints = {
        staff()
        onDuty()
        offDuty(nullable: true)
    }

    def getStaffId() {
        return staff.id
    }

}
