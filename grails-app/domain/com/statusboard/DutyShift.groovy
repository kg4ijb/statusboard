/*
* Describes Shifts
*
* @author cbyam
*
* */
package com.statusboard

class DutyShift {
    String name
    String description

    static constraints = {
        name(nullable: false, blank: false, unique: true, maxSize: 1)
        description(nullable: false, blank: false)
    }

    String toString() {
        return "${description}"
    }
}
