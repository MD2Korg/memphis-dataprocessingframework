function LABEL=config_mark()
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

%% Data Labeler File name
LABEL.DATALABEL_FILENAME='ContextDataLabeling';
LABEL.DATALABEL(1).START='Smoking Start'; LABEL.DATALABEL(1).END='Smoking End';   LABEL.DATALABEL(1).LABEL='Smoking';
LABEL.DATALABEL(2).START='Puff start';    LABEL.DATALABEL(2).END='';              LABEL.DATALABEL(2).LABEL='Puff';
LABEL.DATALABEL(3).START='walkingstart'; LABEL.DATALABEL(3).END='walkingEnd';   LABEL.DATALABEL(3).LABEL='walking';
LABEL.DATALABEL(4).START='runningstart'; LABEL.DATALABEL(4).END='runningEnd';   LABEL.DATALABEL(4).LABEL='running';
LABEL.DATALABEL(5).START='standingstart'; LABEL.DATALABEL(5).END='standingend';  LABEL.DATALABEL(5).LABEL='standing';
LABEL.DATALABEL(6).START='sittingstart'; LABEL.DATALABEL(6).END='sittingend';  LABEL.DATALABEL(6).LABEL='sitting';
LABEL.DATALABEL(7).START='lyingstart'; LABEL.DATALABEL(7).END='lyingend';  LABEL.DATALABEL(7).LABEL='lying';
LABEL.DATALABEL(8).START='drivingstart'; LABEL.DATALABEL(8).END='drivingend';  LABEL.DATALABEL(8).LABEL='driving';
LABEL.DATALABEL(9).START='LongBreathOutStart'; LABEL.DATALABEL(9).END='';  LABEL.DATALABEL(9).LABEL='longbreathout';
LABEL.DATALABEL(10).START='QuickBreathStart'; LABEL.DATALABEL(10).END='';  LABEL.DATALABEL(10).LABEL='quickbreath';
LABEL.DATALABEL(11).START='briskwalkStart'; LABEL.DATALABEL(11).END='';  LABEL.DATALABEL(11).LABEL='briskwalk';
LABEL.DATALABEL(12).START='BreathOutAndHoldstart'; LABEL.DATALABEL(12).END='';  LABEL.DATALABEL(12).LABEL='breathoutandhold';
LABEL.DATALABEL(13).START='DeepLongBreathstart'; LABEL.DATALABEL(13).END='';  LABEL.DATALABEL(13).LABEL='deeplongbreath';
LABEL.DATALABEL(14).START='ArmStretching'; LABEL.DATALABEL(14).END='';  LABEL.DATALABEL(14).LABEL='ArmStretching';
LABEL.DATALABEL(15).START='LooseSensorSittingI'; LABEL.DATALABEL(15).END='';  LABEL.DATALABEL(15).LABEL='LooseSensorSittingI';
LABEL.DATALABEL(16).START='looseSensorStandingII'; LABEL.DATALABEL(16).END='';  LABEL.DATALABEL(16).LABEL='looseSensorStandingII';
LABEL.DATALABEL(17).START='beltTooLowStanding'; LABEL.DATALABEL(17).END='';  LABEL.DATALABEL(17).LABEL='beltTooLowStanding';
LABEL.DATALABEL(18).START='beltTooHighStanding'; LABEL.DATALABEL(18).END='';  LABEL.DATALABEL(18).LABEL='beltTooHighStanding';
LABEL.DATALABEL(19).START='beltTooHighSitting'; LABEL.DATALABEL(19).END='';  LABEL.DATALABEL(19).LABEL='beltTooHighSitting';

%% Label
%global LABEL
LABEL.PUFFNONPUFFIND=1;
LABEL.PUFF=1;           LABEL.NAME(LABEL.PUFFNONPUFFIND,1,1)={'puff'};LABEL.NAME(LABEL.PUFFNONPUFFIND,1,2)={1};
LABEL.NONPUFF=0;        LABEL.NAME(LABEL.PUFFNONPUFFIND,2,1)={'nonpuff'};LABEL.NAME(LABEL.PUFFNONPUFFIND,2,2)={0};
LABEL.UNKNOWN=-1;       LABEL.NAME(LABEL.PUFFNONPUFFIND,3,1)={'unknown'};LABEL.NAME(LABEL.PUFFNONPUFFIND,3,2)={-1};

