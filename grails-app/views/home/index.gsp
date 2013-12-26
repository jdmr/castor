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
    <title><g:message code="default.home.label" /></title>
</head>

<body>
    <div class="row content">
        <div class="col-sm-offset-4 col-sm-4" id="loginLink" style="padding: 50px;">

            <g:form action="code" method="post" autocomplete="off" name="codeForm">

                <div class="input-group">
                    <input type="text" class="form-control" name="code" id="code" placeholder="iRSVPed Code" style="text-align: center;" autofocus="autofocus" value="${params.code}"/>
                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">RSVP</button>
                    </span>
                </div>
            </g:form>

            <g:if test="${flash?.message}">
                <div class="alert <g:if test='${flash.messageStyle}'>${flash.messageStyle}</g:if><g:else>alert-success</g:else>" style="margin-top: 10px;">${raw(flash.message)}</div>
            </g:if>
        </div>
    </div>
</body>
</html>