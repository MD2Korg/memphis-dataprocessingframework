function C=find_quantile(G,W,C)
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
i=0;
for now=1:size(W.window,2)
    if isempty(W.window(now).sensor{G.SENSOR.R_ECGID}), continue;end;
    if W.window(now).sensor{G.SENSOR.R_ECGID}.quality~=G.QUALITY.GOOD,continue;end;
    if isempty(W.window(now).sensor{G.SENSOR.R_ECGID}.rr), continue;end;
    ind=find(W.window(now).sensor{G.SENSOR.R_ECGID}.rr.quality==G.QUALITY.GOOD);
    v=W.window(now).sensor{G.SENSOR.R_ECGID}.rr.sample(ind);
    if isempty(v),continue;end
    i=i+1;
%    C.Q95(i)=quantile(v,0.95);
%    v=winsorize(v);
    C.Q9(i)=quantile(v,0.9);
    C.timestamp(i)=W.window(now).endtimestamp;
    C.matlab_timestamp(i)=W.window(now).end_matlabtime;

end
end
