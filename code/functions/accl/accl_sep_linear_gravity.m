function [ acclMps2, linearAccl, gravityCmp ] = accl_sep_linear_gravity( rawData, bias )
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

len = length(rawData);
acclMps2 = zeros(1, len);
%linearAccl = zeros(1, len);
gravityCmp = zeros(1, len);
gravity=0;
alpha=0.8;

for i=1:len
	acclMps2(i)=(rawData(i)-bias)/4096*3.0*9.8/0.27;
	gravity = alpha*gravity + (1-alpha)*acclMps2(i);
	gravityCmp(i) = gravity;
end

linearAccl = acclMps2-gravityCmp;

end
