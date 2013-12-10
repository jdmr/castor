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

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.security.crypto.keygen.KeyGenerators

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

    @Transactional
    @Secured('permitAll')
    def forgot() {
        String email = params.email;
        User user = User.findByUsername(email)
        if (user) {
            String key = KeyGenerators.string().generateKey();
            user.password = key
            user.save()

            Message forgot = Message.findByName(Constants.FORGOT_MESSAGE)
            String content = forgot.content
            content = content.replaceAll('@@NAME@@', user.name)
            content = content.replaceAll('@@USERNAME@@', user.username)
            content = content.replaceAll('@@PASSWORD@@', password)

            sendMail {
                to user.username
                subject forgot.subject
                html content
            }

            render([success: message(code: 'forgot.sent.successful.message')] as JSON)
        } else {
            render([error: message(code: 'forgot.user.does.not.exist.message')] as JSON)
        }
    }
}
