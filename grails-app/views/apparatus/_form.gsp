<%@ page import="com.statusboard.Apparatus" %>



<div class="fieldcontain ${hasErrors(bean: apparatusInstance, field: 'name', 'error')} required">
    <label for="name">
        <g:message code="apparatus.name.label" default="Name"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="name" required="" value="${apparatusInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apparatusInstance, field: 'description', 'error')} required">
    <label for="description">
        <g:message code="apparatus.description.label" default="Description"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="description" required="" value="${apparatusInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apparatusInstance, field: 'isALS', 'error')} ">
    <label for="isALS">
        <g:message code="apparatus.isALS.label" default="Is ALS"/>

    </label>
    <g:checkBox name="isALS" value="${apparatusInstance?.isALS}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apparatusInstance, field: 'isRescue', 'error')} ">
    <label for="isRescue">
        <g:message code="apparatus.isRescue.label" default="Is Rescue"/>

    </label>
    <g:checkBox name="isRescue" value="${apparatusInstance?.isRescue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apparatusInstance, field: 'numSeats', 'error')} required">
    <label for="numSeats">
        <g:message code="apparatus.numSeats.label" default="Num Seats"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field type="number" name="numSeats" required=""
             value="${fieldValue(bean: apparatusInstance, field: 'numSeats')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apparatusInstance, field: 'note', 'error')} ">
    <label for="note">
        <g:message code="apparatus.note.label" default="Note"/>

    </label>
    <g:select id="note" name="note.id" from="${com.statusboard.Note.list()}" optionKey="id"
              value="${apparatusInstance?.note?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: apparatusInstance, field: 'status', 'error')} required">
    <label for="status">
        <g:message code="apparatus.status.label" default="Status"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="status" name="status.id" from="${com.statusboard.ApparatusStatus.list()}" optionKey="id" required=""
              value="${apparatusInstance?.status?.id}" class="many-to-one"/>
</div>

