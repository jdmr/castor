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
            <a href="#" class="btn btn-default btn-lg" id="backBtn">Back</a>

            <a href="../edit" class="btn btn-default btn-lg" id="editBtn">Edit</a>

        </div>
    </div>
</div>

<r:script>
$(function() {
    $('a#backBtn').click(function(e) {
        e.preventDefault();
        parent.history.back();
    });
});
</r:script>
</body>
</html>
