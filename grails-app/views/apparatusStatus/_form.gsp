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

<%@ page import="com.statusboard.ApparatusStatus" %>



<div class="control-group fieldcontain ${hasErrors(bean: apparatusStatusInstance, field: 'name', 'error')} ">
    <label class="control-label" for="name">
        <g:message code="apparatusStatus.name.label" default="Name"/>

    </label>

    <div class="controls">
        <g:textField name="name" value="${apparatusStatusInstance?.name}"/>
    </div>
</div>

