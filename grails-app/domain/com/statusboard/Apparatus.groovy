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
