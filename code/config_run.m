function G=config_run(G)
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

G.STUDYNAME='memphis';  % Name of the directory where raw data is stored. Example: "DataProcessingFramework/data/memphis"
G.TIME.TIMEZONE=-6;     % Timezone of the data. (Ex: -6=CST, -4=PST)
G.TIME.DAYLIGHTSAVING=1; % 1=Daylight saving is used if it is required. 0=Don't consider anything about daylight saving.
G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';    % Format of Date & Time

G.DIR.DATA=[G.DIR.ROOT G.DIR.SEP 'data' G.DIR.SEP G.STUDYNAME]; % Set the location of "data" directory

%%
% for participant 1, raw files will be in the directory "DataProcessingFramework/data/memphis/raw/p01"
% to find the session name and number of session, main_session_definition.m file is required to
% run. it will produce a file named: "session_def.csv" in "raw/p01" directory. The
% number of sessions is written in that file.

G.PS_LIST= {
    {'p01'},{'s01','s02','s03'};  % participant id followed by list of session id.
%    {'p02'},{'s01','s02','s03','s04'};
};
%% Formatted Raw
%list of sensors to read from "TOS..." files:
G.RUN.FRMTRAW.SENSORLIST_TOS=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,...
    G.SENSOR.R_ACLXID, G.SENSOR.R_ACLYID, G.SENSOR.R_ACLZID...
    G.SENSOR.A_ALCID,G.SENSOR.R_BAT_SKN_AMB_ID,G.SENSOR.A_GSRID,G.SENSOR.A_TEMPID];

% list of phone sensors, saved in the database, that are required to load
G.RUN.FRMTRAW.SENSORLIST_DB=[G.SENSOR.P_ACLXID, G.SENSOR.P_ACLYID, G.SENSOR.P_ACLZID];
% list of self reports, saved in the database, that are required to load
G.RUN.FRMTRAW.SELFREPORTLIST=[G.SELFREPORT.DRNKID,G.SELFREPORT.SMKID,G.SELFREPORT.CRVID];
% GPS sensor list, that will load from "LOCATION_..." file
G.RUN.FRMTRAW.SENSORLIST_GPS=[G.SENSOR.P_GPS_LATID, G.SENSOR.P_GPS_LONGID, ...
    G.SENSOR.P_GPS_ALTID, G.SENSOR.P_GPS_SPDID, G.SENSOR.P_GPS_BEAR, G.SENSOR.P_GPS_ACCURACYID];
                
G.RUN.FRMTRAW.LOADDATA=0;    % previous formattedraw data: load=1, createnew=0
G.RUN.FRMTRAW.TOS=1;         % sensor data from text file: read=1, ignore=0
G.RUN.FRMTRAW.PHONESENSOR=0; % phone sensor data: read=1, ignore=0
G.RUN.FRMTRAW.GPS=0;         % phone GPS data: read=1, ignore=0
G.RUN.FRMTRAW.SELFREPORT=0;  % selfreport: read=1, ignore=0
G.RUN.FRMTRAW.LABSTUDYMARK=0;% lab study mark: read=1, ignore=0
G.RUN.FRMTRAW.LABSTUDYLOG=0; % lab study log: read=1, ignore=0
G.RUN.FRMTRAW.EMA=0;         % EMA: read=1, ignore=0

%% Formatted Data
% list of sensors for which timestamp will be corrected
G.RUN.FRMTDATA.SENSORLIST_CORRECTTIMESTAMP=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,...
    G.SENSOR.R_ACLXID, G.SENSOR.R_ACLYID, G.SENSOR.R_ACLZID...
    G.SENSOR.A_ALCID,G.SENSOR.R_BAT_SKN_AMB_ID,G.SENSOR.A_GSRID,G.SENSOR.A_TEMPID];

% list of sensors for which interpolation will be done
G.RUN.FRMTDATA.SENSORLIST_INTERPOLATE=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,...
    G.SENSOR.R_ACLXID, G.SENSOR.R_ACLYID, G.SENSOR.R_ACLZID...
    G.SENSOR.A_ALCID,G.SENSOR.R_BAT_SKN_AMB_ID,G.SENSOR.A_GSRID,G.SENSOR.A_TEMPID];

% list of sensors for which quality will be measured.
G.RUN.FRMTDATA.SENSORLIST_QUALITY=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID];

G.RUN.FRMTDATA.LOADDATA=0; % previous formatteddata data: load=1, createnew=0
G.RUN.FRMTDATA.EMA=0;       % EMA: format=1, same as formattedraw=0
G.RUN.FRMTDATA.CORRECTTIMESTAMP=1; % timestamp correction: correct=1, ignore=0
G.RUN.FRMTDATA.INTERPOLATE=1; % interpolate: perform=1, ignore=0
G.RUN.FRMTDATA.QUALITY=1; % measure quality: measure=1, ignore=0

G.RUN.BASICFEATURE.LOADDATA=0; % previous basicfeature data: load=1, createnew=0
G.RUN.BASICFEATURE.PEAKVALLEY=1; % peakvalley for RIP: calculate=1, not required=0
G.RUN.BASICFEATURE.RR=1;    % RR for ECG: calculate=1, not required=0

