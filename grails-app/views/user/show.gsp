<%@ page import="castor.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="row content">
    <div class="col-sm-3">
        <div role="navigation">
            <ul class="nav app-sidenav">
                <li class="active"><a href="${createLink(controller:'user')}">Users</a></li>
                <li><a href="${createLink(controller:'message')}">Messages</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9">
        <h1><g:message code="default.show.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <dl class="property-list user">

            <g:if test="${userInstance?.username}">
                <dt class="fieldcontain">
                    <span id="username-label" class="property-label"><g:message code="user.username.label"
                                                                                default="Username"/></span>
                </dt>
                <dd>

                    <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}"
                                                                                                field="username"/></span>

                </dd>
            </g:if>

            <g:if test="${userInstance?.phone}">
                <dt class="fieldcontain">
                    <span id="phone-label" class="property-label"><g:message code="user.phone.label"
                                                                             default="Phone"/></span>

                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${userInstance}"
                                                                                             field="phone"/></span>

                </dd>
            </g:if>

            <g:if test="${userInstance?.accountExpired}">
                <dt class="fieldcontain">
                    <span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label"
                                                                                      default="Account Expired"/></span>

                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
                            boolean="${userInstance?.accountExpired}"/></span>

                </dd>
            </g:if>

            <g:if test="${userInstance?.accountLocked}">
                <dt class="fieldcontain">
                    <span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label"
                                                                                     default="Account Locked"/></span>

                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
                            boolean="${userInstance?.accountLocked}"/></span>

                </dd>
            </g:if>

            <g:if test="${userInstance?.enabled}">
                <dt class="fieldcontain">
                    <span id="enabled-label" class="property-label"><g:message code="user.enabled.label"
                                                                               default="Enabled"/></span>

                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
                            boolean="${userInstance?.enabled}"/></span>

                </dd>
            </g:if>

            <g:if test="${userInstance?.name}">
                <dt class="fieldcontain">
                    <span id="name-label" class="property-label"><g:message code="user.name.label" default="Name"/></span>

                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userInstance}"
                                                                                            field="name"/></span>

                </dd>
            </g:if>

            <g:if test="${userInstance?.passwordExpired}">
                <dt class="fieldcontain">
                    <span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label"
                                                                                       default="Password Expired"/></span>

                </dt>
                <dd>
                    <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                            boolean="${userInstance?.passwordExpired}"/></span>

                </dd>
            </g:if>

        </dl>
        <g:form url="[resource: userInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="btn btn-primary" action="edit" resource="${userInstance}"><i class="glyphicon glyphicon-edit"></i> <g:message code="default.button.edit.label"
                                                                                         default="Edit"/></g:link>
                <g:actionSubmit class="btn btn-danger" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</div>

</body>
</html>
