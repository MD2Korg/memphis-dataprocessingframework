function main_model(G,pid,sid,INDIR,OUTDIR)
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
    
G
pid
sid
INDIR
OUTDIR
pause
fprintf('%-6s %-6s %-20s Task (',pid,sid,'main_model');
indir=[G.DIR.DATA G.DIR.SEP INDIR];
infile=[pid '_' sid '_' G.FILE.FEATURE_MATNAME];
outdir=[G.DIR.DATA G.DIR.SEP OUTDIR];
outfile=[pid '_' sid '_' G.FILE.MODEL_MATNAME];

load([indir G.DIR.SEP infile]);
if isempty(dir([outdir G.DIR.SEP outfile])) || G.RUN.MODEL.LOADDATA==0, D=R;
else load([outdir G.DIR.SEP outfile]);end

libsvm_gen_test(G,F);
createtestparam(pid,sid);
run_session(pid,sid);
end
