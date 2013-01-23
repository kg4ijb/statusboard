package org.statusboard

class FooterTagLib {

    def thisYear = {
        out << new Date().format("yyyy")
    }

    def copyright = { attrs, body ->
        out << "stationstatusboard.com " +
                "v${grailsApplication.metadata['app.version']}" +
                " build #${grailsApplication.metadata['app.buildNumber']} " +
                " &copy2005-${thisYear()}"
    }
}
