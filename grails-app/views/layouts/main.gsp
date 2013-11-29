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
        <r:require modules="base"/>
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
                    <ul class="nav navbar-nav">
                        <li <g:if test="${request.requestURI == '/' || request.getRequestURI().startsWith("/home")}">class="active"</g:if>><a href="${createLink(uri:'/home')}"><g:message code="default.home.label" /></a></li>
                        <li <g:if test="${request.getRequestURI().startsWith("/event")}">class="active"</g:if>><a href="${createLink(controller:'event')}"><g:message code="event.list.label" /></a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="../about">About</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
        <div class="container" id="content">
            <g:layoutBody/>
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
        <g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>
