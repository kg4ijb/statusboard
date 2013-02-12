modules = {
    application {
        resource url: 'js/application.js'
    }

    jqueryui {
        resource url: 'js/jquery-ui-1.8.24.custom.min.js'
        dependsOn('jquery')
    }

    jqueryamsselect {
        resource url: 'js/jquery.asmselect.js'
        dependsOn('jqueryui')
    }
}
