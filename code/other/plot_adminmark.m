function plot_adminmark(G,pid,sid,INDIR)
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

data=findfile_pid_sid_dir(G,pid,sid,INDIR);
for l=1:length(data.adminmark.sessionname)
    hold on;
    plot([data.adminmark.matlabtime(l),data.adminmark.matlabtime(l)],ylim,'k-','LineWidth',2);
    hold on;
    text(data.adminmark.matlabtime(l), 0  , [data.adminmark.sessionname{l} ' (' num2str(data.adminmark.dose(l)) ')' ], 'Color', 'k','FontSize',18,'Rotation',90);
end
end
