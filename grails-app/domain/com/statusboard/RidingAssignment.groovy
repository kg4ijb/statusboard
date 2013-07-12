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

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class RidingAssignment implements Comparable {

    Apparatus apparatus
    Seat seat
    Staff staff

    DateTime dateCreated
    DateTime lastUpdated

    static mapping = {
        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }


    static constraints = {
    }

    int compareTo(other) {
        return (other.id)
    }
}
