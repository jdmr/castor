modules = {
    application {
        resource url:'js/application.js'
    }

    base {
        dependsOn('bootstrap')
        resource url:'css/main.css'
    }
}