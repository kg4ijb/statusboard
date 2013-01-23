<%@ page import="com.statusboard.RidingAssignment" %>



<div class="fieldcontain ${hasErrors(bean: ridingAssignmentInstance, field: 'apparatus', 'error')} required">
    <label for="apparatus">
        <g:message code="ridingAssignment.apparatus.label" default="Apparatus"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="apparatus" name="apparatus.id" from="${com.statusboard.Apparatus.list()}" optionKey="id" required=""
              value="${ridingAssignmentInstance?.apparatus?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ridingAssignmentInstance, field: 'seat', 'error')} required">
    <label for="seat">
        <g:message code="ridingAssignment.seat.label" default="Seat"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="seat" name="seat.id" from="${com.statusboard.Seat.list()}" optionKey="id" required=""
              value="${ridingAssignmentInstance?.seat?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ridingAssignmentInstance, field: 'staff', 'error')} required">
    <label for="staff">
        <g:message code="ridingAssignment.staff.label" default="Staff"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="staff" name="staff.id" from="${com.statusboard.Staff.list()}" optionKey="id" required=""
              value="${ridingAssignmentInstance?.staff?.id}" class="many-to-one"/>
</div>

