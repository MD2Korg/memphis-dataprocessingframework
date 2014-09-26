function temp_update_frmtdata_acl(G,INDIR)
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
indir=[G.DIR.DATA G.DIR.SEP INDIR];

files=dir(indir);
for i=3:length(files)
    load([indir G.DIR.SEP files(i).name]);
    disp(files(i).name);
    for sensorid=[G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID]
        D.sensor{sensorid}.sample_all=D.sensor{sensorid}.sample;
        D.sensor{sensorid}.timestamp_all=D.sensor{sensorid}.timestamp;
        D.sensor{sensorid}.matlabtime_all=D.sensor{sensorid}.matlabtime;
        D.sensor{sensorid}.sample=remove_drift_accel(D.sensor{sensorid}.sample_all);
    end;
    save([indir G.DIR.SEP files(i).name],'D');
    clear D;
end
end
