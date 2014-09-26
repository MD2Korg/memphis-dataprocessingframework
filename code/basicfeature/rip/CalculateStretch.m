function strchV = CalculateStretch(sample,timestamp,pv_sample,pv_timestamp)
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
valleyT=pv_timestamp(1:2:end);
peakV=pv_sample(2:2:end);
N=size(valleyT,2);

strchV = zeros(1,N-1);
for i=1:N-1
    valleyST=valleyT(i);
    valleyET=valleyT(i+1);
    maxV=peakV(i);
    minV=min(sample(find(timestamp >= valleyST & timestamp <= valleyET)));
    strchV(i) = maxV-minV;
end
end
