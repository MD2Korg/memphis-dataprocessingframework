function D=normalize_rrintervals(D,normalization_times,type)
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
global SENSOR
global NORMALIZATION

if nargin < 3
    type = 1;
end
temp = D.sensor(SENSOR.R_ECGID);
if nargin >= 2
    inds = [];
    for i=1:size(normalization_times,1)
        inds = [inds, find(temp.rr_timestamp >= normalization_times(i,1) & temp.rr_timestamp <= normalization_times(i,2))];
    end

    x = temp.rr_value(inds);
    x = x(temp.rr_outlier(inds) ~= 1);
else
    x = temp.rr_value(temp.rr_outlier ~= 1);
end

med = nanmedian(x);
mad = nanmedian(abs(x-med));


low = med-NORMALIZATION.BETA*mad;
high = med+NORMALIZATION.BETA*mad;
if NORMALIZATION.TRIM
    x = x(x<=high & x >= low);
else
    x(x>high) = high;
    x(x<low) = low;
end

if type == 1
    D.sensor(SENSOR.R_ECGID).rr_value(temp.rr_outlier ~= 1)=(D.sensor(SENSOR.R_ECGID).rr_value(temp.rr_outlier ~= 1)-nanmean(x))/sqrt(nanvar(x));
elseif type == 2
    D.sensor(SENSOR.R_ECGID).rr_value(temp.rr_outlier ~= 1)=(x-nanmean(x))/sqrt(nanvar(x));
else
    D.sensor(SENSOR.R_ECGID).rr_value(temp.rr_outlier ~= 1)=(D.sensor(SENSOR.R_ECGID).rr_value(temp.rr_outlier ~= 1)-nanmean(D.sensor(SENSOR.R_ECGID).rr_value(temp.rr_outlier ~= 1)))/sqrt(nanvar(D.sensor(SENSOR.R_ECGID).rr_value(temp.rr_outlier ~= 1)));
end
end
