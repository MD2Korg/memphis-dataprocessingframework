function window=main_feature_accel(G,window)
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
    
fprintf('...accel');
numofwindow = length(window);
%basic features
for i=1: numofwindow
    if window(i).sensor{G.SENSOR.R_ACLXID}.quality~=G.QUALITY.GOOD || ...
        window(i).sensor{G.SENSOR.R_ACLYID}.quality~=G.QUALITY.GOOD ||...
        window(i).sensor{G.SENSOR.R_ACLZID}.quality~=G.QUALITY.GOOD,
        window(i).feature{G.FEATURE.R_ACLID}.quality=G.QUALITY.BAD;
        continue;
    end;
    window(i).feature{G.FEATURE.R_ACLID}.quality=G.QUALITY.GOOD;
    %window(i).feature{G.FEATURE.R_ACLID}.value=accelerometerfeature_extraction(G,window(i).sensor{G.SENSOR.R_ACLXID},window(i).sensor{G.SENSOR.R_ACLYID},window(i).sensor{G.SENSOR.R_ACLZID});
    window(i).feature{G.FEATURE.R_ACLID}.value=accelerometerfeature_extraction_new(G,window(i).sensor{G.SENSOR.R_ACLXID},window(i).sensor{G.SENSOR.R_ACLYID},window(i).sensor{G.SENSOR.R_ACLZID},32/3);

%    accelerometerfeature_extraction(W.sensor{SENSOR.R_ACLXID}.window(i),W.sensor{SENSOR.R_ACLYID}.window(i),W.sensor{SENSOR.R_ACLZID}.window(i));
%    end
end


end
