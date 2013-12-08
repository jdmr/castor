package castor

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured('permitAll')
@Transactional(readOnly = true)
class EventController {

    def index() {}
}
