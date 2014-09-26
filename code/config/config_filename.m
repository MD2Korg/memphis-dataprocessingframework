function FILE=config_filename()
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

FILE.DBNAME='StressInferencePhone.db';
FILE.TOS_NAME='TOS';
FILE.LOCATION_NAME='LOCATION_LOG';
FILE.REPORT_TOS='report_tos.csv';
FILE.SESSION_DEF='session_def.txt'; %'session_def.csv';
FILE.REPORT_LABSTUDY='report_labstudy.csv';
FILE.FRMTRAW_MATNAME='frmtraw.mat';
FILE.FRMTDATA_MATNAME='frmtdata.mat';
FILE.BASICFEATURE_MATNAME='basicfeature.mat';
FILE.WINDOW_MATNAME='window.mat';
FILE.FEATURE_MATNAME='feature.mat';
FILE.MODEL_MATNAME='model.mat';

FILE.TEST_INPUTNAME='test.in';
FILE.CRESS_FILE_NAME='cress.txt';
end
