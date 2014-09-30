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
clear all;
clear all
%% Basic Configureation files
%

G=config();
G=config_run_MinnesotaLab(G);

PS_LIST = G.PS_LIST;

pno=size(PS_LIST);
for p=1:pno
	pid=char(PS_LIST{p,1});
%	main_rawinfo(G,pid,'raw');
	slist=PS_LIST{p,2};
    for s=slist
		sid=char(s);
%        figure;plot_frmtraw(G,pid,sid,'formattedraw',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,G.SENSOR.R_AMBID]);
%        plot_selfreport(G,pid,sid,'formattedraw',[1,2]);
%        plot_labstudymark(G,pid,sid,'formattedraw');
%        disp('abc');
       	main_formattedraw(G,pid,sid,'raw','formattedraw');
%        main_formatteddata(G,pid,sid,'formattedraw','formatteddata');
%        figure;plot_frmtdata(G,pid,sid,'formatteddata',[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID]);

%       main_basicfeature(G,pid,sid,'formatteddata','basicfeature');
%          main_window(G,pid,sid,'basicfeature','window',G.MODEL.ACT10);
%        main_feature(G,pid,sid,'window','feature',G.MODEL.ACT10);

	end;
end;

slist=[ ...
G.SENSOR.R_RIPID,...
G.SENSOR.R_ECGID,...
G.SENSOR.R_ACLXID, ...
G.SENSOR.R_ACLYID, ...
G.SENSOR.R_ACLZID, ...
G.SENSOR.WR9_ACLXID, ...
G.SENSOR.WR9_ACLYID, ...
G.SENSOR.WR9_ACLZID, ...
G.SENSOR.WR9_GYRXID, ...
G.SENSOR.WR9_GYRYID, ...
G.SENSOR.WR9_GYRZID, ...
G.SENSOR.WL9_ACLXID, ...
G.SENSOR.WL9_ACLYID, ...
G.SENSOR.WL9_ACLZID, ...
G.SENSOR.WL9_GYRXID, ...
G.SENSOR.WL9_GYRYID, ...
G.SENSOR.WL9_GYRZID ...
];

%iplot4_minnesota(G, 2, 3, slist);
%report_generate_kml_minnesota(G, 'formatteddata', 'kml', 2, [3]);
