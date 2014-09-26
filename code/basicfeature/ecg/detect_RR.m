function rr=detect_RR(G,sample,timestamp)
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
rr.sample=[];
rr.timestamp=[];
FREQ=G.SENSOR.ID(G.SENSOR.R_ECGID).FREQ;
if isempty(sample) || isempty(timestamp), return;end;
if length(sample)<(64*60*15), return;end;

Rpeak_index = ddetect_Rpeak(sample,FREQ,0);

pkT=timestamp(Rpeak_index);
rr.sample=diff(pkT)/1000;
rr.timestamp=pkT(1:end-1);
rr.index=Rpeak_index;
%plot(timestamp,sample);
%hold on;
%plot(timestamp(Rpeak_index),sample(Rpeak_index),'r.');

end
