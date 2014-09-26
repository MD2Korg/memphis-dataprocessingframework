function peakvalley=detect_peakvalley(G,sample,timestamp)
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

PEAKVALLEY_WINDOW=10*60*1000; % 10 minute

%This function takes in samples and timestamps and segments it into cycles
%each segment: has its samples and timestamps
%              start time = valley time, endtime = next_valley_time -1
%              peak = index of the peak in this cycle, valley is at 1
peakvalley.METADATA='VPV';
peakvalley.sample=[];
peakvalley.timestamp=[];
peakvalley.matlabtime=[];
if isempty(sample)
    return;
end
for t=timestamp(1):PEAKVALLEY_WINDOW:timestamp(end)
    selected=find(timestamp>=t & timestamp<=t+PEAKVALLEY_WINDOW);
    ripV=sample(selected);
    ripT=timestamp(selected);

    if size(ripV,2)==0
        continue;
    end
    rpvIndVal=RipPVDetect(ripV);

    %% Error Checking
    tind=find(rpvIndVal<0);
    while ~isempty(tind)
        rpvIndVal(floor(tind(1)/4)*4+1:floor(tind(1)/4)*4+4)=[];
        tind=find(rpvIndVal<0);
    end;
    if isempty(rpvIndVal)
        continue;
    end;
    %% Save Peak and Valley
    index=rpvIndVal(1:2:end);
    pvT=ripT(index);
    pvV=ripV(index);
    peakvalley.timestamp=[peakvalley.timestamp,pvT];
    peakvalley.sample=[peakvalley.sample,pvV];

end
ind=find(peakvalley.timestamp(2:end)-peakvalley.timestamp(1:end-1)<0);
while ~isempty(ind)
    peakvalley.sample(ind(1)-1:ind(1))=[];
    peakvalley.timestamp(ind(1)-1:ind(1))=[];
    ind=find(peakvalley.timestamp(2:end)-peakvalley.timestamp(1:end-1)<0);
end
peakvalley.matlabtime=convert_timestamp_matlabtimestamp(G,peakvalley.timestamp);
end
