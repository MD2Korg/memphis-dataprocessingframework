function [b,s,res]=Results(filename)
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

fname=[filename,'.txt'];

id=fopen(fname,'r');
line=0;
count=0;
while 1
    line=fgetl(id);
    if line==-1 break;
    end;
    if isempty(line) continue; end;
    if ~isempty(regexp(line,' inst#'))
        break;
    end;
end;
b=0;s=0;
res=[];
while 1
    line=fgetl(id);
    if line==-1 break;
    end;
    if isempty(line) continue; end;
    if ~isempty(regexp(line,'baseline'))
        res=[res,'0'];
        b=b+1;
    end
    if ~isempty(regexp(line,'stress'))
        s=s+1;
        res=[res,'1'];
    end;
end;
fclose(id);
