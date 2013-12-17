<%@ page import="castor.Message" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'message.label', default: 'Message')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
        <r:require module="wysiwyg" />
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
            <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${messageInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${messageInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form url="[resource: messageInstance, action: 'update']" method="PUT">
                <g:hiddenField name="version" value="${messageInstance?.version}"/>
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="btn btn-primary btn-lg" action="update"
                                    value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                </fieldset>
            </g:form>
        </div>
    </div>

	</body>
</html>
