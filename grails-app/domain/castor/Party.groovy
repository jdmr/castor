package castor

class Party {

    String fullName
    String email
    String phone
    Integer seats = 1
    String comments
    Date dateCreated
    Date lastUpdated

    static belongsTo = [event: Event]

    static constraints = {
        fullName blank: false
        email blank: false, email: true, unique: 'event'
        phone nullable: true
        seats min: 0
        comments nullable: true
    }

    static mapping = {
        table 'parties'
    }

}
