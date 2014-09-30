function G=config()
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

%% Configure java Paths
allpath=javaclasspath('-dynamic');
c=size(allpath,2);
for i=1:c
    javarmpath(allpath{i});
end
javaaddpath ('functions/ExtractDatabase');  % code for extracting database
javaaddpath ('functions/ExtractDatabase/sqlitejdbc-v056.jar'); % extract database
javaaddpath ('functions/java'); % all java files are in this folder

%% Configure all paths
addpath(genpath('.')); % include all directory in matlab path.

%% Number of samples per packet in a TOS file
G.SAMPLE_TOS=5;
%% Data Quality
G.QUALITY.GOOD = 0;G.QUALITY.MISSING = 1;G.QUALITY.NOISE = 2;G.QUALITY.BAND_LOOSE = 3;G.QUALITY.BAND_OFF = 4;
G.QUALITY.BAD = 2;

%% Set Root Directory
G.DIR.ROOT=fileparts(pwd);
G.DIR.SEP=filesep;

%% Configuration
G.FILE=config_filename(); % Set filename
G.SENSOR=config_sensor(); % Set Sensor configuration
G.SELFREPORT=config_selfreport(); % Set Self report information
G.LABSTUDY=config_labstudy(); % set table name of lab study
G.FEATURE=config_feature(); %  set list of features
G.MODEL=config_model(G); % set window size and others for specific model
