
<%@ page import="castor.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="row content">
        <div class="col-sm-3">
            <div role="navigation">
                <ul class="nav app-sidenav">
                    <li><a href="${createLink(controller:'user')}">Users</a></li>
                    <li class="active"><a href="${createLink(controller:'message')}">Messages</a></li>
                    <li><a href="${createLink(controller:'admin', action: 'events')}">Events</a></li>
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

                            <g:sortableColumn property="name" title="${message(code: 'message.name.label', default: 'Name')}" />

                            <g:sortableColumn property="subject" title="${message(code: 'message.subject.label', default: 'Subject')}" />

                            <g:sortableColumn property="content" title="${message(code: 'message.content.label', default: 'Content')}" />

                            <g:sortableColumn property="lastUpdated" title="${message(code: 'message.lastUpdated.label', default: 'Last Updated')}" />

                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${messageInstanceList}" status="i" var="messageInstance">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                                <td><g:link action="show" id="${messageInstance.id}">${fieldValue(bean: messageInstance, field: "name")}</g:link></td>

                                <td>${fieldValue(bean: messageInstance, field: "subject")}</td>

                                <td>${raw(messageInstance.content)}</td>

                                <td><g:formatDate date="${messageInstance.lastUpdated}" /></td>

                            </tr>
                        </g:each>
                        </tbody>
                    </table>

                </div>

                <g:paginate total="${messageInstanceCount ?: 0}"/>
            </div>

        </div>
    </div>

	</body>
</html>
