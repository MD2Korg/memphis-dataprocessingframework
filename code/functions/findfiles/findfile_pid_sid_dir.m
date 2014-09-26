function data=findfile_pid_sid_dir(G,pid,sid,INDIR)
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

indir=[G.DIR.DATA G.DIR.SEP INDIR];
infile=[pid '_' sid '_' G.FILE.FRMTRAW_MATNAME];

if exist([indir G.DIR.SEP pid '_' sid '_' G.FILE.MODEL_MATNAME],'file')==2
    load([indir G.DIR.SEP pid '_' sid '_' G.FILE.MODEL_MATNAME]);
    data=M;
elseif exist([indir G.DIR.SEP pid '_' sid '_' G.FILE.FEATURE_MATNAME],'file')==2
    load([indir G.DIR.SEP pid '_' sid '_' G.FILE.FEATURE_MATNAME]);
    data=F;
elseif exist([indir G.DIR.SEP pid '_' sid '_' G.FILE.WINDOW_MATNAME],'file')==2
    load([indir G.DIR.SEP pid '_' sid '_' G.FILE.WINDOW_MATNAME]);
    data=W;
elseif exist([indir G.DIR.SEP pid '_' sid '_' G.FILE.BASICFEATURE_MATNAME],'file')==2
    load([indir G.DIR.SEP pid '_' sid '_' G.FILE.BASICFEATURE_MATNAME]);
    data=B;
elseif exist([indir G.DIR.SEP pid '_' sid '_' G.FILE.FRMTDATA_MATNAME],'file')==2
    load([indir G.DIR.SEP pid '_' sid '_' G.FILE.FRMTDATA_MATNAME]);
    data=D;
elseif exist([indir G.DIR.SEP pid '_' sid '_' G.FILE.FRMTRAW_MATNAME],'file')==2
        load([indir G.DIR.SEP infile]);
        data=R;
end
end
