function plot_ema(G,pid,sid,INDIR,context)
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

R=findfile_pid_sid_dir(G,pid,sid,INDIR);

for i=1:size(R.ema.data,1)
    hold on;
    if str2num(char(R.ema.data(i,3)))==context
        starttimestamp=R.ema.data(i,7);
        emaStart=str2num(char(starttimestamp));
        plot([convert_timestamp_matlabtimestamp(G,emaStart),convert_timestamp_matlabtimestamp(G,emaStart)],ylim,'k-','LineWidth',2);
        hold on;
        text(convert_timestamp_matlabtimestamp(G,emaStart), 0  , 'EMA', 'Color', 'r','FontSize',18,'Rotation',90);
    end
end

end
