function [ ret ] = kmlCreateFolder( fpOut, folderName, open )
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

    % open = 1 or 0
    try
        fprintf(fpOut, '<Folder>\n');
        fprintf(fpOut, '<name>%s</name>\n<open>%d</open>\n', folderName, open);
        ret = true;
    catch e
        disp(['Error : ' e.message]);
        ret = false;
    end
end
