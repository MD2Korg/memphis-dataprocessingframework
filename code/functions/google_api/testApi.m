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

clear;
%a=getPlaceTypeId('car_repair');
%a=getPlaceTypeStr(0);


%{
lat = 35.111989;
lon = -89.946395;
radius = 2000;
typeArr = [70 71 96];
%}
lat = 35.143485;
lon = -90.188869;
radius = 50;
typeArr = 1:96;
poi=getPointMetaPlacesApi(lat, lon, radius, typeArr);
%disp(poi);

for i=1:length(poi.lats)
    typeStrArr = poi.typeStrArr{i};
    fprintf('%s,%s,%.10f,%.10f',char(poi.names{i}), char(poi.vicinities{i}), poi.lats{i}, poi.lons{i});
    for j=1:length(typeStrArr)
        fprintf(',%s',typeStrArr{j});
    end
    fprintf('\n');
end
