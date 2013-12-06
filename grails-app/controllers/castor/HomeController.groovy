package castor

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class HomeController {

    def springSecurityService

    def index() {
    }

    def login() {

    }
}
