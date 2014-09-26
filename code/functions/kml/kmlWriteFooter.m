function [ ret ] = kmlWriteFooter( fpOut )
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
    try
        skeletonPath = 'skleton_kml.txt';
        skeletonKml = getFileContent(skeletonPath);
        skeletonKmlParts = regexp(skeletonKml,'#PUT_CONTENT_HERE#', 'split');
        %skeletonKmlHeader = char(skeletonKmlParts(1));
        skeletonKmlFooter = char(skeletonKmlParts(2));

        fprintf(fpOut, '%s', skeletonKmlFooter);

        ret = true;
    catch e
        disp(['Error : ' e.message]);
        ret = false;
    end
end
