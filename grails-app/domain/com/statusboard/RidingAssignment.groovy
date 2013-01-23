package com.statusboard

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class RidingAssignment {

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
}
