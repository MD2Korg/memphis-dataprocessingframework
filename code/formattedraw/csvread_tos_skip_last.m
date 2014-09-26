function csvM = csvread_tos_skip_last(filePath)
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

fp = fopen(filePath, 'r');
csv = textscan(fp, '%d64 %d64 %d64 %d64 %d64 %d64 %d64', 'Delimiter', ',');
fclose(fp);

maxCount = length(csv{1});

csvM = [];
rowCount = maxCount-1;

for col=1:length(csv)
    tmp = csv{col};
    csvM(:,col) = tmp(1:rowCount);
end




end
