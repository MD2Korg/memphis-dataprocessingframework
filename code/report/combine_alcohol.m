function combine_alcohol(pid,sid,STATUS)
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
global DIR FILE SENSOR
indir=DIR.FORMATTEDDATA;
infile=[DIR.SESSIONTYPE_NAME(1) '_' char(pid) '_' char(sid) '_' FILE.FRMTDATA_MATNAME];
load([indir DIR.SEP infile]);

alcmat=[DIR.REPORT DIR.SEP char(pid) '_alc.mat'];


if STATUS==0
    alc.sample=[];
    alc.timestamp=[];
    alc.selfreport=[];
else
    load(alcmat);
end
if isfield(D,'sensor')==1
    alc.sample=[alc.sample D.sensor(SENSOR.A_ALCID).sample];
    alc.timestamp=[alc.timestamp D.sensor(SENSOR.A_ALCID).timestamp];
end
if isfield(D.selfreport(1),'timestamp')==1
    alc.selfreport=[alc.selfreport D.selfreport(1).timestamp'];
end
if isempty(dir(DIR.REPORT))
    mkdir(DIR.REPORT);
end
save(alcmat,'alc');
disp(['[ALC] pid=' pid ' sid=' sid ' : saved']);
