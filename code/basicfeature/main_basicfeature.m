function main_basicfeature(G,pid,sid,INDIR,OUTDIR)
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

%% Load Data (Formatted Raw, Formatted Data)
fprintf('%-6s %-6s %-20s Task (',pid,sid,'main_basicfeature');
indir=[G.DIR.DATA G.DIR.SEP INDIR];
infile=[pid '_' sid '_' G.FILE.FRMTDATA_MATNAME];
outdir=[G.DIR.DATA G.DIR.SEP OUTDIR];
outfile=[pid '_' sid '_' G.FILE.BASICFEATURE_MATNAME];

if isempty([indir G.DIR.SEP infile]),    disp(['FILE NOT FOUND' indir G.DIR.SEP infile]);return;end
load([indir G.DIR.SEP infile]);
if isempty(dir([outdir G.DIR.SEP outfile])) || G.RUN.BASICFEATURE.LOADDATA==0, B=D;
else load([outdir G.DIR.SEP outfile]);end

for i=1:length(B.sensor)
    if isfield(B.sensor{i},'matlabtime_all'), B.sensor{i}=rmfield(B.sensor{i},'matlabtime_all');end
    if isfield(B.sensor{i},'timestamp_all'), B.sensor{i}=rmfield(B.sensor{i},'timestamp_all');end
    if isfield(B.sensor{i},'sample_all'), B.sensor{i}=rmfield(B.sensor{i},'sample_all');end
end

B.NAME=['BASICFEATURE[' G.STUDYNAME ' ' pid ' ' sid ']'];
if G.RUN.BASICFEATURE.PEAKVALLEY,
    [B.sensor{G.FEATURE.R_RIPID}.peakvalley,B.sensor{G.FEATURE.R_RIPID}.feature]=main_basicfeature_rip(G,D.sensor{G.SENSOR.R_RIPID}.sample,D.sensor{G.SENSOR.R_RIPID}.timestamp);end
if G.RUN.BASICFEATURE.RR,
    B.sensor{G.FEATURE.R_ECGID}.rr=main_basicfeature_ecg(G,D.sensor{G.SENSOR.R_ECGID}.sample,D.sensor{G.SENSOR.R_ECGID}.timestamp);end
if isfield(G.RUN.BASICFEATURE,'DRIVING') && G.RUN.BASICFEATURE.DRIVING
	B.driving=main_basicfeature_driving(G, D.sensor);
end
%{
%% accelerometer preprocessing test
x = medfilt1(D.sensor{G.SENSOR.R_ACLXID}.sample);  %median filter to smooth the raw data
y = medfilt1(D.sensor{G.SENSOR.R_ACLYID}.sample);
z = medfilt1(D.sensor{G.SENSOR.R_ACLZID}.sample);
n=10;                                      %10 samples window for drift removal
dt_x=[];    dt_y=[];    dt_z=[];     %output signal after drift removal
last=min([length(x),length(y),length(z)])-n;
for i=1:n:last
    sample_x=x(i:i+9);
    sample_y=y(i:i+9);
    sample_z=z(i:i+9);
    dt_x=[dt_x detrend(sample_x)];
    dt_y=[dt_y detrend(sample_y)];
    dt_z=[dt_z detrend(sample_z)];
end

B.sensor{G.SENSOR.R_ACLXID}.dt_x.value=dt_x(1:last);
B.sensor{G.SENSOR.R_ACLXID}.dt_x.timestamp=D.sensor{G.SENSOR.R_ACLXID}.timestamp(1:last);

B.sensor{G.SENSOR.R_ACLYID}.dt_y.value=dt_y(1:last);
B.sensor{G.SENSOR.R_ACLYID}.dt_y.timestamp=D.sensor{G.SENSOR.R_ACLYID}.timestamp(1:last);

B.sensor{G.SENSOR.R_ACLZID}.dt_z.value=dt_z(1:last);
B.sensor{G.SENSOR.R_ACLZID}.dt_z.timestamp=D.sensor{G.SENSOR.R_ACLZID}.timestamp(1:last);

var_x=[]; var_y=[]; var_z=[]; time_x=[];time_y=[]; time_z=[];
for i=B.sensor{G.SENSOR.R_ACLXID}.dt_x.timestamp(1):60000:B.sensor{G.SENSOR.R_ACLXID}.dt_x.timestamp(end)
    indx=find(B.sensor{G.SENSOR.R_ACLXID}.dt_x.timestamp>=i & B.sensor{G.SENSOR.R_ACLXID}.dt_x.timestamp<i+60000);
    if ~isempty(indx)
        var_x=[var_x var(B.sensor{G.SENSOR.R_ACLXID}.dt_x.value(indx))];
        time_x=[time_x i];
    end
end
B.sensor{G.SENSOR.R_ACLXID}.var_x.value=var_x;
B.sensor{G.SENSOR.R_ACLXID}.var_x.timestamp=time_x;

for i=B.sensor{G.SENSOR.R_ACLYID}.dt_y.timestamp(1):60000:B.sensor{G.SENSOR.R_ACLYID}.dt_y.timestamp(end)
    indy=find(B.sensor{G.SENSOR.R_ACLYID}.dt_y.timestamp>=i & B.sensor{G.SENSOR.R_ACLYID}.dt_y.timestamp<i+60000);
    if ~isempty(indy)
        var_y=[var_y var(B.sensor{G.SENSOR.R_ACLYID}.dt_y.value(indy))];
        time_y=[time_y i];
    end
end
B.sensor{G.SENSOR.R_ACLYID}.var_y.value=var_y;
B.sensor{G.SENSOR.R_ACLYID}.var_y.timestamp=time_y;

for i=B.sensor{G.SENSOR.R_ACLZID}.dt_z.timestamp(1):60000:B.sensor{G.SENSOR.R_ACLZID}.dt_z.timestamp(end)
    indz=find(B.sensor{G.SENSOR.R_ACLZID}.dt_z.timestamp>=i & B.sensor{G.SENSOR.R_ACLZID}.dt_z.timestamp<i+60000);
    if ~isempty(indz)
        var_z=[var_z var(B.sensor{G.SENSOR.R_ACLZID}.dt_z.value(indz))];
        time_z=[time_z i];
    end
end
B.sensor{G.SENSOR.R_ACLZID}.var_z.value=var_z;
B.sensor{G.SENSOR.R_ACLZID}.var_z.timestamp=time_z;
%}
%% Save Data
if isempty(dir(outdir))
    mkdir(outdir);
end
save([outdir G.DIR.SEP outfile],'B');
fprintf(') =>  done\n');

end
