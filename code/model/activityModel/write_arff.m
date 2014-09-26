function write_arff(name,featurenames,categorynames,features,categories)%,timestamp)
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

id=fopen([name,'.arff'],'w');

%id_timestamp=fopen([name,'_timestamp.txt'],'w');

fprintf(id,'@relation ');
fprintf(id,name);
fprintf(id,'\n');
fprintf(id,'\n');

for i=1:length(featurenames)
    fprintf(id,'@attribute ');
    fprintf(id,featurenames{i});
    fprintf(id,' numeric');
    fprintf(id,'\n');
end
fprintf(id,'\n');

fprintf(id,'@attribute class_label{');
%n=length(categorynames);
n=length(find(~cellfun(@isempty,categorynames)))
for i=1:n-1
    fprintf(id,categorynames{i});
    fprintf(id,',');
end;
fprintf(id,categorynames{n});
fprintf(id,'}');
fprintf(id,'\n');
fprintf(id,'\n');

fprintf(id,'@data');
fprintf(id,'\n');

[n,m]=size(features);
for i=1:n
    str=categories{i};
    disp(str);
    disp(i);
    if ~strcmp(str,'-1') && isempty(find(isnan(features(i,:))==1)) && sum(features(i,:))~=0  %for training
        for j=1:m,fprintf(id,[num2str(features(i,j)),',']);end;
        %fprintf(id,categories{i});
        fprintf(id,char(str));
        fprintf(id,'\n');
%         fprintf(id_timestamp,num2str(int64(timestamp(i))));
%         fprintf(id_timestamp,'\n');
    end;
end;
fclose(id);
% fclose(id_timestamp);
