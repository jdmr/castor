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

@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class AdminController {

    def index() {
        redirect(controller: 'user')
    }

    def events(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.sort = 'date'
        params.order = 'desc'
        if (params.filter) {
            respond Event.search(params.filter).list(params), model: [eventInstanceCount: Event.search(params.filter).count()]
        } else {
            respond Event.list(params), model:[eventInstanceCount: Event.count()]
        }
    }

    def event(Event eventInstance) {
        respond eventInstance
    }

    @Transactional
    def deleteEvent(Event eventInstance) {
        eventInstance.delete(flush:true)
        flash.message = "Event ${eventInstance.name} has been deleted!"
        redirect action: 'events'
    }
}
