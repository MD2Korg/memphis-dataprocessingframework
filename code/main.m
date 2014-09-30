
%% Data Processing Framework
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

% File Name: main.m
% Overview: Starting point of data processing
% Task: 
% 1. Load configuration value in G.
% 2. Convert raw data to features.         
clear all

G=config(); %Load basic configureation information (Ex. sensor info, db location, filename)
G=config_run(G); % Load information that we want to run.

PS_LIST=G.PS_LIST;

pno=size(PS_LIST);
for p=1:pno
	pid=char(PS_LIST{p,1});
	slist=PS_LIST{p,2};
	for s=slist
		sid=char(s);
        
      	main_formattedraw(G,pid,sid,'raw','formattedraw'); % read raw data and save it in mat file.        
        figure;plot_frmtraw(G,pid,sid,'formattedraw',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID]); % plor raw sensor data

        main_formatteddata(G,pid,sid,'formattedraw','formatteddata'); % correct timestamp, interpolate and measure quality
        figure;plot_frmtdata(G,pid,sid,'formatteddata',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID]); % plot raw sensor data with quality measurement   

		main_basicfeature(G,pid,sid,'formatteddata','basicfeature'); % calculate peak valley and RR Interval
        figure;plot_basicfeature(G,pid,sid,'basicfeature',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID]); % plot signal, peak valley and RR interval

        main_window(G,pid,sid,'basicfeature','window',G.RUN.MODEL); % divide the data into window (window is defined in MODEL in "config_model.m" file
        main_feature(G,pid,sid,'window','feature',G.RUN.MODEL);  % calculate features for each window

        report_feature(G,pid,sid,'feature','report',[G.FEATURE.R_RIPID,G.FEATURE.R_ECGID]); % save feature values as csv file (location: data/report/*.csv)
	end;
end
