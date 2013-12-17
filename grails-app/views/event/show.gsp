<%@ page import="castor.Event" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-event" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list event">

        <g:if test="${eventInstance?.code}">
            <li class="fieldcontain">
                <span id="code-label" class="property-label"><g:message code="event.code.label" default="Code"/></span>

                <span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${eventInstance}"
                                                                                        field="code"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="event.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${eventInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.city}">
            <li class="fieldcontain">
                <span id="city-label" class="property-label"><g:message code="event.city.label" default="City"/></span>

                <span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${eventInstance}"
                                                                                        field="city"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.date}">
            <li class="fieldcontain">
                <span id="date-label" class="property-label"><g:message code="event.date.label" default="Date"/></span>

                <span class="property-value" aria-labelledby="date-label"><g:formatDate
                        date="${eventInstance?.date}"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="event.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${eventInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.description}">
            <li class="fieldcontain">
                <span id="description-label" class="property-label"><g:message code="event.description.label"
                                                                               default="Description"/></span>

                <span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${eventInstance}"
                                                                                               field="description"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="event.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${eventInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.member}">
            <li class="fieldcontain">
                <span id="member-label" class="property-label"><g:message code="event.member.label"
                                                                          default="Member"/></span>

                <span class="property-value" aria-labelledby="member-label"><g:link controller="user" action="show"
                                                                                    id="${eventInstance?.member?.id}">${eventInstance?.member?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.paid}">
            <li class="fieldcontain">
                <span id="paid-label" class="property-label"><g:message code="event.paid.label" default="Paid"/></span>

                <span class="property-value" aria-labelledby="paid-label"><g:formatBoolean
                        boolean="${eventInstance?.paid}"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.seats}">
            <li class="fieldcontain">
                <span id="seats-label" class="property-label"><g:message code="event.seats.label"
                                                                         default="Seats"/></span>

                <span class="property-value" aria-labelledby="seats-label"><g:fieldValue bean="${eventInstance}"
                                                                                         field="seats"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.state}">
            <li class="fieldcontain">
                <span id="state-label" class="property-label"><g:message code="event.state.label"
                                                                         default="State"/></span>

                <span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${eventInstance}"
                                                                                         field="state"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.street}">
            <li class="fieldcontain">
                <span id="street-label" class="property-label"><g:message code="event.street.label"
                                                                          default="Street"/></span>

                <span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${eventInstance}"
                                                                                          field="street"/></span>

            </li>
        </g:if>

        <g:if test="${eventInstance?.zip}">
            <li class="fieldcontain">
                <span id="zip-label" class="property-label"><g:message code="event.zip.label" default="Zip"/></span>

                <span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${eventInstance}"
                                                                                       field="zip"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: eventInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${eventInstance}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
