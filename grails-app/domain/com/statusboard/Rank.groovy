/*
* Describes ranks
*
* Rank: FF1, ... Lt, Capt, etc
* Description: long discription for Rank
* */

package com.statusboard

class Rank {
    String rank
    String description

    static constraints = {
        rank(nullable: false, blank: false, unique: true)
        description(nullable: false, blank: false)
    }

    String toString() {
        return "${description}"
    }
}
