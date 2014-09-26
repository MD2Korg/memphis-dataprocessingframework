function f=BreathMinVent(peakvalley_sample,peakvalley_timestamp)
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
tidalvol = 0;
n = length(peakvalley_sample);
i = 0;
for ind=1:2:n-2
    if peakvalley_timestamp(ind)<peakvalley_timestamp(ind+1) && peakvalley_timestamp(ind+1) < peakvalley_timestamp(ind+2)
        xx = (peakvalley_timestamp(ind+1)-peakvalley_timestamp(ind))/1000;
        yy = (peakvalley_sample(ind+1)-peakvalley_sample(ind));
        tidalvol=tidalvol+(xx*yy)/2;
        i = i + 1;
    end
end
f=tidalvol*i;
end
