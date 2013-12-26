/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2013 David Mendoza
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package castor

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.NOT_FOUND

@Secured('permitAll')
@Transactional(readOnly = true)
class HomeController {

    def index() {
    }

    def code() {
        Event eventInstance = Event.findByCode(params.code)
        if (!eventInstance) {
            flash.message = 'Invalid code. Please try again'
            flash.messageStyle = 'alert-danger'
            render view:'index'
            return
        }

        if (eventInstance.seats > 0) {
            def c = Party.createCriteria()
            def rsvps = c.get {
                event {
                    idEq(eventInstance.id)
                }
                projections {
                    sum "seats"
                }
            }
            if (rsvps >= eventInstance.seats) {
                flash.message = "${eventInstance.name} is full. Sorry."
                flash.messageStyle = 'alert-danger'
                render view:'index'
                return
            }
        }

        flash.message = ''

        Party party = new Party(event: eventInstance)
        render view: 'rsvp', model: [party: party]
    }

    @Transactional
    def rsvp(Party party) {
        if (party == null) {
            notFound()
            return
        }
        if (party.hasErrors()) {
            respond party.errors, view:'rsvp'
            return
        }
        if (eventInstance.seats > 0) {
            def c = Party.createCriteria()
            def rsvps = c.get {
                event {
                    idEq(eventInstance.id)
                }
                projections {
                    sum "seats"
                }
            }
            if (rsvps + party.seats > eventInstance.seats) {
                flash.message = "There's only ${eventInstance.seats - rsvps} left."
                flash.messageStyle = 'alert-danger'
                render view:'rsvp'
                return
            }
        }

        party.save(flush:true)

        flash.message = 'Your RSVP was successfull.<br />Thank you!'
        redirect controller:'home'
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'party.label', default: 'Party'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
