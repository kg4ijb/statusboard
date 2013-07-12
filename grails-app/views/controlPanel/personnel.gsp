<%--
  Created by IntelliJ IDEA.
  User: crb6x
  Date: 1/1/13
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<%@ page import="com.statusboard.ApparatusStatus; com.statusboard.DutyTime; com.statusboard.Staff; com.statusboard.DutyShift" contentType="text/html;charset=UTF-8" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main"/>
    <title>Shift Personnel</title>

    <g:javascript>
        $(document).ready(function () {
            $("select[multiple]").bsmSelect({
                addItemTarget: 'bottom',
                animate: true,
                highlight: true,
                plugins: [
                    $.bsmSelect.plugins.sortable({ axis: 'y', opacity: 0.5}, {listSortableClass: 'bsmListSortableCustom'})
                ]
            });
        });
    </g:javascript>

</head>

<body>
<div class=container-fluid>
    <h3>Shift Personnel</h3>

    <g:form controller="controlPanel" action="savePersonnel">
        <div class="row">
            <div class="span5 alert alert-info">
                <strong>Note!</strong> Please leave on-duty Duty Chief selected
            </div>
        </div>

        <div class="row">
            <div class="span4">
                <g:select name="whosHereId"
                          multiple="true"
                          title="--: Click to Add Staff :--"
                          optionKey="id"
                          value="${losapInstance.staffId}"
                          from="${staffInstance.listOrderByLastName()}"/>
            </div>
        </div>

        <div class="row">
            <div class="form-actions">
                <g:actionSubmit class="btn btn-primary" value="Save Changes" action="savePersonnel"/>
                <g:actionSubmit class="btn-danger" value="Discard Changes" action="index"/>
            </div>
        </div>
    </g:form>
</div>
</body>
</html>
