function main_curve(G,pid, sid,FRMTDIR,BDIR, WDIR,FDIR,OUTDIR,MODEL)
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
C=[];

load([G.DIR.DATA G.DIR.SEP FRMTDIR G.DIR.SEP pid '_' sid '_' G.FILE.FRMTDATA_MATNAME]);
load([G.DIR.DATA G.DIR.SEP BDIR G.DIR.SEP pid '_' sid '_' G.FILE.BASICFEATURE_MATNAME]);
load([G.DIR.DATA G.DIR.SEP WDIR G.DIR.SEP MODEL.STUDYTYPE '_' pid '_' sid '_' MODEL.NAME '_' G.FILE.WINDOW_MATNAME]);
load([G.DIR.DATA G.DIR.SEP FDIR G.DIR.SEP MODEL.STUDYTYPE '_' pid '_' sid '_' MODEL.NAME '_' G.FILE.FEATURE_MATNAME]);


C=find_quantile(G,W,C);
C=curve_smooth(C);
C=curve_slope(C);
C=curve_base(C,D);
C=curve_peak_valley(C,D,F);
C=curve_feature(C,D);

load([G.DIR.DATA G.DIR.SEP FRMTDIR G.DIR.SEP pid '_' sid '_' G.FILE.FRMTDATA_MATNAME]);

outdir=[G.DIR.DATA G.DIR.SEP 'curve'];
if isempty(dir(outdir))
    mkdir(outdir);
end
save([G.DIR.DATA G.DIR.SEP 'curve' G.DIR.SEP MODEL.STUDYTYPE '_' pid '_' sid '_' MODEL.NAME '_smooth.mat'],'C');
%plot_curve(pid,sid,MODEL);
%C=curve_feature(C,D);
%save([DIR.REPORT DIR.SEP DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_smooth.mat'],'C');
end
