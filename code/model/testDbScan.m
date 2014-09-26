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
G=config();
G=config_run_memphis(G);

load('c:\dataProcessingFrameworkV2\data\memphis\formatteddata\p15_s01_frmtdata.mat');
start=1000;
endd=2000;
gps=[double(D.sensor{14}.sample(start:endd)),double(D.sensor{15}.sample(start:endd)), D.sensor{15}.timestamp(start:endd)];
speed=D.sensor{17}.sample(start:endd);

[class,type]=DBSCAN(gps,10,500);

fpKml = fopen('c:\DataProcessingFrameworkV2\data\memphis\clurstering\dbcluster.kml','w');
skeletonPath = 'functions/kml/skleton_kml.txt';
skeletonKml = getFileContent(skeletonPath);
skeletonKmlParts = regexp(skeletonKml,'#PUT_CONTENT_HERE#', 'split');
skeletonKmlHeader = char(skeletonKmlParts(1));
skeletonKmlFooter = char(skeletonKmlParts(2));

fprintf(fpKml, '%s', skeletonKmlHeader);
for i=1:length(class)
    if class(i)==-1
        continue;
    end
    label = int2str(class(i));
    kmlGeneratePoint(fpKml, G, label, ...
        gps(i,1), gps(i,2), 0, speed(i), 0, gps(i,3), gps(i,3));
end
fprintf(fpKml, '%s', skeletonKmlFooter);
