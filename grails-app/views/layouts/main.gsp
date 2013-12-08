<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Home"/> - <g:message code="project.name" /></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta name="apple-mobile-web-app-title" content="${message(code:'project.name')}">
		<link rel="icon" href="${resource(dir: 'images', file: 'favicon.png')}">
        <link rel="apple-touch-icon" sizes="144x144" href="${resource(dir: 'images', file: 'apple-touch-icon-144x144.png')}">
        <link rel="apple-touch-icon" sizes="120x120" href="${resource(dir: 'images', file: 'apple-touch-icon-120x120.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-114x114.png')}">
        <link rel="apple-touch-icon" sizes="72x72" href="${resource(dir: 'images', file: 'apple-touch-icon-72x72.png')}">
        <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
        <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <r:require module='base'/>
        <g:layoutHead/>
        <r:layoutResources />
	</head>
	<body>
        <header class="navbar navbar-inverse navbar-fixed-top castor-nav" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".castor-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="${createLink(uri:'/')}" class="navbar-brand"><img src="${resource(dir: 'images', file: 'iRSVPed-logo.png')}" alt="${message(code: 'project.name')}" /></a>
                </div>
                <nav class="collapse navbar-collapse castor-navbar-collapse" role="navigation">
                    <ul class="nav navbar-nav navbar-right" id="nav-options">
                        <li <g:if test="${request.requestURI == '/' || request.getRequestURI().startsWith("/home")}">class="active"</g:if>><a href="${createLink(uri:'/home')}"><g:message code="default.home.label" /></a></li>
                        <li <g:if test="${request.getRequestURI().startsWith("/event")}">class="active"</g:if>><a href="${createLink(controller:'event')}"><g:message code="event.list.label" /></a></li>
                        <sec:ifAllGranted roles="ROLE_USER">
                            <li <g:if test="${request.getRequestURI().startsWith("/mine")}">class="active"</g:if>><a href="${createLink(controller:'mine')}">My Events</a></li>
                        </sec:ifAllGranted>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li <g:if test="${request.getRequestURI().startsWith("/admin")}">class="active"</g:if>><a href="${createLink(controller:'admin')}">Admin</a></li>
                        </sec:ifAllGranted>
                        <li id="login-li">
                            <sec:ifLoggedIn>
                                <a href="${createLink(controller: 'profile', action:'edit')}"><sec:username/></a>
                            </sec:ifLoggedIn>
                            <sec:ifNotLoggedIn>
                                <a href="#login-popup" id="loginLink"><g:message code="login.label" /></a>
                            </sec:ifNotLoggedIn>
                        </li>
                        <sec:ifLoggedIn>
                            <li><g:link controller='logout'><g:message code="logout.label" /></g:link></li>
                        </sec:ifLoggedIn>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="container" id="content">
            <g:layoutBody/>

            <sec:ifNotLoggedIn>
                <div id="login-popup" class="mfp-hide">
                    <form name="ajaxLoginForm" id="ajaxLoginForm" action='${request.contextPath}/j_spring_security_check' method='POST' role="form">
                        <div class="form-group">
                            <label for='username'><g:message code="email.label" /></label>
                            <input type='text' class='form-control' name='j_username' id='username' placeholder="Enter email" />
                        </div>
                        <div class="form-group">
                            <label for='password'><g:message code="password.label"/></label>
                            <input type='password' class='form-control' name='j_password' id='password' />
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type='checkbox' class='chk' id='remember_me'
                                       name='_spring_security_remember_me'/>
                                <g:message code="remember.me.label" />
                            </label>
                        </div>
                        <div class="form-group">
                            <button type="submit" id="authAjax" class="btn btn-primary btn-lg"><g:message code="login.label" /></button>
                        </div>
                        <div id='loginMessage' style="display: none;">
                        </div>
                    </form>
                </div>
            </sec:ifNotLoggedIn>
        </div>

		<footer role="contentinfo">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <p><a href="http://jdmendoza.blogspot.com">&copy; <g:formatDate format="yyyy" date="${new Date()}"/> David Mendoza</a></p>
                    </div>
                </div>
            </div>
		</footer>
        <r:layoutResources />
        <sec:ifNotLoggedIn>
            <script type="text/javascript">
                $(function() {
                    $('#loginLink').magnificPopup({
                        type:'inline'
                    });

                    $('#authAjax').click(function(e) {
                        e.preventDefault();
                        $('#loginMessage').html('${message(code:'sending.message')}').show();

                        var form = $('#ajaxLoginForm');
                        var request = $.ajax({
                            type: 'post'
                            , url : form.attr('action')
                            , data : form.serialize()
                            , async : false
                            , dataType : 'json'
                        });

                        request.done(function(data) {
                            if (data.username) {
                                form[0].reset();
                                $('#loginMessage').empty();
                                $('#login-li').html('<a href="${createLink(controller: 'profile', action: 'edit')}">'+data.username+'</a>');
                                $('#nav-options').append('<li><a href="${request.contextPath}/logout">${message(code: "logout.label")}</a>');
                                console.log("successfully logged in");
                                $.magnificPopup.close();
                            } else {
                                $('#loginMessage').html("<div class='alert alert-danger' style='margin: 0;'>" + '<g:message code="wrong.username.password.message" />' + '</div>');
                            }
                        });

                        request.fail(function(jqXHR, result) {
                            console.log("Could not log in " + reesult);
                            $('#loginMessage').html("<span class='alert alert-danger'>" + result.error + '</span>');
                        });
                    });
                });
            </script>
        </sec:ifNotLoggedIn>
	</body>
</html>
