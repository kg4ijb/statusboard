modules = {
    application {
        resource url: 'js/application.js'
    }

    jqueryui {
        resource url: 'js/jquery-ui.js'
        dependsOn('jquery')
    }

    jquerybmsselect {
        resource url: 'js/jquery.bsmselect.js'
        resource url: 'js/jquery.bsmselect.sortable.js'
        resource url: 'js/jquery.bsmselect.compatability.js'
        resource url: 'css/jquery.bsmselect.css'
        dependsOn('jqueryui')
    }

    bootstrap {
        dependsOn('jquery')
        resource url: 'js/bootstrap.js'
        resource url: 'css/bootstrap.css'
    }
}
