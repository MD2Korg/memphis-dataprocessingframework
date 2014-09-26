function C=curve_base(C,D)
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
val=winsorize(C.Q9_smooth);
%C.C9_envelope_winsorize=val;
if ~isfield(D.labstudy_mark,'timestamp')
    acl_pass=quantile(C.acl(:,30),0.5);
    ind=find(C.acl(:,30)<=acl_pass);
	C.base=mean(val(ind));
else
	minv=min(D.labstudy_mark.timestamp)-30*60*1000; %30 mins
	maxv=max(D.labstudy_mark.timestamp);
	maxv=maxv+1*60*60*1000;		%1 hour
	ind1=find(C.timestamp<minv | C.timestamp>maxv);
    acl_pass=quantile(C.acl(:,27),0.25);
    ind2=find(C.acl(:,27)<=acl_pass);
    ind=intersect(ind1,ind2);
    C.base=mean(val(ind));
end

end
function ind=pass_admin(C)
    acl_pass=quantile(C.acl(:,30),0.3);
    ind=find(C.acl(:,30)<=acl_pass);
end
