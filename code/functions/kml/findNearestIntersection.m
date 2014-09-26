function [ iId, iLat, iLong, minDistance ] = findNearestIntersection( intersectionLatLong, lat, long )
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
    iId=intersectionLatLong(1,1);
    iLat=intersectionLatLong(1,2);
    iLong=intersectionLatLong(1,3);
    minDistance=calculateHaversineDistance(lat, long, intersectionLatLong(1,2),intersectionLatLong(1,2));
    withinThresholdsIndexes=find(intersectionLatLong(:,2)>(lat-0.04) & intersectionLatLong(:,2)<(lat+0.04) & ...
        intersectionLatLong(:,3)>(long-0.04) & intersectionLatLong(:,3)<(long+0.04));
    if isempty(withinThresholdsIndexes)
        minDistance = -1;
        iId = -1;
        iLat = -1000;
        iLong = -1000;
        return;
    end
    for j=1:length(withinThresholdsIndexes)
        i=withinThresholdsIndexes(j);
        distance = calculateHaversineDistance(lat, long, intersectionLatLong(i,2),intersectionLatLong(i,3));
        if distance<minDistance
            iId=intersectionLatLong(i,1);
            iLat=intersectionLatLong(i,2);
            iLong=intersectionLatLong(i,3);
            minDistance=distance;
        end
    end
end
