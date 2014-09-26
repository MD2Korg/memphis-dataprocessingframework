function [sample,timestamp,matlabtime]=saveGoodData(G,sample_all,timestamp_all,matlabtime_all,quality)
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
sample=[];timestamp=[];matlabtime=[];
ind=find(quality.value==G.QUALITY.GOOD);
for i=ind
    s=quality.starttimestamp(i);
    t=quality.endtimestamp(i);
    ind=find(timestamp_all>=s & timestamp_all<=t);
    sample=[sample sample_all(ind)];
    timestamp=[timestamp timestamp_all(ind)];
	matlabtime=[matlabtime matlabtime_all(ind)];
end
end
