function timestamp = correct_timestamps_basic(timestamp,freq)
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
sampletime=1.0/freq;
sampleLen=5;
addfreq=(1000.0*sampletime)*((sampleLen-1):-1:1);
mult=sampleLen-1:-1:1;
col=size(timestamp,2);
for r=sampleLen:sampleLen:col
    if r==sampleLen
        timestamp(r-sampleLen+1:r-1)=timestamp(r)-addfreq;
    else
        timediff=timestamp(r)-timestamp(r-sampleLen);
        if timediff>5*addfreq(sampleLen-1)
            timestamp(r-sampleLen+1:r-1)=timestamp(r)-addfreq;
        else
            timestamp(r-sampleLen+1:r-1)=timestamp(r)-(timediff/5)*mult;
        end
    end
end
