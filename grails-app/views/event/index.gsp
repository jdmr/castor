<%@ page import="castor.Event" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="content">
    <div class="row">
        <div class="col-sm-12">
            <g:form action="index" method="get" class="form-search">
                <legend><h1>Events</h1></legend>
                <g:textField name="filter" value="${params.filter}" />
                <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i> Search</button>
                <a href="${createLink(controller: 'event', action: 'create')}" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Create Event</a>
            </g:form>
            <g:if test="${flash.message}">
                <div class="alert alert-block <g:if
                        test='${flash.messageStyle}'>${flash.messageStyle}</g:if><g:else>alert-success</g:else>">${flash.message}</div>
            </g:if>
        </div>
    </div>

    <g:each in="${eventInstanceList}" var="event">
        <div class="row">
            <div class="col-sm-12">
                <h2><a href="${createLink(action:'show', id:event.id)}">${event.name}</a></h2>
                <p>Date: <g:formatDate date="${event.date}" format="EEE, MMM dd yyyy hh:mm a zzz"/></p>
                <p>Host: ${event.member.name}</p>
                ${raw(event.description)}
            </div>
        </div>
    </g:each>

    <div class="row">
        <div class="col-sm-12">
            <g:paginate total="${eventInstanceCount ?: 0}"/>
        </div>
    </div>
</div>

</body>
</html>
