<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
</head>

<body>

    <div class="row content">
        <div class="col-sm-12">
            <g:if test='${flash.message}'>
                <div class='alert alert-danger'>${flash.message}</div>
            </g:if>
        </div>
    </div>
    <div class="row content">
        <div class="col-sm-6">
            <h1>Current User</h1>

            <form action='${postUrl}' method='POST' autocomplete='off'>
                <div class="form-group">
                    <label for='login_username'>Email:</label>
                    <input type='email' class='form-control' name='j_username' id='login_username' autofocus="autofocus"/>
                </div>

                <div class="form-group">
                    <label for='login_password'><g:message code="springSecurity.login.password.label"/>:</label>
                    <input type='password' class='form-control' name='j_password' id='login_password'/>
                </div>

                <div class="checkbox">
                    <label for='login_remember_me'>
                        <input type='checkbox' class='chk' name='${rememberMeParameter}' id='login_remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                        <g:message code="springSecurity.login.remember.me.label"/>
                    </label>
                </div>

                <div class="form-group">
                    <input type='submit' id="login_submit" value='${message(code: "springSecurity.login.button")}' class="btn btn-default btn-lg"/>
                </div>
            </form>

        </div>
        <div class="col-sm-6">
            <h1>New User</h1>

            <form action='${createLink(controller: 'signup', action: 'free')}' method='POST' autocomplete='off'>
                <div class="form-group">
                    <label for='signup_name'>Name:</label>
                    <input type='text' class='form-control' name='name' id='signup_name' />
                </div>

                <div class="form-group">
                    <label for='signup_username'>Email:</label>
                    <input type='email' class='form-control' name='username' id='signup_username' />
                </div>

                <div class="form-group">
                    <label for='signup_password'><g:message code="springSecurity.login.password.label"/>:</label>
                    <input type='password' class='form-control' name='password' id='signup_password'/>
                </div>

                <div class="form-group">
                    <input type='submit' id="signup_submit" value='Sign Up' class="btn btn-primary btn-lg"/>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
