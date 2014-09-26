function peakvalley=detect_peakvalley_v2(G,sample,timestamp)
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

peakvalley.METADATA='VP';
peakvalley.sample=[];
peakvalley.timestamp=[];
peakvalley.matlabtime=[];
%peakvalley.sequence=[]; %% indicates valley-peak-valley-peak.. by 0-1-0-1-....
if isempty(sample)
    return;
end

[valley_ind,peak_ind]=peakvalley_v2(sample,timestamp);

if isempty(valley_ind)
    return;
end

valleyPeak=[];
for i=1:length(valley_ind)
    valleyPeak=[valleyPeak valley_ind(i) peak_ind(i)];
end

peakvalley.timestamp=timestamp(valleyPeak);
peakvalley.sample=sample(valleyPeak);
peakvalley.matlabtime=convert_timestamp_matlabtimestamp(G,peakvalley.timestamp);
%ValleyPeak_Sequence=zeros(1,length(valleyPeak));   %% zero~ valley;  one~peak
%ValleyPeak_Sequence(2:2:end)=1;
%peakvalley.sequence=ValleyPeak_Sequence;
end
