function libsvm_gen_test(G,F)
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
global DIR FILE FEATURE LABEL

label=G.RUN.MODEL.LABEL;

feature=F.sensor(FEATURE.RIPID).feature(:,FEATURE.RIP.CLASSIFIER);

outdir=[DIR.TESTLIBSVM];
outfile=[DIR.STUDYNAME '_' DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_' FILE.LIBSVM_NAME];
libsvm_write([outdir DIR.SEP outfile],feature,label);
end
