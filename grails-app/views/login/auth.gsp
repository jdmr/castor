<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

<div class="content">
    <div class="row">
        <div class="col-sm-12">
            <h1><g:message code="springSecurity.login.header"/></h1>

            <g:if test='${flash.message}'>
                <div class='alert alert-danger'>${flash.message}</div>
            </g:if>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            <form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
                <div class="form-group">
                    <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                    <input type='text' class='form-control' name='j_username' id='username' autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                    <input type='password' class='form-control' name='j_password' id='password'/>
                </div>

                <div class="checkbox">
                    <label for='remember_me'>
                        <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <g:message code="springSecurity.login.remember.me.label"/>
                    </label>
                </div>

                <div class="form-group">
                    <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}' class="btn btn-primary btn-lg"/>
                </div>
            </form>

        </div>
    </div>
</div>
</body>
</html>
