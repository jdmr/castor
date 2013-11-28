package castor

class Role {

	String authority

	static mapping = {
    table 'roles'
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
