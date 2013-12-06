modules = {
    application {
        resource url:'js/application.js'
    }

    base {
        dependsOn('jquery-ui,bootstrap')
        resource url:'css/magnific-popup.css'
        resource url:'css/main.css'
        resource url:'js/magnific-popup.js'
        resource url:'js/application.js'
    }
}