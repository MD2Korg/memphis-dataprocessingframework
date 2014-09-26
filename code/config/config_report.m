%% FILENAME
function REPORT=config_report(G)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Copyright 2014 University of Memphis
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%     http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%%

% option=wear,start,end,miss,valid
REPORT.SHORT.FRMTRAW.BASIC='pid,sid,date'; % option: pid, sid, date
REPORT.SHORT.FRMTRAW.SENSOR{G.SENSOR.R_RIPID}='RIP(wear),RIP(start),RIP(end),RIP(miss)';
REPORT.SHORT.FRMTRAW.SENSOR{G.SENSOR.R_ECGID}='ECG(miss)';
REPORT.SHORT.FRMTRAW.SENSOR{G.SENSOR.R_ECGID}='ACLX(miss)';
%REPORT.SHORT.FRMTRAW.SENSOR{G.SENSOR.P_ACLXID}='PhoneACLX(wear)';
REPORT.SHORT.FRMTRAW.SELFREPORT=['Report('  G.SELFREPORT.ID(G.SELFREPORT.SMKID).NAME '),Report('  G.SELFREPORT.ID(G.SELFREPORT.CRVID).NAME ')']; % Report(drinking)
REPORT.SHORT.FRMTRAW.EMA='EMA(triggered),EMA(answered)';
end
