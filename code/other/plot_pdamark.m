function plot_pdamark(G,pid,sid,INDIR)
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
for l=1:length(data.pdamark.matlabtime)
    hold on;
    plot([data.pdamark.matlabtime(l),data.pdamark.matlabtime(l)],ylim,'r-','LineWidth',2);
    hold on;
    text(data.pdamark.matlabtime(l), 0  , [data.pdamark.drugname{l} ' QTY=' data.pdamark.quantity{l} ' (' data.pdamark.actualusage{l} ')' ], 'Color', 'k','FontSize',18,'Rotation',90);
end
end
