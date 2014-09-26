function C=curve_smooth(C)
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
%if size(C.timestamp,2)<10
%	return;
%end
Q9_smooth=smoothn(C.Q9,'robust');
%[high,low]=envelope(C.timestamp,C.Q9,'spline');
%C.Q9_envelope_high=high;
%C.Q9_envelope_low=low;
C.Q9_smooth=Q9_smooth;
end
