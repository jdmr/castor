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
        <r:script disposition="head">
            var URL_ROOT = '${request.contextPath}';
        </r:script>
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
                            <li <g:if test="${request.getRequestURI().startsWith("/mine")}">class="active"</g:if>><a href="${createLink(controller:'mine')}"><g:message code="mine.list.label" /></a></li>
                        </sec:ifAllGranted>
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <li <g:if test="${request.getRequestURI().startsWith("/admin")}">class="active"</g:if>><a href="${createLink(controller:'admin')}"><g:message code="admin.label" /></a></li>
                        </sec:ifAllGranted>
                        <sec:ifNotLoggedIn>
                            <li id="login-li"><a href="#login-popup" id="loginLink"><g:message code="login.label" /></a></li>
                            <li id="signup-li"><a href="#login-popup" id="signupMenuLink"><g:message code="signup.label" /></a></li>
                        </sec:ifNotLoggedIn>
                        <sec:ifLoggedIn>
                            <li><g:link controller='profile' action="edit"><sec:username /></g:link></li>
                            <li><g:link controller='logout'><g:message code="logout.label" /></g:link></li>
                        </sec:ifLoggedIn>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="container">
            <g:layoutBody/>

            <sec:ifNotLoggedIn>
                <div id="login-popup" class="mfp-hide">
                    <form name="ajaxLoginForm" id="ajaxLoginForm" action='${request.contextPath}/j_spring_security_check' method='POST' role="form">
                        <legend>Login</legend>
                        <div class="form-group">
                            <label for='username'><g:message code="email.label" /></label>
                            <input type='email' class='form-control' name='j_username' id='username' placeholder="Enter email" />
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
                    <div id="forgotDiv" style="display: none;">
                        <form name="forgotForm" id="forgotForm" action='${createLink(controller: 'profile', action: 'forgot')}' method='POST' role="form">
                            <legend>Forgot Credentials</legend>
                            <div class="form-group">
                                <label for='email'><g:message code="email.label" /></label>
                                <input type='email' class='form-control' name='email' id='email' placeholder="Enter email" />
                            </div>
                            <div class="form-group">
                                <button type="submit" id="forgotButton" class="btn btn-primary"><g:message code="request.new.password.label" /></button>
                            </div>
                            <div id='forgotMessage' style="display: none;">
                            </div>
                        </form>
                    </div>
                    <div id="signupDiv" style="display: none;">
                        <form name="signupForm" id="signupForm" action='${createLink(controller: 'signup', action: 'free', params: [ajax: true])}' method='POST' role="form">
                            <legend>Sign Up</legend>
                            <div class="form-group">
                                <label for='sname'><g:message code="name.label" /></label>
                                <input type='text' class='form-control' name='name' id='sname' placeholder="Enter Full Name" />
                            </div>
                            <div class="form-group">
                                <label for='susername'><g:message code="email.label" /></label>
                                <input type='email' class='form-control' name='username' id='susername' placeholder="Enter email" />
                            </div>
                            <div class="form-group">
                                <label for='spassword'><g:message code="password.label"/></label>
                                <input type='password' class='form-control' name='password' id='spassword' />
                            </div>
                            <div class="form-group">
                                <button type="submit" id="signupButton" class="btn btn-primary"><g:message code="signup.label" /></button>
                            </div>
                            <div id='signupMessage' style="display: none;">
                            </div>
                        </form>
                    </div>
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
                        type:'inline',
                        midClick: true,
                        callbacks: {
                            open: function() {
                                $('#signupDiv').hide();
                                $('#ajaxLoginForm').show();
                            }
                        }
                    });

                    $('#signupMenuLink').magnificPopup({
                        type:'inline',
                        midClick: true,
                        callbacks: {
                            open: function() {
                                $('#ajaxLoginForm').hide();
                                $('#signupDiv').show();
                            }
                        }
                    });

                    $('#authAjax').click(function(e) {
                        e.preventDefault();
                        $('#loginMessage').html('${message(code:'sending.message')}').show(function() {
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
                                    $('#loginMessage').html('<div class="alert alert-success">Welcome back!</div>');
                                    $('#login-li').before('<li><a href="${createLink(controller: 'mine')}">${message(code: "mine.list.label")}</a>');
                                    $('#login-li').html('<a href="${createLink(controller: 'profile', action: 'edit')}">'+data.username+'</a>');
                                    $('#signup-li').hide();
                                    $('#nav-options').append('<li><a href="${createLink(controller:'logout')}">${message(code: "logout.label")}</a>');
                                    $.magnificPopup.close();
                                } else {
                                    $('#loginMessage').html("<div class='alert alert-danger' style='margin: 0;'><g:message code="wrong.username.password.message" /></div>");
                                    $('#forgotPasswordLink').click(function(e) {
                                        e.preventDefault();
                                        $('#ajaxLoginForm').toggle("slide", {direction: "right"}, function() {
                                            $('#forgotDiv').toggle("slide", function() {
                                                $("#email").focus();
                                            });
                                        });
                                    });
                                }
                            });

                            request.fail(function(jqXHR, result) {
                                $('#loginMessage').html("<span class='alert alert-danger'>" + result.error + '</span>');
                            });

                        }); // show

                    }); // click

                    $('#forgotButton').click(function(e) {
                        e.preventDefault();
                        $('#forgotMessage').html('<div class="alert alert-info">${message(code:'sending.forgot.message')}</div>').show(function() {
                            var form = $('#forgotForm');
                            var request = $.ajax({
                                type: 'post'
                                , url : form.attr('action')
                                , data : form.serialize()
                                , async : false
                                , dataType : 'json'
                            });

                            request.done(function(data) {
                                if (data.error) {
                                    $('#forgotMessage').html("<div class='alert alert-danger' style='margin: 0;'>"+data.error+"</div>");
                                    $('#signupLink').click(function(e) {
                                        e.preventDefault();
                                        $('#forgotDiv').toggle('slide', {direction: 'left'}, function () {
                                            $('#signupDiv').toggle('slide', {direction: 'right'}, function() {
                                                $('#sname').focus();
                                            });
                                        });
                                    });
                                } else {
                                    $('#forgotMessage').html("<div class='alert alert-success' style='margin: 0;'>"+data.success+"</div>");
                                    form[0].reset();
                                    setTimeout(function() {
                                        $.magnificPopup.close();
                                        $('#forgotDiv').hide();
                                        $('#forgotMessage').hide();
                                        $('#loginMessage').hide();
                                    }, 3000);
                                }
                            });

                            request.fail(function(jqXHR, result) {
                                $('#forgotMessage').html("<span class='alert alert-danger'>Could not reset credentials. Please try again later.</span>");
                            });
                        }); // show
                    }); // click

                    $('#signupButton').click(function(e) {
                        e.preventDefault();
                        $('#signupMessage').html('${message(code:'sending.signup.message')}').show(function() {
                            var form = $('#signupForm');
                            var request = $.ajax({
                                type: 'post'
                                , url : form.attr('action')
                                , data : form.serialize()
                                , async : false
                                , dataType : 'json'
                            });

                            request.done(function(data) {
                                console.log("Done!");
                                if (data.error) {
                                    $('#signupMessage').html("<div class='alert alert-danger' style='margin: 0;'>"+data.error+"</div>");
                                    if (data.forgotLink) {
                                        $('#forgotLink').click(function(e) {
                                            e.preventDefault();
                                            $('#signupForm').toggle("slide", {direction: "right"}, function() {
                                                $('#forgotDiv').toggle("slide", function() {
                                                    $("#email").focus();
                                                });
                                            });
                                        });
                                    }
                                    $('#sname').focus();
                                } else {
                                    $('#signupMessage').html("<div class='alert alert-success' style='margin: 0;'>"+data.success+"</div>");
                                    form[0].reset();
                                    $('#login-li').before('<li><a href="${createLink(controller: 'mine')}">${message(code: "mine.list.label")}</a>');
                                    $('#login-li').html('<a href="${createLink(controller: 'profile', action: 'edit')}">'+data.username+'</a>');
                                    $('#signup-li').hide();
                                    $('#nav-options').append('<li><a href="${createLink(controller:'logout')}">${message(code: "logout.label")}</a>');
                                    setTimeout(function() {
                                        $.magnificPopup.close();
                                    }, 2000);
                                }
                            });

                            request.fail(function(jqXHR, result) {
                                $('#signupMessage').html("<span class='alert alert-danger'>Could not reset credentials. Please try again later.</span>");
                            });

                        });
                    });
                });
            </script>
        </sec:ifNotLoggedIn>
	</body>
</html>
