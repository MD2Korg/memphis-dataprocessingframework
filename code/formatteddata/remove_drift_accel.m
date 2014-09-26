function [newsample]=remove_drift_accel(sample)
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

    N=10;                                      %10 samples window for drift removal

    %% accelerometer preprocessing test
    %sample=medfilt1(sample);
    newsample=sample;
    if length(sample)>N
        for i=1:N:length(sample)-N
            newsample(i:i+9)=detrend(sample(i:i+9));
        end
        %apply median filter to the new data
        newsample=medfilt1(newsample(1:end));  %ignore the last N samples, since we did not remove the drift from it
    else
        newsample=detrend(medfilt1(newsample));
    end
end
