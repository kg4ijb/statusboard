<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>

    <title>Station Statusboard</title>

</head>

<body>

<g:if test="${flash.message}">
    <div class="message alert alert-error" role="status">
        ${flash.message}
        <a class="close" data-dismiss="alert" href="#">&times;</a>
    </div>
</g:if>

<div class="hero-unit">
    <h2>Station Statusboard Control Panel</h2>

    <p>${notes}</p>
</div>

</body>
</html>
