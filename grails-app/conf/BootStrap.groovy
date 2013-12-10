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

        log.info('Castor is up!')
    }

    def destroy = {
    }
}
