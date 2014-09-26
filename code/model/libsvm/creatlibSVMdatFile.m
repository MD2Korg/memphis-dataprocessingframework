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

%%%%%%%%%%%%%%%%set in directory%%%%%%%%%%%%%
infile = [ DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_' FILE.FEATURE_MATNAME];
load ([DIR.FEATURE DIR.SEP infile]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%merge label and features%%%%%%%
filelist=findfiles(DIR.FEATURE,'feature'); %read feature files
filelist=finduniquefiles(filelist);
noFile=size(filelist,2);
all_features=[];
label=[];
for i=1:noFile
    fileInfo = dir(filelist{i});
    if fileInfo.bytes==0 || length(regexpi(fileInfo.name,'feature'))==0
        continue;
    end
    load(char(filelist(i)));
    %featureWithLabel=[F.output(:,LABEL.ACTIVITYIND) F.sensor(LABEL.ACTIVITYIND).feature(:,:)];
    all_features=[all_features;F.sensor(LABEL.ACTIVITYIND).feature(:,:)];
    label=[label;F.output(:,LABEL.ACTIVITYIND)];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%set out directory%%%%%%%%%%%%
outdir=[DIR.CLASSIFIERDATA];

if isempty(dir(outdir))
    mkdir(outdir);
end
outfile=[DIR.STUDYNAME '_' DIR.SESSIONTYPE_NAME(1) '_' pid '_' sid '_' FILE.LIBSVM_NAME];
write_libsvm_multiclass([outdir DIR.SEP outfile],all_features,label);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
