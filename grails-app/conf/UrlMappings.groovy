class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'home')

        "401"(view:'/401')

        "500"(view:'/500')
	}
}
