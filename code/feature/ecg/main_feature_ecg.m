function window=main_feature_ecg(G,window)
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

fprintf('...ECG');
numofwindow = length(window);

for i=1:numofwindow
    window(i).feature{G.FEATURE.R_ECGID}.quality=window(i).sensor{G.SENSOR.R_ECGID}.quality;
    if window(i).sensor{G.SENSOR.R_ECGID}.quality~=G.QUALITY.GOOD, continue;end;
    window(i).feature{G.FEATURE.R_ECGID}.value=ecgfeature_extract(G,window(i));
end

end
function feature=ecgfeature_extract(G,window)
FR=G.FEATURE.R_ECG;
ind=find(window.sensor{G.SENSOR.R_ECGID}.rr.quality==G.QUALITY.GOOD);
rr=window.sensor{G.SENSOR.R_ECGID}.rr.sample(ind);
feature{FR.RR}=rr;
if isempty(rr), return;end;

[P,f]=HeartRateLomb(rr,1:length(rr));
feature{FR.VRVL} = double(var(rr));
feature{FR.LFHF} = double(HeartRateLFHF(P,f));
feature{FR.HRP1} = double(HeartRatePower12(P,f));
feature{FR.HRP2} = double(HeartRatePower23(P,f));
feature{FR.HRP3} = double(HeartRatePower34(P,f));
feature{FR.RRMN} = double(mean(rr));
feature{FR.RRMD} = double(median(rr));
feature{FR.RRQD} = double(0.5*(prctile(rr,75)-prctile(rr,0.25)));
feature{FR.RR80} = double(prctile(rr,80));
feature{FR.RR20} = double(prctile(rr,20));
if length(rr)>500
    disp('invalid heart rate')
end
feature{FR.RRCT} = double(median(60./rr));
end
