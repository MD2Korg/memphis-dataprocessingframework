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
%% Data Processing Framework
% Run this program to generate "session_def.csv" file which is used to find
% the number of sessions for participants. This program reads "participant id"
% which is defined in "config_run.m" file. For example, if the
% STUDYNAME="memphis" and "G.PS_LIST" contains "p01", then, this program
% reads files from "DataProcessingFramework/data/memphis/raw/p01" directory
% which contains sensor data of participant 1 and creates files named
% "session_def.csv" which contains the number of session for that
% participant. By default, each day represents as a session. So, if the
% participant directory contains 2 days of data, there will be two session
% named "s01", "s02".
% To calculate the features for these two sessions, "G.PS_LIST" needs to be
% changed as:
% G.PS_LIST={{'p01'},{'s01','s02'}};

clear all
%% Basic Configureation files
%
G=config();
G=config_run_nida(G);

PS_LIST=G.PS_LIST;
pno=size(PS_LIST);

for p=1:pno
	pid=char(PS_LIST{p,1});
    main_rawinfo(G,pid,'raw');
end
