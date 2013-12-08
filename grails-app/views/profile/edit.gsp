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
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:message code="update.profile"/></title>
</head>

<body>
<div class="content">
    <g:form action="update" method="post">
        <g:hiddenField name="id" value="${user.id}" />
        <g:hiddenField name="version" value="${user.version}" />
        <div class="row">
            <div class="col-sm-12">
                <h1><g:message code="update.profile"/></h1>
                <g:hasErrors>
                    <div class="alert alert-danger">
                        <ul>
                            <g:eachError>
                                <li>${it.defaultMessage}</li>
                            </g:eachError>
                        </ul>
                    </div>
                </g:hasErrors>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="username" class="control-label">Email</label>
                    <g:textField name="username" id="username" value="${user.username}" class="form-control"/>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="password" class="control-label">Password</label>
                    <g:passwordField name="password" id="password" value="${user.password}" class="form-control"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="name" class="control-label">Name</label>
                    <g:textField name="name" id="name" value="${user.name}" class="form-control"/>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label for="phone" class="control-label">Phone</label>
                    <g:textField name="phone" id="phone" value="${user.phone}" class="form-control"/>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <button type="submit" class="btn btn-primary btn-lg"><g:message code="default.button.update.label" /></button>
            </div>
        </div>
    </g:form>

</div>

</body>
</html>