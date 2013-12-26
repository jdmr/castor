%{--
  - The MIT License (MIT)
  -
  - Copyright (c) 2013 David Mendoza
  -
  - Permission is hereby granted, free of charge, to any person obtaining a copy
  - of this software and associated documentation files (the "Software"), to deal
  - in the Software without restriction, including without limitation the rights
  - to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  - copies of the Software, and to permit persons to whom the Software is
  - furnished to do so, subject to the following conditions:
  -
  - The above copyright notice and this permission notice shall be included in
  - all copies or substantial portions of the Software.
  -
  - THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  - IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  - FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  - AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  - LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  - OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  - THE SOFTWARE.
  --}%

<%@ page import="castor.Event" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title>${eventInstance?.name}</title>
</head>

<body>

<div class="row content">
    <div class="col-sm-3">
        <div role="navigation">
            <ul class="nav app-sidenav">
                <li><a href="${createLink(controller:'user')}">Users</a></li>
                <li><a href="${createLink(controller:'message')}">Messages</a></li>
                <li class="active"><a href="${createLink(controller:'admin', action: 'events')}">Events</a></li>
            </ul>
        </div>
    </div>
    <div class="col-sm-9">
        <div class="row">
            <div class="col-sm-12">
                <h1>${eventInstance?.name}</h1>
                <p>Date: <g:formatDate date="${eventInstance.date}" format="EEE, MMM dd yyyy hh:mm a zzz"/></p>
                <p>Host: ${eventInstance.member.name}</p>
                <p>Code: ${eventInstance.code}</p>
                <p>Address: ${eventInstance.address}</p>
                ${raw(eventInstance?.description)}
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <a href="${createLink(action: 'deleteEvent', id: eventInstance.id)}" class="btn btn-danger btn-lg" onclick="return confirm('Are you sure you want to delete this event?');"><i class="glyphicon glyphicon-trash"></i> Delete</a>
                <a href="#" class="btn btn-default btn-lg" id="backBtn">Back</a>
            </div>
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
