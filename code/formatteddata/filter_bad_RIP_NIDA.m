function[sample,timestamp,matlabtime]=filter_bad_RIP_NIDA(sample,timestamp,matlabtime)
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

 windowlength = 50;
 range_threshold = 100;
 slope_threshold=1500;

% figure;
% % plot(sample,'m');hold on;
for i=1:windowlength:length(sample)-(windowlength-1)
     win = i:i+windowlength-1;
     mins = min(sample(win));
     maxs = max(sample(win));
     range=maxs-mins;
     maximum_slope=(max(diff(sample(win))));

     if (range<range_threshold && maxs > 4000) || mins==0 || maximum_slope > slope_threshold % if variation/range of windowed signal is less than threshold
         sample(win) = nan;
         timestamp(win) = nan;
         matlabtime(win)=nan;
     end
 end

 if (length(sample)-i)>0
     sample(i:end)=nan;
     timestamp(i:end)=nan;
    matlabtime(i:end)=nan;
 end
 sample = sample(~isnan(sample));
 timestamp = timestamp(~isnan(timestamp));
 matlabtime=matlabtime(~isnan(matlabtime));
 end
