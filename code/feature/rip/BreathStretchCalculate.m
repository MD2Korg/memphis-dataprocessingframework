function strchV = BreathStretchCalculate(ripV,ripT,peakvalley_sample,peakvalley_timestamp)
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

nmins = length(peakvalley_timestamp);

%peakind = 1;
strchV = [];%zeros([(nmins-1)/2,1]);
for i=1:2:nmins-2
    peak1_time = peakvalley_timestamp(i);
    peak2_time = peakvalley_timestamp(i+2);

    if peak1_time == -1 || peak2_time == -1 || peak2_time <  peakvalley_timestamp(i+1)  || peakvalley_timestamp(i+1) < peak1_time
        continue
    end
    maxpeak = double(peakvalley_sample(i+1));
%    minval = min(ripV(ripT >= peak1_time & ripT <= peak2_time));
    minval = min(ripV(ripT >= peak1_time & ripT <= peak2_time));
    strchV(end+1) = maxpeak-minval;
%    peakind = peakind + 1;
end
end
