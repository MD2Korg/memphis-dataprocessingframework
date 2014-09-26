function [ angleDeg ] = calculateAngle( p1,p2,p3,p4 )
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

    x1 = p1(1);
    x2 = p2(1);
    x3 = p3(1);
    x4 = p4(1);

    y1 = p1(2);
    y2 = p2(2);
    y3 = p3(2);
    y4 = p4(2);

	%angleDeg = mod( atan2( (x2-x1)*(y4-y3)-(y2-y1)*(x4-x3) , ...
    %               (x2-x1)*(x4-x3)+(y2-y1)*(y4-y3) ) , 2*pi);
    angleRad = atan2( (x2-x1)*(y4-y3)-(y2-y1)*(x4-x3) , ...
        (x2-x1)*(x4-x3)+(y2-y1)*(y4-y3) );
    angleDeg = angleRad*180/pi; %radtodeg(angleRad);
end
