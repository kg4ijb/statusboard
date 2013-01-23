/*
* Defines status attributes; ie, in-service, out-of-service, etc.
* */

package com.statusboard

class ApparatusStatus {

    String name
    //String description

    static constraints = {
        name()
    }

    String toString() {
        return "${name}"
    }
}
