function plot_selfreport(G,pid,sid,INDIR,list_selfreport)
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
for s=list_selfreport
    hold on;
    for i=1:length(data.selfreport{s}.matlabtime)
        hold on;
        plot([data.selfreport{s}.matlabtime(i),data.selfreport{s}.matlabtime(i)],ylim,'r-','LineWidth',2);
        hold on;
        text(data.selfreport{s}.matlabtime(i), 0  , [data.selfreport{s}.NAME ' : ' int2str(i)], 'Color', 'k','FontSize',18,'Rotation',90);
    end
end
end
