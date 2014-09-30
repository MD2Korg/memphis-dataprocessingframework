function smoking_lab_data_generate_plot(participant, starttimestr, endtimestr)
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
G=config_run_SmokingLab(G);

pid = ['p' num2str(participant,'%02d')];
sid = 's01';

G.RUN.FRMTRAW.CRESS=1;

G.RUN.FRMTRAW.SENSORLIST_TOS=[ ...
    G.SENSOR.R_RIPID,...
    G.SENSOR.WR9_ACLYID, ...
    G.SENSOR.WR9_GYRZID, ...
    G.SENSOR.WL9_ACLYID, ...
    G.SENSOR.WL9_GYRZID ...
    ];

smoking_lab_formattedraw(G,pid,sid,'raw','formattedraw_lab', starttimestr, endtimestr);

sensorPlotList=G.RUN.FRMTRAW.SENSORLIST_TOS;
iplot4(G, participant, 1, 'formattedraw_lab', sensorPlotList, 1, (0)/(60*60*24));

end
