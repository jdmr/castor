package castor

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured('ROLE_USER')
@Transactional(readOnly = true)
class MineController {

    def index() {}
}
