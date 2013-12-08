package castor

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured('ROLE_USER')
@Transactional(readOnly = true)
class ProfileController {

    def springSecurityService

    static allowedMethods = [update: "POST", edit: "GET", index: "GET"]

    def index() {
        redirect(action: 'edit', params: params)
    }

    def edit() {
        User user = springSecurityService.currentUser
        user.refresh()
        return [user: user]
    }

    @Transactional
    def update(User user) {
        if (user.hasErrors()) {
            log.debug("Has errors ${user.errors}")
            respond user.errors, view:'edit'
            return
        }

        user.save(flush: true)

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect controller: 'home'
    }
}
