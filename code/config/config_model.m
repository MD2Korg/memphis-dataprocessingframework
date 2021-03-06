function MODEL=config_model(G)
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

MODEL.STRESS60.STUDYTYPE='field';  % working with field data
MODEL.STRESS60.NAME='stress60';  % model name

% list of sensors used in this model
MODEL.STRESS60.SENSORLIST=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
MODEL.STRESS60.WINDOWTYPE='time'; % window is based on time. other option: "cycle" (by peakvalley),"variable"
MODEL.STRESS60.WINDOW_LEN=1*60*1000; %length of the window: 1 minute
MODEL.STRESS60.MISSINGRATE=0.33; % work on window if the missing rate is <33%

MODEL.STRESS60.NORMALIZE.SENSOR.WINSORIZE=[G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
MODEL.STRESS60.NORMALIZE.SENSOR.WINSORIZE_WINLEN=[inf,inf,inf];

MODEL.STRESS30.STUDYTYPE='field';  % working with field data
MODEL.STRESS30.NAME='stress30';  % model name

% list of sensors used in this model
MODEL.STRESS30.SENSORLIST=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
MODEL.STRESS30.WINDOWTYPE='time'; % window is based on time. other option: "cycle" (by peakvalley),"variable"
MODEL.STRESS30.WINDOW_LEN=1*30*1000; %length of the window: 1 minute
MODEL.STRESS30.MISSINGRATE=0.33; % work on window if the missing rate is <33%

%MODEL.STRESS30.NORMALIZE.SENSOR.WINSORIZE=[G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
%MODEL.STRESS30.NORMALIZE.SENSOR.WINSORIZE_WINLEN=[inf,inf,inf];

%% Drug
MODEL.DRUG60.STUDYTYPE='field';  % working with field data
MODEL.DRUG60.NAME='drug60';  % model name
% list of sensors used in this model
MODEL.DRUG60.SENSORLIST=[G.SENSOR.R_ECGID,G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
MODEL.DRUG60.WINDOWTYPE='time'; % window is based on time. other option: "cycle" (by peakvalley),"variable"
MODEL.DRUG60.WINDOW_LEN=1*60*1000; %length of the window: 1 minute
MODEL.DRUG60.MISSINGRATE=0.33; % work on window if the missing rate is <33%
%MODEL.DRUG60.NORMALIZE.SENSOR.WINSORIZE=[G.SENSOR.R_ACLXID,inf;G.SENSOR.R_ACLYID,inf;G.SENSOR.R_ACLZID,inf];
%MODEL.DRUG60.NORMALIZE.RR=1*60*60*1000; % 1 hour

MODEL.DRUG10.STUDYTYPE='field';  % working with field data
MODEL.DRUG10.NAME='drug10';  % model name
% list of sensors used in this model
MODEL.DRUG10.SENSORLIST=[G.SENSOR.R_ECGID,G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
MODEL.DRUG10.WINDOWTYPE='time'; % window is based on time. other option: "cycle" (by peakvalley),"variable"
MODEL.DRUG10.WINDOW_LEN=10*1000; %length of the window: 1 minute
MODEL.DRUG10.MISSINGRATE=0.33; % work on window if the missing rate is <33%
%MODEL.DRUG60.NORMALIZE.SENSOR.WINSORIZE=[G.SENSOR.R_ACLXID,inf;G.SENSOR.R_ACLYID,inf;G.SENSOR.R_ACLZID,inf];
%MODEL.DRUG60.NORMALIZE.RR=1*60*60*1000; % 1 hour

%% Activity
MODEL.ACT10.STUDYTYPE='field';  % working with field data
%MODEL.ACT10.STUDYTYPE='pilot';
MODEL.ACT10.NAME='act10';  % model name
% list of sensors used in this model
MODEL.ACT10.SENSORLIST=[G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
MODEL.ACT10.WINDOWTYPE='time'; % window is based on time. other option: "cycle" (by peakvalley),"variable"
MODEL.ACT10.WINDOW_LEN=10*1000; %length of the window: 10 second
MODEL.ACT10.MISSINGRATE=0.33; % work on window if the missing rate is <33%
%MODEL.ACT10.NORMALIZE.SENSOR.WINSORIZE=[G.SENSOR.R_ACLXID,inf;G.SENSOR.R_ACLYID,inf;G.SENSOR.R_ACLZID,inf];
%MODEL.ACT10.NORMALIZE.RR=1*60*60*1000; % 1 hour

%%Human Identification
MODEL.AUTH10.STUDYTYPE='field';  % working with field data
MODEL.AUTH10.NAME='AUTH10';  % model name for authentication
% list of sensors used in this model
MODEL.AUTH10.SENSORLIST=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID];%, G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
MODEL.AUTH10.WINDOWTYPE='time'; % window is based on time. other option: "cycle" (by peakvalley),"variable"
MODEL.AUTH10.WINDOW_LEN=10*1000; %length of the window: 10 seconds
MODEL.AUTH10.MISSINGRATE=0.33; % work on window if the missing rate is <33%
end
