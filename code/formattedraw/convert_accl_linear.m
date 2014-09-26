function [ acclMps2, linearAccl, gravityCmp ] = convert_accl_linear(G, id, srcData, bias)
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

k=1;
for i=[G.SENSOR.ID(id).COMPONENTS]
	out(k).NAME=G.SENSOR.ID(i).NAME;
	out(k).METADATA=G.SENSOR.ID(i);
	out(k).timestamp=srcData.timestamp;
	out(k).matlabtime=srcData.matlabtime;
	k=k+1;
end

[ out(1).sample, out(2).sample, out(3).sample ] = accl_sep_linear_gravity( srcData.sample, bias );

acclMps2=out(1);
linearAccl=out(2);
gravityCmp=out(3);

end
