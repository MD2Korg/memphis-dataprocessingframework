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
clear all
G=config();
G=config_run_MinnesotaLab(G);
participant = 7;
session = 3;

INDIR = 'formatteddata';
pid = ['p' num2str(participant','%02d')];
sid = ['s' num2str(session','%02d')];
indir=[G.DIR.DATA G.DIR.SEP INDIR];
infile=[pid '_' sid '_' G.FILE.FRMTDATA_MATNAME];
if exist([indir G.DIR.SEP infile],'file')~=2,return;end
m=load([indir G.DIR.SEP infile]);

fp=fopen([G.DIR.DATA G.DIR.SEP 'report\' pid '_' sid '_loss_report.csv'], 'w');
fprintf(fp, 'Participant,Session,Sensor_ID,Sensor_Name,Expected,Found,Loss,maxOutage(s)\n');

slist=[ ...
G.SENSOR.R_RIPID,...
G.SENSOR.R_ECGID,...
G.SENSOR.R_ACLXID, ...
G.SENSOR.R_ACLYID, ...
G.SENSOR.R_ACLZID, ...
G.SENSOR.WR9_ACLXID, ...
G.SENSOR.WR9_ACLYID, ...
G.SENSOR.WR9_ACLZID, ...
G.SENSOR.WR9_GYRXID, ...
G.SENSOR.WR9_GYRYID, ...
G.SENSOR.WR9_GYRZID, ...
G.SENSOR.WR9_NULLID, ...
G.SENSOR.WL9_ACLXID, ...
G.SENSOR.WL9_ACLYID, ...
G.SENSOR.WL9_ACLZID, ...
G.SENSOR.WL9_GYRXID, ...
G.SENSOR.WL9_GYRYID, ...
G.SENSOR.WL9_GYRZID, ...
G.SENSOR.WL9_NULLID ...
];

for i=slist
    if length(m.D.sensor{slist(i)}.timestamp)>0
        minTT = m.D.sensor{slist(i)}.timestamp(1);
        maxTT = m.D.sensor{slist(i)}.timestamp(end);
        break;
    end
end
for i=slist
    try
        sensorName = G.SENSOR.ID(i).NAME;
        idealFreq = G.SENSOR.ID(i).FREQ;

        maxOutage = max(diff(m.D.sensor{i}.timestamp))/1000;

        minTT = min([minTT m.D.sensor{i}.timestamp(1)]);
        maxTT = max([maxTT m.D.sensor{i}.timestamp(end)]);
        durationS = (m.D.sensor{i}.timestamp(end) - m.D.sensor{i}.timestamp(1))/1000;

        durationS = durationS - maxOutage;

        sampleCount = length(m.D.sensor{i}.timestamp);
        packetHz = sampleCount/durationS;
        loss = ((idealFreq-packetHz)/idealFreq)*100;

        fprintf('Sensor %d - %s - Expected: %.2f Hz, Found: %.2f, Loss: %.1f%%, maxOutage: %.1f\n', i, sensorName, idealFreq, packetHz, loss, maxOutage);
        fprintf(fp, '%d,%d,%d,%s,%.2f Hz,%.2f,%.1f%%,%.1f\n', participant,session,i, sensorName, idealFreq, packetHz, loss, maxOutage);
    catch e
        fprintf('Sensor %d - %s - Expected: %.2f Hz, Found: -, Loss: -, maxOutage: -\n', i, sensorName, idealFreq);
        fprintf(fp, '%d,%d,%d,%s,%.2f Hz,-,-,-\n', participant,session,i, sensorName, idealFreq);
    end
end
fprintf('From: %s\n', convert_timestamp_time(G, minTT));
fprintf('To: %s\n', convert_timestamp_time(G, maxTT));

fprintf(fp, '\nFrom: %s\n\n', convert_timestamp_time(G, minTT));
fprintf(fp, 'To: %s\n\n', convert_timestamp_time(G, maxTT));

fclose(fp);

%[a index] = max(diff(m.D.sensor{i}.timestamp));
%convert_timestamp_time(G,m.D.sensor{i}.timestamp(index+1));
%convert_timestamp_time(G,m.D.sensor{i}.timestamp(index));