LABEL.ACTIVITYIND=2;
LABEL.WALKING=1;        LABEL.NAME(LABEL.ACTIVITYIND,1,1)={'walking'};LABEL.NAME(LABEL.ACTIVITYIND,1,2)={1};
LABEL.RUNNING=2;        LABEL.NAME(LABEL.ACTIVITYIND,2,1)={'running'};LABEL.NAME(LABEL.ACTIVITYIND,2,2)={2};
LABEL.SITTING=3;        LABEL.NAME(LABEL.ACTIVITYIND,3,1)={'sitting'};LABEL.NAME(LABEL.ACTIVITYIND,3,2)={3};
LABEL.STANDING=4;       LABEL.NAME(LABEL.ACTIVITYIND,4,1)={'standing'};LABEL.NAME(LABEL.ACTIVITYIND,4,2)={4};
LABEL.LYING=5;          LABEL.NAME(LABEL.ACTIVITYIND,5,1)={'lying'};LABEL.NAME(LABEL.ACTIVITYIND,5,2)={5};
LABEL.DRIVING=6;        LABEL.NAME(LABEL.ACTIVITYIND,6,1)={'driving'};LABEL.NAME(LABEL.ACTIVITYIND,6,2)={6};

LABEL.YOGAIND=3;
LABEL.LONGBREATHOUT=1;        LABEL.NAME(LABEL.YOGAIND,1,1)={'longbreathout'};LABEL.NAME(LABEL.YOGAIND,1,2)={1};
LABEL.QUICKBREATH=2;        LABEL.NAME(LABEL.YOGAIND,2,1)={'quickbreath'};LABEL.NAME(LABEL.YOGAIND,2,2)={2};
LABEL.BRISKWALK=3;        LABEL.NAME(LABEL.YOGAIND,3,1)={'briskwalk'};LABEL.NAME(LABEL.YOGAIND,3,2)={3};
LABEL.BREATHOUTANDHOLD=4;       LABEL.NAME(LABEL.YOGAIND,4,1)={'breathoutandhold'};LABEL.NAME(LABEL.YOGAIND,4,2)={4};
LABEL.DEEPLONGBREATH=5;          LABEL.NAME(LABEL.YOGAIND,5,1)={'deeplongbreath'};LABEL.NAME(LABEL.YOGAIND,5,2)={5};

LABEL.QUALITYIND=3;
LABEL.ARMSTRETCHING=1;        LABEL.NAME(LABEL.QUALITYIND,1,1)={'armstretching'};LABEL.NAME(LABEL.QUALITYIND,1,2)={1};
LABEL.LOOSESENSORSITTINGI=2;        LABEL.NAME(LABEL.QUALITYIND,2,1)={'loosesensorsittingI'};LABEL.NAME(LABEL.QUALITYIND,2,2)={2};
LABEL.LOOSESENSORSTANDINGII=3;        LABEL.NAME(LABEL.QUALITYIND,3,1)={'loosesensorstandingII'};LABEL.NAME(LABEL.QUALITYIND,3,2)={3};
LABEL.BELTTOOLOWSTANDING=4;        LABEL.NAME(LABEL.QUALITYIND,4,1)={'beltTooLowStanding'};LABEL.NAME(LABEL.QUALITYIND,4,2)={4};
LABEL.BELTTOOHIGHSTANDING=5;        LABEL.NAME(LABEL.QUALITYIND,5,1)={'belttoohighstanding'};LABEL.NAME(LABEL.QUALITYIND,5,2)={5};
LABEL.BELTTOOHIGHSITTING=6;        LABEL.NAME(LABEL.QUALITYIND,6,1)={'belttoohighsitting'};LABEL.NAME(LABEL.QUALITYIND,6,2)={6};

LABEL.LABELTYPECOUNT=3; %total no of label types. if it is activity and smoking, then the value is 2. If anyone add more type of labels, it should be increased accordingly
