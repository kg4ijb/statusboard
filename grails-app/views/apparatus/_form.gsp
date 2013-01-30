%{--
  - Copyright 2005-2013 StationStatusboard.com
  - Licensed under the Apache License, Version 2.0 (the "License");
  - you may not use this file except in compliance with the License.
  - You may obtain a copy of the License at
  -
  -      http://www.apache.org/licenses/LICENSE-2.0
  -
  - Unless required by applicable law or agreed to in writing, software
  - distributed under the License is distributed on an "AS IS" BASIS,
  - WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  - See the License for the specific language governing permissions and
  - limitations under the License.
  --}%

<%@ page import="com.statusboard.Apparatus" %>


<div class="control-group fieldcontain ${hasErrors(bean: apparatusInstance, field: 'name', 'error')} required">
    <label class="control-label" for="name">
        <g:message code="apparatus.name.label" default="Name"/>
        <span style="color: red" class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:textField name="name" required="" value="${apparatusInstance?.name}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: apparatusInstance, field: 'description', 'error')} required">
    <label class="control-label" for="description">
        <g:message code="apparatus.description.label" default="Description"/>
        <span style="color: red" class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:textField name="description" required="" value="${apparatusInstance?.description}"/>
    </div>
</div>

<div class=control-group "fieldcontain ${hasErrors(bean: apparatusInstance, field: 'isALS', 'error')} ">
<label class="control-label" for="isALS">
    <g:message code="apparatus.isALS.label" default="Is ALS"/>

</label>

<div class="controls">
    <g:checkBox name="isALS" value="${apparatusInstance?.isALS}"/>
</div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: apparatusInstance, field: 'isRescue', 'error')} ">
    <label class="control-label" for="isRescue">
        <g:message code="apparatus.isRescue.label" default="Is Rescue"/>

    </label>

    <div class="controls">
        <g:checkBox name="isRescue" value="${apparatusInstance?.isRescue}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: apparatusInstance, field: 'numSeats', 'error')} required">
    <label class="control-label" for="numSeats">
        <g:message code="apparatus.numSeats.label" default="Num Seats"/>
        <span style="color: red" class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:field type="number" name="numSeats" required=""
                 value="${fieldValue(bean: apparatusInstance, field: 'numSeats')}"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: apparatusInstance, field: 'note', 'error')} ">
    <label class="control-label" for="note">
        <g:message code="apparatus.note.label" default="Note"/>

    </label>

    <div class="controls">
        <g:select id="note" name="note.id" from="${com.statusboard.Note.list()}" optionKey="id"
                  value="${apparatusInstance?.note?.id}" class="many-to-one" noSelection="['null': '']"/>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: apparatusInstance, field: 'status', 'error')} required">
    <label class="control-label" for="status">
        <g:message code="apparatus.status.label" default="Status"/>
        <span style="color: red" class="required-indicator">*</span>
    </label>

    <div class="controls">
        <g:select id="status" name="status.id" from="${com.statusboard.ApparatusStatus.list()}" optionKey="id"
                  required=""
                  value="${apparatusInstance?.status?.id}" class="many-to-one"/>
    </div>
</div>
