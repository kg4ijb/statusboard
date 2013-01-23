/*
* Describes EMS levels; EMT, EMT-P, etc
* */

package com.statusboard

class EmsLevel {
    String description

    static constraints = {
        description(blank: false, unique: true)
    }

    String toString() {
        return "${description}"
    }
}
