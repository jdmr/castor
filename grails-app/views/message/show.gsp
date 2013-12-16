
<%@ page import="castor.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

    <div class="row content">
        <div class="col-sm-3">
            <div role="navigation">
                <ul class="nav app-sidenav">
                    <li><a href="${createLink(controller:'user')}">Users</a></li>
                    <li class="active"><a href="${createLink(controller:'message')}">Messages</a></li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9">
            <h1><g:message code="default.show.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="alert alert-success" role="status">${flash.message}</div>
            </g:if>
            <dl class="property-list user">

                <g:if test="${messageInstance?.name}">
                    <dt class="fieldcontain">
                        <span id="name-label" class="property-label"><g:message code="message.name.label" default="Name" /></span>
                    </dt>
                    <dd>
                        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${messageInstance}" field="name"/></span>
                    </dd>
                </g:if>

                <g:if test="${messageInstance?.subject}">
                    <dt class="fieldcontain">
                        <span id="subject-label" class="property-label"><g:message code="message.subject.label" default="Subject" /></span>

                    </dt>
                    <dd>
                        <span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${messageInstance}" field="subject"/></span>

                    </dd>
                </g:if>

                <g:if test="${messageInstance?.content}">
                    <dt class="fieldcontain">
                        <span id="content-label" class="property-label"><g:message code="message.content.label" default="Content" /></span>
                    </dt>
                    <dd>

                        <span class="property-value" aria-labelledby="content-label">${raw(messageInstance.content)}</span>

                    </dd>
                </g:if>

                <g:if test="${messageInstance?.dateCreated}">
                    <dt class="fieldcontain">
                        <span id="dateCreated-label" class="property-label"><g:message code="message.dateCreated.label" default="Date Created" /></span>

                    </dt>
                    <dd>
                        <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${messageInstance?.dateCreated}" /></span>

                    </dd>
                </g:if>

                <g:if test="${messageInstance?.lastUpdated}">
                    <dt class="fieldcontain">
                        <span id="lastUpdated-label" class="property-label"><g:message code="message.lastUpdated.label" default="Last Updated" /></span>

                    </dt>
                    <dd>
                        <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${messageInstance?.lastUpdated}" /></span>

                    </dd>
                </g:if>
            </dl>
            <g:form url="[resource: messageInstance, action: 'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="btn btn-primary" action="edit" resource="${messageInstance}"><i class="glyphicon glyphicon-edit"></i> <g:message code="default.button.edit.label"
                                                                                                                                                 default="Edit"/></g:link>
                    <g:actionSubmit class="btn btn-danger" action="delete"
                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                </fieldset>
            </g:form>
            </div>

        </div>
    </div>

	</body>
</html>
