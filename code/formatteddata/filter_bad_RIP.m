function [sample,timestamp,matlabtime]=filter_bad_RIP(sample,timestamp,matlabtime, windowlength,range_threshold)
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

if nargin < 5
   range_threshold = 100;
end
if nargin < 4
   windowlength = 50;
end
 slope_threshold=1500;

%% Filter
%fs=21.33;
%f=2/fs;
%delp=0.02;
%dels1=0.02;
%dels2=0.02;
%F = [0 0.1*f  0.25*f 0.6*f  0.75*f 1]; %RIP Frequency band edges [Passband 0.25- Hz]
%A = [0  0   1  1  0 0]; % Desired amplitude [1=Passband; 0= Stop band]
%w=[1000/dels1 1/delp 1/dels2];
%%fl=256;
%B = firls(fl,F,A,w);
%x_filtered= conv(sample,B,'same');
%%

%figure;plot(timestamp,sample);hold on;
%plot(timestamp,x_filtered,'r');
%sample=x_filtered;

for i=1:windowlength:length(sample)-(windowlength-1)
   win = i:i+windowlength-1;
   mins = min(sample(win));
   maxs = max(sample(win));
   range=maxs-mins;
   stdDev=std(sample(win));
maximum_slope=(max(diff(sample(win))));
    if if (range<range_threshold && maxs > 4000) || mins==0 || maximum_slope > slope_threshold% if variation/range of windowed signal is less than threshold
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

%hold on;plot(timestamp,sample,'.g');
end
