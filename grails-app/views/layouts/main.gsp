<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta charset="UTF-8">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-1.8.24.custom.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.asmselect.css')}" type="text/css">

    <r:require modules="jquery, jqueryui, jqueryamsselect, bootstrap"/>

    <style type="text/css">
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }
    </style>
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body>
<div class="container">
    <sec:ifLoggedIn>
        <div class="container">
            <div class="navbar navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container"><!-- Collapsable nav bar -->
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>

                        <p class="navbar-text pull-right">
                            Logged in as <a href="#" class="navbar-link"><sec:username/></a>
                </p>

                <!-- Your site name for the upper left corner of the site -->
        <a class="brand" href="${createLink(controller: 'statusboard', action: 'index')}">Statusboard</a>

        <ul class="nav" role="navigation">
            <li class="divider-vertical"></li>

            <li><a href="${createLink(controller: 'controlPanel', action: 'index')}">Home</a></li>

            <li class="dropdown">
                <a id="drop1" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                    Shift<b class="caret"></b>
                </a>
                <ul class="dropdown-menu" role="menu" aria-labeledby="drop1">
                    <li><a tabeindex="-1"
                           href="${createLink(controller: 'controlPanel', action: 'personnel')}">Staff Login</a></li>
                    <li><a tabindex="-1"
                           href="${createLink(controller: 'controlPanel', action: 'newShift')}">New Shift</a>
                    </li>
                    <li><a tabindex="-1" href="#">Edit Current Shift</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a id="drop2" href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                    Configure<b class="caret"></b>
                </a>
                <ul class="dropdown-menu" role="menu" aria-labeledby="drop2">
                    <li><a tabindex="-1" href="${createLink(controller: 'staff', action: 'list')}">Staff</a></li>
                    <li><a tabindex="-1" href="${createLink(controller: 'apparatus', action: 'list')}">Apparatus</a>
                    </li>
                    <li><a tabindex="-1" href="${createLink(controller: 'dutyShift', action: 'list')}">Shifts</a></li>
                    <li><a tabindex="-1" href="${createLink(controller: 'rank', action: 'list')}">Ranks</a></li>
                </ul>
            </li>
            <li><a href="${createLink(controller: 'logout')}">Logout</a></li>
        </ul>
        </div>

    </div>
    </div>
    </sec:ifLoggedIn>

    <g:layoutBody/>


    <hr>

    <div id="footer">
        <div class="container">
            <p class="muted credit">
                <g:copyright startYear="2005"></g:copyright>
            </p>
        </div>
    </div>
</div>

    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"
                                                                       default="Loading&hellip;"/></div>
    <g:javascript library="application"/>
    <g:javascript library="bootstrap"/>
    <r:layoutResources/>
</div>
</body>
</html>
