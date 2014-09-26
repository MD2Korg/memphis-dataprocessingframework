function [peakvalley,feature]=main_basicfeature_rip(G,sample,timestamp)
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
peakvalley=[];
feature=[];
fprintf('...RIP');
fprintf('...peak valley');peakvalley=detect_peakvalley_v2(G,sample,timestamp);
if isempty(peakvalley.sample), return;end;

if rem(length(peakvalley.sample),2)~=1, peakvalley.sample(end)=[];peakvalley.timestamp(end)=[];peakvalley.matlabtime(end)=[];end;
feature{G.FEATURE.R_RIP.INSPDURATION}=(peakvalley.timestamp(2:2:end-1)-peakvalley.timestamp(1:2:end-2))/1000;
feature{G.FEATURE.R_RIP.EXPRDURATION}=(peakvalley.timestamp(3:2:end)-peakvalley.timestamp(2:2:end))/1000;
feature{G.FEATURE.R_RIP.RESPDURATION}=(peakvalley.timestamp(3:2:end)-peakvalley.timestamp(1:2:end-2))/1000;
feature{G.FEATURE.R_RIP.STRETCH}=double(BreathStretchCalculate(sample,timestamp,peakvalley.sample,peakvalley.timestamp));
feature{G.FEATURE.R_RIP.IERATIO}=feature{G.FEATURE.R_RIP.INSPDURATION}./feature{G.FEATURE.R_RIP.EXPRDURATION};

%remove outlier based on plausible respiration duration in literature
feature=removeOutlierRespiration(G,feature);
end

function feature=removeOutlierRespiration(G,feature)
    ind=find(feature{G.FEATURE.R_RIP.RESPDURATION}>=(60/65) & feature{G.FEATURE.R_RIP.RESPDURATION}<=(60/8));
    feature{G.FEATURE.R_RIP.INSPDURATION}=feature{G.FEATURE.R_RIP.INSPDURATION}(ind);
    feature{G.FEATURE.R_RIP.EXPRDURATION}=feature{G.FEATURE.R_RIP.EXPRDURATION}(ind);
    feature{G.FEATURE.R_RIP.RESPDURATION}=feature{G.FEATURE.R_RIP.RESPDURATION}(ind);
    feature{G.FEATURE.R_RIP.STRETCH}=feature{G.FEATURE.R_RIP.STRETCH}(ind);
    feature{G.FEATURE.R_RIP.IERATIO}=feature{G.FEATURE.R_RIP.IERATIO}(ind);
end
