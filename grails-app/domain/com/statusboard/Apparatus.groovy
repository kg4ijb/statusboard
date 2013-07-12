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
* Describes apparatus
*
* Name: short names ie, E81
* Description: long name ie, Engine 81
* isALS: bool indicating whether apparatus has ALS package
* isRescue: bool indicating whether apparatus has Rescue package
* Status: object indicating current status, ie, in-service
* */

package com.statusboard

class Apparatus {
    String name
    String description
    ApparatusStatus status
    Note note
    Integer numSeats

    boolean isALS = false
    boolean isRescue = false

    SortedSet notes

    static hasMany = [notes: Note]

    static mapping = {
        notes cascade: "all-delete-orphan"
        notes column: 'apparatus_note_id', joinTable: false
    }

    static constraints = {
        name(nullable: false, blank: false, unique: true)
        description(nullable: false, blank: false)
        isALS()
        isRescue()
        numSeats()
        note(nullable: true)
    }

    String toString() {
        return "${name}"
    }
}
