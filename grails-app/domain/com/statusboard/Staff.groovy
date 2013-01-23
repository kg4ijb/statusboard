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
        fdid(blank: false, unique: true, maxSize: 4)
        //isMedic()
        isCarDriver()
        isEngineDriver()
        isTruckDriver()
    }

    String toString() {
        return ("${firstName} ${lastName}")
    }
}
