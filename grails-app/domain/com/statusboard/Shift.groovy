package com.statusboard

import org.jadira.usertype.dateandtime.joda.PersistentDateTime
import org.joda.time.DateTime

class Shift {

    DutyTime dutyTime
    DutyShift dutyShift
    Staff dutyOfficer
    Staff stationCommander
    Note notes

    DateTime dateCreated
    DateTime lastUpdated

    static mapping = {
        dateCreated type: PersistentDateTime
        lastUpdated type: PersistentDateTime
    }

    static hasMany = [apparatus: Apparatus]

    static constraints = {
        dutyTime(nullable: false)
        dutyShift(nullable: false)
        dutyOfficer(nullable: true)
        stationCommander(nullable: true)
        notes(nullable: true)
        apparatus(nullable: true)
    }
}
