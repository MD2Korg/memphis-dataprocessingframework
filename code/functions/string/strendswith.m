function b = strendswith(s, pat)
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
%STRENDSWITH Determines whether a string ends with a specified pattern
%
%   b = strstartswith(s, pat);
%       returns whether the string s ends with a sub-string pat.
%

%   History
%   -------
%       - Created by Dahua Lin, on Oct 9, 2008
%

%% main

sl = length(s);
pl = length(pat);

b = (sl >= pl && strcmp(s(sl-pl+1:sl), pat)) || isempty(pat);
