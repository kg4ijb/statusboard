/*
* Describes shift durations
* */

package com.statusboard

class DutyTime {
    String name

    static constraints = {
        name()
    }

    String toString() {
        return "${name}"
    }
}
