function main_feature(G,pid, sid,INDIR,OUTDIR,MODEL)
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

fprintf('%-6s %-6s %-20s Task (',pid,sid,'main_feature');
indir=[G.DIR.DATA G.DIR.SEP INDIR];
infile=[MODEL.STUDYTYPE '_' pid '_' sid '_' MODEL.NAME '_' G.FILE.WINDOW_MATNAME];
outdir=[G.DIR.DATA G.DIR.SEP OUTDIR];
outfile=[MODEL.STUDYTYPE '_' pid '_' sid '_' MODEL.NAME '_' G.FILE.FEATURE_MATNAME];

load ([indir G.DIR.SEP infile]);
if G.RUN.FEATURE.LOADDATA==1 & exist([outdir G.DIR.SEP outfile],'file')==2
    load([outdir G.DIR.SEP outfile]);
else
    F=W;
end
F.NAME=['FEATURE[' G.STUDYNAME ' ' pid ' ' sid ']'];

for i=MODEL.SENSORLIST
    if i==G.SENSOR.R_ACLXID
        F.FEATURE{G.FEATURE.R_ACLID}.FEATURENAME=G.FEATURE.R_ACL;
        F.FEATURE{G.FEATURE.R_ACLID}.SENSOR='ACL';

        F.window=main_feature_accel(G,F.window);
	elseif i==G.SENSOR.R_ECGID
        F.FEATURE{G.FEATURE.R_ECGID}.FEATURENAME=G.FEATURE.R_ECG;
        F.FEATURE{G.FEATURE.R_ECGID}.SENSOR='ECG';
        F.window=main_feature_ecg(G,F.window);
    elseif i==G.SENSOR.R_RIPID
        F.FEATURE{G.FEATURE.R_RIPID}.FEATURENAME=G.FEATURE.R_RIP;
        F.FEATURE{G.FEATURE.R_RIPID}.SENSOR='RIP';
        F.window=main_feature_rip(G,F.window);
    end
end
%{
if ~isempty(find(MODEL.FEATURE_NORM==FEATURE.RIPID,1))
    F=normalize_data(F,FEATURE.RIPID,FEATURE.RIP.NORMALIZE,MODEL);
end
if ~isempty(find(MODEL.FEATURE_NORM==FEATURE.ECGID,1))
    F=normalize_data(F,FEATURE.ECGID,FEATURE.ECG.NORMALIZE,MODEL);
end
if ~isempty(find(MODEL.FEATURE_NORM==FEATURE.CHESTACCELID,1))
    F=normalize_data(F,FEATURE.CHESTACCELID,FEATURE.CHESTACCEL.NORMALIZE,MODEL);
end

if isfield(W.sensor,'label')
%    F.sensor(1).feature(:,1)=W.label;
    %F.label(:,LABEL.PUFFNONPUFFIND)=W.label;
    F.output(:,LABEL.ACTIVITYIND)=W.sensor(SENSOR.R_ACLXID).label(:,LABEL.ACTIVITYIND);
end
%}

if isempty(dir(outdir))
    mkdir(outdir);
end

save([outdir G.DIR.SEP outfile],'F');
