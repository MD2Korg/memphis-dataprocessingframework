function quality=calculateDataQuality(G,sample,timestamp,sensorid,starttimestamp,endtimestamp)
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

WINDOWSIZE=3*1000; % 3 seconds

quality.METADATA=G.QUALITY;
quality.starttimestamp=[];
quality.endtimestamp=[];
quality.value=[];
qual=getQualityBySensorID(G,sample,timestamp,sensorid,starttimestamp,endtimestamp,WINDOWSIZE);
%D.sensor{sensorid}.quality=quality;
D.sensor{sensorid}.META_QUALITY=G.QUALITY;
%D.sensor{sensorid}.valid.starttimestamp=[];
%D.sensor{sensorid}.valid.endtimestamp=[];

if size(qual.value,2)==0
    return;
end
now=0;
len=size(qual.value,2);
for i=1:len
    if i==1 || qual.value(i-1)~=qual.value(i)
        now=now+1;
        quality.starttimestamp(now)=qual.timestamp(i);
        quality.value(now)=qual.value(i);
    end
    quality.endtimestamp(now)=qual.timestamp(i)+WINDOWSIZE;
end
end


function quality=getQualityBySensorID(G,sample,timestamp,sensorid,starttimestamp,endtimestamp,WINDOWSIZE)
quality.value=[];
quality.timestamp=[];
%it calculates quality of RIP data using Dr. Kurt Plarre's algorithm. If one chunk / segment of data is given with timestamp
%DATA_QUALITY_GOOD = 0;DATA_QUALITY_NOISE = 1;DATA_QUALITY_BAND_LOOSE =2; DATA_QUALITY_BAND_OFF = 3;

%it calculates rip data quality for each three seconds window. We create a chunk of data between two successive bad quality. We assume that data quality in the chunk is good. Then we calculate missing rate for that chunk of data: how many we get and how many we have. we can save total
%number of samples we have and total number of samples we missed. we also count valid duration first it finds the big chunk of available data from the first difference of the timestamp. Then for each big chunk of data, we run quality calculation individually

%for ECG and RIP quality, we have used method/algorithm developed by Dr.
%Kurt Plarre
if sensorid==G.SENSOR.R_RIPID
    javaQ=RipQualityCalculation();
elseif sensorid==G.SENSOR.R_ECGID
    javaQ=ECGQualityCalculation();
end

if isempty(sample)
    return;
end;
for start=starttimestamp:WINDOWSIZE:endtimestamp
    ind=find(timestamp>=start & timestamp<start+WINDOWSIZE);
    if isempty(ind)
        quality.value=[quality.value G.QUALITY.MISSING];
        quality.timestamp=[quality.timestamp start];
        continue;
    end
    window=sample(ind);
    quality_val=javaQ.currentQuality(window);
    quality.value=[quality.value quality_val];
    quality.timestamp=[quality.timestamp start];
end
end
