<%@ page import="castor.Event" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <r:require module="wysiwyg" />
</head>

<body>
<div id="edit-event" class="row content" role="main">
    <div class="col-sm-12">
        <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${eventInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${eventInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                            error="${error}"/></li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form url="[resource: eventInstance, action: 'update']" method="PUT">
            <g:hiddenField name="version" value="${eventInstance?.version}"/>
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>
            <fieldset class="buttons">
                <g:actionSubmit class="btn btn-default btn-lg" action="update"
                                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            </fieldset>
        </g:form>
    </div>
</div>
</body>
</html>
