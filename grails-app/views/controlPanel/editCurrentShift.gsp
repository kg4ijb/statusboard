<%@ page import="com.statusboard.RidingAssignment; com.statusboard.Apparatus" %>
<!DOCTYPE html>
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

<html>
<head>
    <title>Edit Current Shift</title>
</head>

<body>

Duty Shift: ${shiftInstance.dutyShift} <br>
Duty Time: ${shiftInstance.dutyTime} <br>
Duty Officer: ${shiftInstance.dutyOfficer} <br>
Station Commander: ${shiftInstance.stationCommander} <br>
Shift Notes: ${shiftInstance.note} <br>


${shiftInstance.ridingAssignments.each { RidingAssignment ra ->
    println "Staff: ${ra.staff}    <br>"
}
}
<br><hr>
<gsp:set var="ras" value="${shiftInstance.getRidingAssignments()}"/>
TEST: ${ras}<br>

<gsp:each var="ra" in=" $ ras">
    ${ra} -- <br>
</gsp:each>

Done?
<br><br>


<br><hr>

</body>
</html>
