function missingRate=getMissingRateFromFormattedData(G,pid,sid)
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

indir=[G.DIR.DATA];
infile=[pid '_' sid '_' G.FILE.FRMTDATA_MATNAME];
load([indir G.DIR.SEP 'formatteddata' G.DIR.SEP infile]);
fid=fopen('C:\Users\mmrahman\Desktop\NIDA\nida_RIP_MissingRate_sessionAdjusted.csv','a');
missingRate=-1;

timestamps=D.sensor{G.SENSOR.R_RIPID}.timestamp_all;
if ~isempty(timestamps)
    d=diff(timestamps)/1000/60;
    pos=[1 find(d>10) length(timestamps)];
    times=D.sensor{G.SENSOR.R_RIPID}.timestamp_all(pos);
    d=diff(times)/1000;
    samplingRate=64/3;
    totalExpectedSamples=sum(d)*samplingRate;
    totalMissingSamples=totalExpectedSamples-length(D.sensor{G.SENSOR.R_RIPID}.sample_all);
    missingRate=totalMissingSamples/totalExpectedSamples;
    fprintf(fid,'%s\n',num2str(missingRate*100));
    fclose(fid);
end