G.RUN.WINDOW.LOADDATA=0; % previous window data: load=1, createnew=0

G.RUN.FEATURE.LOADDATA=0; % previous feature data: load=1, createnew=0

% List of features to calculate
G.RUN.FEATURE.FEATURELIST={
    {G.FEATURE.R_ECGID},{G.FEATURE.R_ECG.VRVL,G.FEATURE.R_ECG.LFHF,...
                G.FEATURE.R_ECG.HRP1,G.FEATURE.R_ECG.HRP2,...
                G.FEATURE.R_ECG.HRP3,G.FEATURE.R_ECG.RRMN,...
                G.FEATURE.R_ECG.RRMD,G.FEATURE.R_ECG.RRQD,...
                G.FEATURE.R_ECG.RR80,G.FEATURE.R_ECG.RR20,...
                G.FEATURE.R_ECG.RRCT};

{G.FEATURE.R_RIPID},{G.FEATURE.R_RIP.BREATHRATE,G.FEATURE.R_RIP.MINUTEVENT...
                ,G.FEATURE.R_RIP.INSPDURQUARTDEV,G.FEATURE.R_RIP.INSPDURMEAN...
                ,G.FEATURE.R_RIP.INSPDURMEDIAN,G.FEATURE.R_RIP.INSPDUR80PERCENT...
                ,G.FEATURE.R_RIP.EXPRDURQUARTDEV,G.FEATURE.R_RIP.EXPRDURMEAN...
                ,G.FEATURE.R_RIP.EXPRDURMEDIAN,G.FEATURE.R_RIP.EXPRDUR80PERCENT...
                ,G.FEATURE.R_RIP.RESPDURQUARTDEV,G.FEATURE.R_RIP.RESPDURMEAN...
                ,G.FEATURE.R_RIP.RESPDURMEDIAN,G.FEATURE.R_RIP.RESPDUR80PERCENT...
                ,G.FEATURE.R_RIP.IERATIOQUARTDEV,G.FEATURE.R_RIP.IERATIOMEAN...
                ,G.FEATURE.R_RIP.IERATIOMEDIAN,G.FEATURE.R_RIP.IERATIO80PERCENT...
                ,G.FEATURE.R_RIP.STRETCHQUARTDEV,G.FEATURE.R_RIP.STRETCHMEAN...
                ,G.FEATURE.R_RIP.STRETCHMEDIAN,G.FEATURE.R_RIP.STRETCH80PERCENT}
};

% set model (stress/drug/conversation/activity) related information.
% there may be several models defined in "config_model.m" file.
% Select the model that is required to run here.
% several information are saved in model (Ex: window size, featurelist to
% run model, whether normalization are required, etc..)
G.RUN.MODEL=G.MODEL.STRESS60;

% list of features to save in .csv file as report.
G.RUN.REPORT.FEATURELIST={
    {G.FEATURE.R_ECGID},{G.FEATURE.R_ECG.VRVL,G.FEATURE.R_ECG.LFHF,...
                G.FEATURE.R_ECG.HRP1,G.FEATURE.R_ECG.HRP2,...
                G.FEATURE.R_ECG.HRP3,G.FEATURE.R_ECG.RRMN,...
                G.FEATURE.R_ECG.RRMD,G.FEATURE.R_ECG.RRQD,...
                G.FEATURE.R_ECG.RR80,G.FEATURE.R_ECG.RR20,...
                G.FEATURE.R_ECG.RRCT};

{G.FEATURE.R_RIPID},{G.FEATURE.R_RIP.BREATHRATE,G.FEATURE.R_RIP.MINUTEVENT...
                ,G.FEATURE.R_RIP.INSPDURQUARTDEV,G.FEATURE.R_RIP.INSPDURMEAN...
                ,G.FEATURE.R_RIP.INSPDURMEDIAN,G.FEATURE.R_RIP.INSPDUR80PERCENT...
                ,G.FEATURE.R_RIP.EXPRDURQUARTDEV,G.FEATURE.R_RIP.EXPRDURMEAN...
                ,G.FEATURE.R_RIP.EXPRDURMEDIAN,G.FEATURE.R_RIP.EXPRDUR80PERCENT...
                ,G.FEATURE.R_RIP.RESPDURQUARTDEV,G.FEATURE.R_RIP.RESPDURMEAN...
                ,G.FEATURE.R_RIP.RESPDURMEDIAN,G.FEATURE.R_RIP.RESPDUR80PERCENT...
                ,G.FEATURE.R_RIP.IERATIOQUARTDEV,G.FEATURE.R_RIP.IERATIOMEAN...
                ,G.FEATURE.R_RIP.IERATIOMEDIAN,G.FEATURE.R_RIP.IERATIO80PERCENT...
                ,G.FEATURE.R_RIP.STRETCHQUARTDEV,G.FEATURE.R_RIP.STRETCHMEAN...
                ,G.FEATURE.R_RIP.STRETCHMEDIAN,G.FEATURE.R_RIP.STRETCH80PERCENT}
};

end
