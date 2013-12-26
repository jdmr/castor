<%@ page import="castor.Event" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title>${eventInstance?.name}</title>
</head>

<body>

<div class="content">
    <div class="row">
        <div class="col-sm-12">
            <h1>${eventInstance?.name}</h1>
            <p>Date: <g:formatDate date="${eventInstance.date}" format="EEE, MMM dd yyyy hh:mm a zzz"/></p>
            <p>Host: ${eventInstance.member.name}</p>
            ${raw(eventInstance?.description)}
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <a href="${createLink(controller: 'event')}" class="btn btn-default btn-lg">Back</a>
        </div>
    </div>
</div>

</body>
</html>
