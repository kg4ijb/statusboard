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
