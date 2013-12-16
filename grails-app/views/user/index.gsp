<%@ page import="castor.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
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
        <div id="list-user" role="main">
            <h1><g:message code="default.list.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="alert alert-success" role="status">${flash.message}</div>
            </g:if>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>

                        <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}"/>

                        <g:sortableColumn property="password" title="${message(code: 'user.name.label', default: 'Name')}"/>

                        <g:sortableColumn property="phone" title="${message(code: 'user.phone.label', default: 'Phone')}"/>

                        <g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}"/>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show"
                                        id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

                            <td>${fieldValue(bean: userInstance, field: "name")}</td>

                            <td>${fieldValue(bean: userInstance, field: "phone")}</td>

                            <td><g:formatBoolean boolean="${userInstance.enabled}"/></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>

            </div>

            <g:paginate total="${userInstanceCount ?: 0}"/>
        </div>

    </div>
</div>

</body>
</html>
