package com.statusboard

import org.joda.time.DateTime

class Note {
    String title
    String type
    String text
    Staff creator

    DateTime dateCreated
    DateTime lastUpdated


    static constraints = {
        title(nullable: false, blank: false)
        text(nullable: false, blank: false)
        type(nullable: true)
        creator(nullable: false)
    }

    String toString() {
        return (text)
    }
}
