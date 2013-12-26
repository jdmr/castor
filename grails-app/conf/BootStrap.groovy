import castor.Constants
import castor.Message
import castor.Role
import castor.User
import castor.UserRole

class BootStrap {

    def init = { servletContext ->
        log.info("Configuring castor")
        log.debug("Configuring roles")
        Role roleAdmin = Role.findByAuthority('ROLE_ADMIN')
        if (!roleAdmin) {
            roleAdmin = new Role(authority: 'ROLE_ADMIN').save()
        }
        Role roleUser = Role.findByAuthority('ROLE_USER')
        if (!roleUser) {
            roleUser = new Role(authority: 'ROLE_USER').save()
        }

        log.debug("Configuring users")
        Integer admins = User.countByRole('ROLE_ADMIN')
        if (admins == 0) {
            log.debug('Creating superuser')
            User admin = new User(
                    username: 'admin@irsvped.com'
                    , password: 'admin'
                    , name: 'Admin User'
            ).save()

            UserRole.create(admin, roleAdmin)
        }

        Message signup = Message.findByName(Constants.SIGN_UP)
        if (!signup) {
            signup = new Message()
            signup.name = Constants.SIGN_UP
            signup.subject = "Welcome! Confirm account to receive your RSVP Code"
            signup.content = """
<p>Salut @@NAME@@,</p>
<p>We are excited to help you create your special event.</p>
<p>To access your event's reports and settings you'll require to provide your credentials:</p>
<dl>
<dt>Username</dt>
<dd>@@USERNAME@@</dd>
<dt>Password</dt>
<dd>@@PASSWORD@@</dd>
</dl>
<p>Thanks again for using our service.</p>
"""
            signup.save(flush: true)
        }

        Message forgot = Message.findByName(Constants.FORGOT_MESSAGE)
        if (!forgot) {
            forgot = new Message(name: Constants.FORGOT_MESSAGE)
            forgot.subject = "You've requested to reset your credentials for iRSVPed.com"
            forgot.content = """
<p>@@NAME@@,</p>
<p>To create and manage events in iRSVPed.com you need the following credentials</p>
<dl>
   <dt>User</dt>
   <dd>@@USERNAME@@</dd>
   <dt>Password</dt>
   <dd>@@PASSWORD@@</dd>
</dl>
<p>Thanks for using our service.</p>
"""
            forgot.save(flush: true)
        }

        Message code = Message.findByName(Constants.CODE)
        if (!code) {
            code = new Message()
            code.name = Constants.CODE
            code.subject = "Your RSVP code is available!"
            code.content = """
<p>Here is your RSVP code for @@EVENT@@, please provide this code to your special guests</p>
<p>@@CODE@@</p>
<p>Enjoy!</p>
<p>&nbsp;</p>
<p>Get the best out of your RSVP:</p>
<ul>
<li>Track who is attending your event by checking your account daily.</li>
<li>Promote your RSVP event by using our page on Facebook or Twitter.</li>
<li>Send out emails and RSVP cards and let your guests know your special code</li>
<li>Reply to this email with your comment or complaint</li>
</ul>
"""
            code.save(flush: true)
        }

        Message finishedFree = Message.findByName(Constants.FINISHED)
        if (!finishedFree) {
            finishedFree = new Message()
            finishedFree.name = Constants.FINISHED
            finishedFree.subject = Constants.FINISHED
            finishedFree.content = """
<h1>Thank you for using iRSVPed!</h1>
<p>Your iRSVPed Code has been sent to your email address and should arrive soon!</p>
"""
            finishedFree.save(flush: true)
        }

        log.info('Castor is up!')
    }

    def destroy = {
    }
}
