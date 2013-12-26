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
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Event created successfully!</title>
</head>
<body>
    <div class="content">
        <div class="row">
            <div class="col-sm-12">
                <div class="well-lg">
                    <h1>${subject}</h1>
                    <p>${raw(eventDescription)}</p>
                    <p>
                        <a href="${createLink(action:'show', id:event.id)}" class="btn btn-primary btn-lg"><i class="glyphicon glyphicon-eye-open"></i> Show</a>
                        <a href="${createLink(action:'create')}" class="btn btn-primary btn-lg"><i class="glyphicon glyphicon-plus"></i> Create Another One</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>