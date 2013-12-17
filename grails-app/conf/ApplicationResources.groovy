modules = {
    application {
        resource url:'js/application.js'
    }

    base {
        dependsOn('jquery-ui,bootstrap')
        resource url:'css/magnific-popup.css'
        resource url:'css/app.css'
        resource url:'js/magnific-popup.js'
        resource url:'js/application.js'
    }

    wysiwyg {
        dependsOn 'jquery'
        defaultBundle false

        resource url: 'js/ckeditor/ckeditor.js', disposition: 'head', exclude: 'hashandcache'
        resource url: 'js/wysiwyg.js'
    }
}