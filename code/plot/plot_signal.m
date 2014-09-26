function h=plot_signal(timestamp,sample,linetype,linewidth,offset,scale,markercolor)
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
if ~exist('offset','var'), offset=0;end
if ~exist('scale','var'), scale=1;end
if ~exist('markercolor','var')
    h=plot(timestamp,offset+scale*sample,linetype,'LineWidth',linewidth);
else
    h=plot(timestamp,offset+scale*sample,linetype,'LineWidth',linewidth,'MarkerFaceColor',markercolor);

end
dynamicDateTicks
end
