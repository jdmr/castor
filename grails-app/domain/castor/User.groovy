package castor

class User {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired = false
	boolean accountLocked = false
	boolean passwordExpired = false
  String name
  String phone

	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true, email: true
		password blank: false
    phone nullable: true
	}

	static mapping = {
    table 'users'
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}

  static Integer countByRole(String role) {
    List results = executeQuery('select count(u) from User u, UserRole ur, Role r where ur.user.id = u.id and ur.role.id = r.id and r.authority = :authority', [authority: role])
    return results[0]
  }

}
