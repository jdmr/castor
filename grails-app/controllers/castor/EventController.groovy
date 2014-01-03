package castor

import grails.plugin.springsecurity.annotation.Secured
import org.apache.commons.lang.RandomStringUtils

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Secured('ROLE_USER')
@Transactional(readOnly = true)
class EventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService
    def mailService

    @Secured('permitAll')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if (params.filter) {
            respond Event.upcoming().sorted().search(params.filter).list(params), model: [eventInstanceCount: Event.upcoming().search(params.filter).count()]
        } else {
            respond Event.upcoming().sorted().list(params), model:[eventInstanceCount: Event.upcoming().count()]
        }
    }

    @Secured('permitAll')
    def show(Event eventInstance) {
        respond eventInstance
    }

    def create() {
        Event event = new Event(params)
        event.code = RandomStringUtils.random(6,true,true)
        event.member = springSecurityService.currentUser
        respond event
    }

    @Transactional
    def save(Event eventInstance) {
        if (eventInstance == null) {
            notFound()
            return
        }

        eventInstance.member = springSecurityService.currentUser

        if (eventInstance.hasErrors()) {
            log.error("Found errors! ${eventInstance.errors}")
            respond eventInstance.errors, view:'create'
            return
        }

        eventInstance.save flush:true

        Message finished = Message.findByName(Constants.CODE)
        String content = finished.content
        content = content.replaceAll('@@CODE@@', eventInstance.code)
        content = content.replaceAll('@@NAME@@', eventInstance.member.name)
        content = content.replaceAll('@@EVENT@@', eventInstance.name)
        mailService.sendMail {
            to eventInstance.member.username
            subject finished.subject
            html content
        }

        request.withFormat {
            form {
                render (view:'finished', model:[event:eventInstance, subject: finished.subject, eventDescription: content])
                return
            }
            '*' { respond eventInstance, [status: CREATED] }
        }
    }

    def edit(Event eventInstance) {
        respond eventInstance
    }

    @Transactional
    def update(Event eventInstance) {
        if (eventInstance == null) {
            notFound()
            return
        }

        if (eventInstance.hasErrors()) {
            respond eventInstance.errors, view:'edit'
            return
        }

        eventInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*'{ respond eventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Event eventInstance) {

        if (eventInstance == null) {
            notFound()
            return
        }

        eventInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventInstance.label', default: 'Event'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
