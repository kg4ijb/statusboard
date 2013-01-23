<%@ page import="com.statusboard.Shift" %>



<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'apparatus', 'error')} ">
    <label for="apparatus">
        <g:message code="shift.apparatus.label" default="Apparatus"/>

    </label>
    <g:select name="apparatus" from="${com.statusboard.Apparatus.list()}" multiple="multiple" optionKey="id" size="5"
              value="${shiftInstance?.apparatus*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'dutyOfficer', 'error')} required">
    <label for="dutyOfficer">
        <g:message code="shift.dutyOfficer.label" default="Duty Officer"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="dutyOfficer" name="dutyOfficer.id" from="${com.statusboard.Staff.list()}" optionKey="id" required=""
              value="${shiftInstance?.dutyOfficer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'dutyShift', 'error')} required">
    <label for="dutyShift">
        <g:message code="shift.dutyShift.label" default="Duty Shift"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="dutyShift" name="dutyShift.id" from="${com.statusboard.DutyShift.list()}" optionKey="id" required=""
              value="${shiftInstance?.dutyShift?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'dutyTime', 'error')} required">
    <label for="dutyTime">
        <g:message code="shift.dutyTime.label" default="Duty Time"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="dutyTime" name="dutyTime.id" from="${com.statusboard.DutyTime.list()}" optionKey="id" required=""
              value="${shiftInstance?.dutyTime?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'notes', 'error')} required">
    <label for="notes">
        <g:message code="shift.notes.label" default="Notes"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="notes" name="notes.id" from="${com.statusboard.Note.list()}" optionKey="id" required=""
              value="${shiftInstance?.notes?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: shiftInstance, field: 'stationCommander', 'error')} required">
    <label for="stationCommander">
        <g:message code="shift.stationCommander.label" default="Station Commander"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="stationCommander" name="stationCommander.id" from="${com.statusboard.Staff.list()}" optionKey="id"
              required="" value="${shiftInstance?.stationCommander?.id}" class="many-to-one"/>
</div>

