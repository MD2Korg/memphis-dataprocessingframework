function result=GetWekaResults(filename)
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
result=[];
fname=[filename,'.txt'];

id=fopen(fname,'r');
line=0;
count=0;
while 1
    line=fgetl(id);
    if line==-1 break;
    end;
    if isempty(line) continue; end;
    if ~isempty(regexp(line,'=== Stratified cross-validation ==='))
        break;
    end;
end;
while 1
    line=fgetl(id);
    if line==-1 break;
    end;
    if isempty(line) continue; end;
    if ~isempty(regexp(line,'Correctly Classified Instances'))
        acc=textscan(line,'%s %s %s %d %f');
        %ind=find(line==' ');
        %i1=ind(end-1);
        %i2=ind(end);
        str=sprintf('Accuracy: %f',acc{5});
        result{1}=str;
        %disp(line);
        break;
    end;
end;
while 1
    line=fgetl(id);
    if line==-1 break;
    end;
    if isempty(line) continue; end;
    if ~isempty(regexp(line,'Kappa statistic'))
        %ind=find(line==' ');
        %i=ind(end);
        %str=sprintf('Kappa Value: %s',line(i+1:length(line)));
        acc=textscan(line,'%s %s %f');
        %ind=find(line==' ');
        %i1=ind(end-1);
        %i2=ind(end);
        str=sprintf('Kappa: %f',acc{3});
        result{2}=str;
        %disp(line);
        break;
    end;
end;
while 1
    line=fgetl(id);
    if line==-1 break;
    end;
    if isempty(line) continue; end;
    if ~isempty(regexp(line,'=== Confusion Matrix ==='))
        result{3}=line;
        %disp(line);
        line=fgetl(id);
        line=fgetl(id);
        result{4}=line;
        %disp(line);

        line=fgetl(id);
        result{5}=line;
        %disp(line);
        line=fgetl(id);
        result{6}=line;
        %disp(line);
        break;
    end;
end;

%line = fgetl(id)
%line = fgetl(id)
%line = fgetl(id)
%line = fgetl(id)
%{
%if (line==-1) break;
    if isempty(line),line='hello';end;
    if line~=-1
        if ~isempty(regexp(line,'Correctly Classified Instances'))

            ind=find(line==' ');
            i1=ind(end-1);
            i2=ind(end);
            disp(line(i1+1:i2-1));
        end;
    end;
end;
%}
fclose(id);
