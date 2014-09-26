function f=HeartRateLFHF(P,f)
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

%rr=rrin/64;t=0;
%for i=1:length(rr)-1
%    t(i+1)=t(i)+rr(i);
%end;

%[P,f]=HeartRateLomb(rr,t);

ind1=find(f<0.09);
ind2=find(f>0.09&f<0.15);
f=sum(P(ind1))/sum(P(ind2));
