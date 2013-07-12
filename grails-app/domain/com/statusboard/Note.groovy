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

class Note implements Comparable {
    String title
    //String type
    String text
    Staff creator

    DateTime dateCreated
    DateTime lastUpdated

    static transients = ['_deleted']
    static belongsTo = [Apparatus, Shift]

    static mapping = {
        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    static constraints = {
        title(nullable: true)
        text(nullable: true)
        //type(nullable: true)
        creator(nullable: true)
    }

    String toString() {
        return (text)
    }

    int compareTo(other) {
        return title.compareTo(other.title)
    }
}
