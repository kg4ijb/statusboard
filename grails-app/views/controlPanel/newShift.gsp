<!DOCTYPE html>
<%@ page import="com.statusboard.Seat; com.statusboard.ApparatusStatus; com.statusboard.DutyTime; com.statusboard.Staff; com.statusboard.DutyShift" contentType="text/html;charset=UTF-8" %>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main"/>
    <title>Statusboard New Shift</title>

    <g:javascript>
        $(document).ready(function () {
            $("select[multiple]").asmSelect({
                addItemTarget: 'bottom',
                animate: true,
                highlight: false,
                sortable: true
            });
        });
    </g:javascript>

</head>

<body>
<g:form class="form-horizontal" controller="controlPanel">
    <div class="tabbable tabs-left">
        <ul class="nav nav-tabs">
            <li><a href="#tab1" data-toggle="tab">General</a></li>
            <g:each status="i" var="n" in="${apparatusInstance}">
                <li><a href="#tab${i + 2}" data-toggle="tab">${n.description}</a></li>
            </g:each>
        </ul>

        <div class="tab-content">
            <div class="tab-pane" id="tab1">
                <div class="row">
                    <div class="span4">
                        <label><h5>Duty Shift</h5></label>

                        <div class='value ${hasErrors(bean: dutyShiftInstance, 'errors')}'>
                            <g:select
                                    name="dutyShift.id"
                                    from="${dutyShiftInstance}"
                                    optionKey="id"
                                    noSelection="${['null': '--  Click to Select  --']}"/>
                        </div>

                        <label><h5>Shift Time</h5></label>
                        <g:radioGroup name="dutyTime.id"
                                      values="${dutyTimeInstance.id}"
                                      labels="${dutyTimeInstance.name}"
                                      optionKey="id">
                            <p>${it.radio} <g:message code="${it.label}"/></p>
                        </g:radioGroup>

                        <label><h5>Station Commander</h5></label>
                        <g:select name="stationCommander.id"
                                  from="${stationCommanders}"
                                  optionKey="id"
                                  noSelection="${['null': '--  Click to Select  --']}"/>

                        <label><h5>Duty Chief</h5></label>
                        <g:select name="dutyOfficer.id"
                                  from="${dutyOfficers}"
                                  optionKey="id"
                                  noSelection="${['null': '--  Click to Select  --']}"/>
                    </div>

                    <div class="span6">
                        <label><h5>Shift Notes</h5></label>
                        <g:textArea name="shiftNotes.id" rows="10" cols="300"/>

                    </div>
                </div>
            </div>
            <g:each in="${apparatusInstance}" var="n" status="i">
                <div class="tab-pane" id="tab${i + 2}">
                    <div class="row">
                        <div class="span3">
                            <label><h5>Apparatus Status</h5></label>
                            <g:select name="app_status${apparatusInstance.get(i).id}.id"
                                      from="${apparatusStatusInstance}"
                                      value="${apparatusInstance.get(i).statusId}"
                                      optionKey="id"/>
                        </div>

                        <div class="span7">
                            <g:each in="${1..n.numSeats}" var="x">
                                <label><h5>${Seat.get(x).name}</h5></label>
                                <g:select name="app${n.id}_seat${x}.id"
                                          from="${onDutyStaffx}"
                                          optionKey="id"
                                          noSelection="${['null': '--  Click to Select  --']}"/> <br>
                            </g:each>

                        </div>
                    </div>
                </div>
            </g:each>
        </div> <!-- /.tab-content -->
    </div> <!-- /.tabbable -->

    <div class="form-actions">
        <g:actionSubmit class="btn btn-primary" value="Save Changes" action="newShiftSave"/>
    </div>

</g:form>

</body>
</html>
