%convert the data format from the csv to the format of the s3vm input
function write_libsvm(filename, feature,output)
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

fid = fopen(filename, 'w');
[row,col]=size(feature);
for r=1:row
    if output(r)==1
        line='+1';
    else
        line='-1';
    end
    for c=1:col
        num=sprintf('%.10f',feature(r,c));
        line=[line,' ',num2str(c),':',num];
    end
    fprintf(fid,'%s\n',line);

end
fclose(fid);
return;
