function createtestparam(pid,sid,WINDOW)
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
global DIR FILE

dirname=WINDOW.TESTDIR;
filename=[DIR.STUDYNAME '_' DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_' WINDOW.NAME '_'];
%datafilename=[DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_' FILE.LIBSVM_NAME];

fp=fopen([dirname DIR.SEP filename FILE.LIBSVM_PARAM],'w');

fprintf(fp,'doscale = True\n');
fprintf(fp,'dopca = False\n');
fprintf(fp,'outputlog = ''%s''\n',strrep([WINDOW.TESTDIR DIR.SEP filename FILE.LIBSVM_RESULT],'\','/'));
fprintf(fp,'choose_specific_features = False\n');
fprintf(fp,'specific_selected_features = []\n');
fprintf(fp,'testdatafilename = ''%s''\n',strrep([WINDOW.TESTDIR DIR.SEP filename FILE.LIBSVM_NAME],'\','/'));
fprintf(fp,'modelfilename = ''%s''\n',strrep(WINDOW.MODELNAME,'\','/'));
fprintf(fp,'scaledatafilename = ''%s''\n',strrep(WINDOW.SCALENAME,'\','/'));
fprintf(fp,'useprob = False\n');
fprintf(fp,'outputpredictions = True\n');
fprintf(fp,'testlabelspresent = False\n');
fprintf(fp,'predictionslog = ''%s''\n',strrep([WINDOW.TESTDIR DIR.SEP filename 'labels'],'\','/'));
fclose(fp);
