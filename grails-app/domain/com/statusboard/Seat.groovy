package com.statusboard

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Seat implements Comparable<Seat> {
    String name
    Integer number

    DateTime dateCreated
    DateTime lastUpdated

    static mapping = {
        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }
    static constraints = {
        name()
        number()
    }

    int compareTo(Seat t) {
        number <=> t.number
    }

    String toString() {
        name
    }
}
