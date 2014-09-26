function [sample,timestamp]=filter_bad_ecg_v2(sample,timestamp)
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

windowlength=128;
range_threshold=200;
slope_threshold=50;

for i=1:windowlength:length(sample)-(windowlength-1)
   win = i:i+windowlength-1;
   mins = min(sample(win));
   maxs = max(sample(win));
   range=maxs-mins;
   median_slope = median(abs(diff(sample(win))));

    if range<range_threshold ||median_slope > slope_threshold || maxs > 4000
       sample(win) = nan;
       timestamp(win) = nan;
    end
end

sample = sample(~isnan(sample));
timestamp = timestamp(~isnan(timestamp));

end
