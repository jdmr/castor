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

class Event implements Serializable {
    String id
    String code
    String name
    String description
    Date date = new Date()
    String street
    String city
    String state
    String zip
    Integer seats = 0
    Boolean paid = Boolean.FALSE
    Date dateCreated
    Date lastUpdated

    static belongsTo = [member: User]

    static constraints = {
        code unique: true
        name blank: false
    }

    static mapping = {
        table 'events'
        id generator: 'uuid'
        date name: 'date_'
        state column: 'state_'
        name index:'event_name_idx'
        code index:'event_code_idx'
    }

    def getAddress() {
        return "${street}, ${city} ${state} ${zip}"
    }

    static namedQueries = {
        search { filter ->
            def x = "%${filter}%"
            or {
                eq('code', filter)
                ilike('name', x)
                ilike('description', x)
                member {
                    ilike('name', x)
                }
                member {
                    ilike('username', x)
                }
            }
        }

        upcoming {
            gt('date', new Date())
        }

        sorted {
            order('date')
        }

        mine { userId ->
            member {
                idEq(userId)
            }
        }
    }

}