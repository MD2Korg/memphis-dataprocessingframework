function temp_update_frmtdata(G,INDIR,OUTDIR)
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
outdir=[G.DIR.DATA G.DIR.SEP OUTDIR];

files=dir(indir);
for i=326:length(files)
    load([indir G.DIR.SEP files(i).name]);
    disp(files(i).name);
    x=files(i).name;x=strrep(x,'frmtraw','frmtdata');
    pdamark=R.pdamark;
    clear R;
    load([outdir G.DIR.SEP x]);
    D.pdamark=pdamark;
    save([outdir G.DIR.SEP x],'D');
    clear D;
end
end
