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
% Overview: starting point of the framework.
clear all
%% Basic Configureation files
%
G=config();
G=config_run_jhu(G);
PS_LIST=G.PS_LIST;
%report_selfreport_all(G,'formattedraw','report',PS_LIST,G.SELFREPORT.SMKID);
%report_formattedraw_short(G,'formattedraw','report',PS_LIST);
%load_jhu_pda_labreport(G,'formattedraw');
%temp_update_frmtdata_labmark(G,'formattedraw','formatteddata');
%return;
pno=size(PS_LIST);
for p=1:pno
	pid=char(PS_LIST{p,1});
	slist=PS_LIST{p,2};
	for s=slist
		sid=char(s);
%        figure;plot_frmtraw(G,pid,sid,'formattedraw',[G.SENSOR.R_GSRID,G.SENSOR.R_AMBID]);
%        plot_selfreport(G,pid,sid,'formattedraw',[1,2]);
%        plot_labstudymark(G,pid,sid,'formattedraw');
%        disp('abc');
%      	main_formattedraw(G,pid,sid,'raw','formattedraw');
%        main_formatteddata(G,pid,sid,'formattedraw','formatteddata');
%        figure;plot_frmtdata(G,pid,sid,'formatteddata',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID]);

%		main_basicfeature(G,pid,sid,'formatteddata','basicfeature');
        figure;plot_basicfeature(G,pid,sid,'basicfeature',[G.SENSOR.R_ECGID, G.SENSOR.R_ACLXID, G.SENSOR.R_ACLYID]);
        hold on;
        plot_adminmark(G,pid,sid,'formattedraw');
        plot_labstudymark(G,pid,sid,'formattedraw');
        disp('ab');
%        figure;plot_basicfeature(G,pid,sid,'basicfeature',[G.SENSOR.R_ECGID,G.SENSOR.R_GSRID, G.SENSOR.R_ACLXID, G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID]);
%        hold on;plot_labstudymark(G,pid,sid,'basicfeature');
%        hold on; plot_adminmark(G,pid,sid,'basicfeature');
%        disp('done');

%        main_window(G,pid,sid,'basicfeature','window');
%        main_feature(G,pid,sid,'window','feature');
%        main_model(G,pid,sid,'feature','model');
%}
	end;
end
