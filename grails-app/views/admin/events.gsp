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
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="content">
    <div class="row">
        <div class="col-sm-12">
            <g:form action="events" method="get" class="form-search">
                <legend><h1>Events</h1></legend>
                <g:textField name="filter" value="${params.filter}" />
                <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i> Search</button>
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
                <h2><a href="${createLink(action:'event', id:event.id)}">${event.name}</a></h2>
                <p>Date: <g:formatDate date="${event.date}" format="EEE, MMM dd yyyy hh:mm a zzz"/></p>
                <p>Host: ${event.member.name}</p>
                <p>Code: ${event.code}</p>
                <p>Address: ${event.address}</p>
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
