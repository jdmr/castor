import castor.*

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

      log.info('Castor is up!')
    }

    def destroy = {
    }
}
