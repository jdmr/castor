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

@Secured('permitAll')
class SignupController {

    static defaultAction = "free"

    def springSecurityService

    def free(User user) {
        log.debug("Validating user");
        if (user.hasErrors()) {
            if (params.ajax) {
                log.error("Error creating user ${user.username} : ${user.errors}")
                render([error: 'Errors found in the form. Please fix them and try again.'] as JSON)
                return
            }
        }

        String password = user.password

        log.debug("Creating user");
        try {
            User.withTransaction {

                user.save()

                Role roleUser = Role.findByAuthority('ROLE_USER')
                UserRole.create(user, roleUser, true)
                springSecurityService.reauthenticate(user.username, password)

                Message signup = Message.findByName(Constants.SIGN_UP)
                String content = signup.content
                content = content.replaceAll('@@NAME@@', user.name)
                content = content.replaceAll('@@USERNAME@@', user.username)
                content = content.replaceAll('@@PASSWORD@@', password)

                sendMail {
                    to user.username
                    subject signup.subject
                    html content
                }
            }
        } catch(Exception e) {
            log.error("Error creating user ${user.username}", e)
            render([forgotLink: true, error: 'That email already exists, please try with another email or <a href="#" id="forgotLink">click here to retrieve credentials</a>'] as JSON)
            return
        }

        if (params.ajax) {
            log.debug("Returning successful message")
            render([username: user.username, success: "Welcome ${user.name}!"] as JSON)
        }
    }

}
