%% Autosense Sensor Configuaration %%
function SENSOR=config_sensor()
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

SENSOR.R_RIPID = 1;        SENSOR.R_ACLXID=4;         SENSOR.R_BAT_SKN_AMB_ID=10;
SENSOR.R_ECGID = 2;        SENSOR.R_ACLYID=5;         SENSOR.R_SKINID=20;
SENSOR.R_GSRID = 3;        SENSOR.R_ACLZID=6;         SENSOR.R_AMBID=21; SENSOR.R_BATID=22;

SENSOR.A_ALCID=7;SENSOR.A_GSRID=8; SENSOR.A_TEMPID=9;

SENSOR.P_ACLXID=11;SENSOR.P_ACLYID=12;SENSOR.P_ACLZID=13;
SENSOR.P_GPS_LATID=14;SENSOR.P_GPS_LONGID=15;SENSOR.P_GPS_ALTID=16;
SENSOR.P_GPS_SPDID=17;SENSOR.P_GPS_BEAR=18;SENSOR.P_GPS_ACCURACYID=19;

SENSOR.WL_ACLXID=20;SENSOR.WL_ACLYID=21;SENSOR.WL_ACLZID=22;
SENSOR.WR_ACLXID=23;SENSOR.WR_ACLYID=24;SENSOR.WR_ACLZID=25;

%{
SENSOR.WL_ACLX_REAL_ID=26;SENSOR.WL_ACLY_REAL_ID=27;SENSOR.WL_ACLZ_REAL_ID=28;
SENSOR.WL_ACLX_LINEAR_ID=29;SENSOR.WL_ACLY_LINEAR_ID=30;SENSOR.WL_ACLZ_LINEAR_ID=31;
SENSOR.WL_ACLX_GRAVITY_ID=32;SENSOR.WL_ACLY_GRAVITY_ID=33;SENSOR.WL_ACLZ_GRAVITY_ID=34;

SENSOR.WR_ACLX_REAL_ID=35;SENSOR.WR_ACLY_REAL_ID=36;SENSOR.WR_ACLZ_REAL_ID=37;
SENSOR.WR_ACLX_LINEAR_ID=38;SENSOR.WR_ACLY_LINEAR_ID=39;SENSOR.WR_ACLZ_LINEAR_ID=40;
SENSOR.WR_ACLX_GRAVITY_ID=41;SENSOR.WR_ACLY_GRAVITY_ID=42;SENSOR.WR_ACLZ_GRAVITY_ID=43;
%}

SENSOR.WL9_ACLXID=26; SENSOR.WL9_ACLYID=27; SENSOR.WL9_ACLZID=28;
SENSOR.WL9_GYRXID=29; SENSOR.WL9_GYRYID=30; SENSOR.WL9_GYRZID=31;
SENSOR.WL9_NULLID=32;
SENSOR.WR9_ACLXID=33; SENSOR.WR9_ACLYID=34; SENSOR.WR9_ACLZID=35;
SENSOR.WR9_GYRXID=36; SENSOR.WR9_GYRYID=37; SENSOR.WR9_GYRZID=38;
SENSOR.WR9_NULLID=39;

SENSOR.ID(SENSOR.R_RIPID).NAME='SENSOR_RIP';       SENSOR.ID(SENSOR.R_ECGID).NAME='SENSOR_ECG';
SENSOR.ID(SENSOR.R_RIPID).FREQ=64.0/3.0;           SENSOR.ID(SENSOR.R_ECGID).FREQ=64.0;
SENSOR.ID(SENSOR.R_RIPID).TOS_CHANNEL=7;           SENSOR.ID(SENSOR.R_ECGID).TOS_CHANNEL=0;
SENSOR.ID(SENSOR.R_RIPID).DB_TABLE='sensor21';     SENSOR.ID(SENSOR.R_ECGID).DB_TABLE='sensor12';
SENSOR.ID(SENSOR.R_RIPID).READFROM='TOS';          SENSOR.ID(SENSOR.R_ECGID).READFROM='TOS';
%% Autosense Sensor Configuaration
% RIPECG Mote
SENSOR.ID(SENSOR.R_GSRID).NAME='SENSOR_GSR';       SENSOR.ID(SENSOR.R_ACLXID).NAME='SENSOR_ACCELX';
SENSOR.ID(SENSOR.R_GSRID).FREQ=64.0/6.0;           SENSOR.ID(SENSOR.R_ACLXID).FREQ=64.0/6.0;
SENSOR.ID(SENSOR.R_GSRID).TOS_CHANNEL=4;           SENSOR.ID(SENSOR.R_ACLXID).TOS_CHANNEL=1;
SENSOR.ID(SENSOR.R_GSRID).DB_TABLE='sensor13';     SENSOR.ID(SENSOR.R_ACLXID).DB_TABLE='sensor18';
SENSOR.ID(SENSOR.R_GSRID).READFROM='TOS';          SENSOR.ID(SENSOR.R_ACLXID).READFROM='TOS';

SENSOR.ID(SENSOR.R_ACLYID).NAME='SENSOR_ACCELY';    SENSOR.ID(SENSOR.R_ACLZID).NAME='SENSOR_ACCELZ';
SENSOR.ID(SENSOR.R_ACLYID).FREQ=64.0/6.0;           SENSOR.ID(SENSOR.R_ACLZID).FREQ=64.0/6.0;
SENSOR.ID(SENSOR.R_ACLYID).TOS_CHANNEL=2;           SENSOR.ID(SENSOR.R_ACLZID).TOS_CHANNEL=3;
SENSOR.ID(SENSOR.R_ACLYID).DB_TABLE='sensor19';     SENSOR.ID(SENSOR.R_ACLZID).DB_TABLE='sensor20';
SENSOR.ID(SENSOR.R_ACLYID).READFROM='TOS';          SENSOR.ID(SENSOR.R_ACLZID).READFROM='TOS';

SENSOR.ID(SENSOR.R_BAT_SKN_AMB_ID).NAME='1BATTERY_2SKIN_3AMBIENT_4UNKNOWN_5UNKNOWN';
SENSOR.ID(SENSOR.R_BAT_SKN_AMB_ID).FREQ=6.4;
SENSOR.ID(SENSOR.R_BAT_SKN_AMB_ID).TOS_CHANNEL=8;
SENSOR.ID(SENSOR.R_BAT_SKN_AMB_ID).DB_TABLE='';
SENSOR.ID(SENSOR.R_BAT_SKN_AMB_ID).READFROM='TOS';

SENSOR.ID(SENSOR.R_SKINID).NAME='RIP_SKIN_TEMP';     SENSOR.ID(SENSOR.R_AMBID).NAME='RIP_AMBIENT_TEMP';
SENSOR.ID(SENSOR.R_SKINID).FREQ=6.4/5;                 SENSOR.ID(SENSOR.R_AMBID).FREQ=6.4/5;
SENSOR.ID(SENSOR.R_SKINID).TOS_CHANNEL=8;           SENSOR.ID(SENSOR.R_AMBID).TOS_CHANNEL=8;
SENSOR.ID(SENSOR.R_SKINID).DB_TABLE='';         SENSOR.ID(SENSOR.R_AMBID).DB_TABLE='';
SENSOR.ID(SENSOR.A_TEMPID).READFROM='TOS';           SENSOR.ID(SENSOR.R_BAT_SKN_AMB_ID).READFROM='TOS';

SENSOR.ID(SENSOR.R_BATID).NAME='RIP_BATTERY';
SENSOR.ID(SENSOR.R_BATID).FREQ=6.4/5;
SENSOR.ID(SENSOR.R_BATID).TOS_CHANNEL=8;
SENSOR.ID(SENSOR.R_BAT_SKN_AMB_ID).DB_TABLE='';
SENSOR.ID(SENSOR.R_BAT_SKN_AMB_ID).READFROM='TOS';
% Wrist Left
SENSOR.ID(SENSOR.WL_ACLXID).NAME='WL_SENSOR_ACCELX';    SENSOR.ID(SENSOR.WL_ACLYID).NAME='WL_SENSOR_ACCELY';
SENSOR.ID(SENSOR.WL_ACLXID).FREQ=64.0/3.0;              SENSOR.ID(SENSOR.WL_ACLYID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WL_ACLXID).TOS_CHANNEL=16;             SENSOR.ID(SENSOR.WL_ACLYID).TOS_CHANNEL=17;
SENSOR.ID(SENSOR.WL_ACLXID).DB_TABLE='';                SENSOR.ID(SENSOR.WL_ACLYID).DB_TABLE='';
SENSOR.ID(SENSOR.WL_ACLXID).READFROM='TOS';             SENSOR.ID(SENSOR.WL_ACLYID).READFROM='TOS';

SENSOR.ID(SENSOR.WL_ACLZID).NAME='WL_SENSOR_ACCELZ';
SENSOR.ID(SENSOR.WL_ACLZID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WL_ACLZID).TOS_CHANNEL=18;
SENSOR.ID(SENSOR.WL_ACLZID).DB_TABLE='';
SENSOR.ID(SENSOR.WL_ACLZID).READFROM='TOS';

%SENSOR.ID(SENSOR.WL_ACLXID).COMPONENTS=[SENSOR.WL_ACLX_REAL_ID SENSOR.WL_ACLX_LINEAR_ID SENSOR.WL_ACLX_GRAVITY_ID];
%SENSOR.ID(SENSOR.WL_ACLYID).COMPONENTS=[SENSOR.WL_ACLY_REAL_ID SENSOR.WL_ACLY_LINEAR_ID SENSOR.WL_ACLY_GRAVITY_ID];
%SENSOR.ID(SENSOR.WL_ACLZID).COMPONENTS=[SENSOR.WL_ACLZ_REAL_ID SENSOR.WL_ACLZ_LINEAR_ID SENSOR.WL_ACLZ_GRAVITY_ID];

% Wrist Right
SENSOR.ID(SENSOR.WR_ACLXID).NAME='WR_SENSOR_ACCELX';    SENSOR.ID(SENSOR.WR_ACLYID).NAME='WR_SENSOR_ACCELY';
SENSOR.ID(SENSOR.WR_ACLXID).FREQ=64.0/3.0;              SENSOR.ID(SENSOR.WR_ACLYID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WR_ACLXID).TOS_CHANNEL=13;             SENSOR.ID(SENSOR.WR_ACLYID).TOS_CHANNEL=14;
SENSOR.ID(SENSOR.WR_ACLXID).DB_TABLE='';                SENSOR.ID(SENSOR.WR_ACLYID).DB_TABLE='';
SENSOR.ID(SENSOR.WR_ACLXID).READFROM='TOS';             SENSOR.ID(SENSOR.WR_ACLYID).READFROM='TOS';

SENSOR.ID(SENSOR.WR_ACLZID).NAME='WR_SENSOR_ACCELZ';
SENSOR.ID(SENSOR.WR_ACLZID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WR_ACLZID).TOS_CHANNEL=15;
SENSOR.ID(SENSOR.WR_ACLZID).DB_TABLE='';
SENSOR.ID(SENSOR.WL_ACLZID).READFROM='TOS';

%SENSOR.ID(SENSOR.WR_ACLXID).COMPONENTS=[SENSOR.WR_ACLX_REAL_ID SENSOR.WR_ACLX_LINEAR_ID SENSOR.WR_ACLX_GRAVITY_ID];
%SENSOR.ID(SENSOR.WR_ACLYID).COMPONENTS=[SENSOR.WR_ACLY_REAL_ID SENSOR.WR_ACLY_LINEAR_ID SENSOR.WR_ACLY_GRAVITY_ID];
%SENSOR.ID(SENSOR.WR_ACLZID).COMPONENTS=[SENSOR.WR_ACLZ_REAL_ID SENSOR.WR_ACLZ_LINEAR_ID SENSOR.WR_ACLZ_GRAVITY_ID];

% Alcohol Mote
SENSOR.ID(SENSOR.A_ALCID).NAME='ALC_ALCOHOL';       SENSOR.ID(SENSOR.A_GSRID).NAME='ALC_GSR';
SENSOR.ID(SENSOR.A_ALCID).FREQ=6.4;                 SENSOR.ID(SENSOR.A_GSRID).FREQ=6.4;
SENSOR.ID(SENSOR.A_ALCID).TOS_CHANNEL=10;           SENSOR.ID(SENSOR.A_GSRID).TOS_CHANNEL=11;
SENSOR.ID(SENSOR.A_ALCID).DB_TABLE='sensor27';      SENSOR.ID(SENSOR.A_GSRID).DB_TABLE='sensor28';
SENSOR.ID(SENSOR.A_ALCID).READFROM='TOS';           SENSOR.ID(SENSOR.A_GSRID).READFROM='TOS';

SENSOR.ID(SENSOR.A_TEMPID).NAME='ALC_TEMPERATURE';
SENSOR.ID(SENSOR.A_TEMPID).FREQ=6.4;
SENSOR.ID(SENSOR.A_TEMPID).TOS_CHANNEL=12;
SENSOR.ID(SENSOR.A_TEMPID).DB_TABLE='sensor29';
SENSOR.ID(SENSOR.A_TEMPID).READFROM='TOS';


%% Phone Sensor Configuration
SENSOR.ID(SENSOR.P_ACLXID).NAME='PHONE_ACCELX';     SENSOR.ID(SENSOR.P_ACLYID).NAME='PHONE_ACCELY';
SENSOR.ID(SENSOR.P_ACLXID).FREQ=64.0/6.0;           SENSOR.ID(SENSOR.P_ACLYID).FREQ=64.0/6.0;
SENSOR.ID(SENSOR.P_ACLXID).DB_TABLE='sensor30';     SENSOR.ID(SENSOR.P_ACLYID).DB_TABLE='sensor31';
SENSOR.ID(SENSOR.P_ACLXID).READFROM='DB';           SENSOR.ID(SENSOR.P_ACLYID).READFROM='DB';

SENSOR.ID(SENSOR.P_ACLZID).NAME='PHONE_ACCELZ';
SENSOR.ID(SENSOR.P_ACLZID).FREQ=64.0/6.0;
SENSOR.ID(SENSOR.P_ACLZID).DB_TABLE='sensor32';
SENSOR.ID(SENSOR.P_ACLZID).READFROM='DB';

SENSOR.ID(SENSOR.P_GPS_LATID).NAME='GPS_LATITUDE';
SENSOR.ID(SENSOR.P_GPS_LATID).FREQ=0;
SENSOR.ID(SENSOR.P_GPS_LATID).DB_TABLE='sensor23';
SENSOR.ID(SENSOR.P_GPS_LATID).READFROM='LOC';
SENSOR.ID(SENSOR.P_GPS_LATID).CSV_COLUMN=1;

SENSOR.ID(SENSOR.P_GPS_LONGID).NAME='GPS_LONGITUDE';
SENSOR.ID(SENSOR.P_GPS_LONGID).FREQ=0; %??
SENSOR.ID(SENSOR.P_GPS_LONGID).DB_TABLE='sensor24';
SENSOR.ID(SENSOR.P_GPS_LONGID).READFROM='LOC';
SENSOR.ID(SENSOR.P_GPS_LONGID).CSV_COLUMN=2;

SENSOR.ID(SENSOR.P_GPS_ALTID).NAME='GPS_ALTITUDE';
SENSOR.ID(SENSOR.P_GPS_ALTID).FREQ=0;
SENSOR.ID(SENSOR.P_GPS_ALTID).DB_TABLE='sensor25';
SENSOR.ID(SENSOR.P_GPS_ALTID).READFROM='LOC';
SENSOR.ID(SENSOR.P_GPS_ALTID).CSV_COLUMN=3;

SENSOR.ID(SENSOR.P_GPS_SPDID).NAME='GPS_SPEED';
SENSOR.ID(SENSOR.P_GPS_SPDID).FREQ=0;
SENSOR.ID(SENSOR.P_GPS_SPDID).DB_TABLE='sensor25';
SENSOR.ID(SENSOR.P_GPS_SPDID).READFROM='LOC';
SENSOR.ID(SENSOR.P_GPS_SPDID).CSV_COLUMN=5;

SENSOR.ID(SENSOR.P_GPS_BEAR).NAME='GPS_BEAR';
SENSOR.ID(SENSOR.P_GPS_BEAR).FREQ=0;
SENSOR.ID(SENSOR.P_GPS_BEAR).DB_TABLE='sensor25';
SENSOR.ID(SENSOR.P_GPS_BEAR).READFROM='LOC';
SENSOR.ID(SENSOR.P_GPS_BEAR).CSV_COLUMN=4;

SENSOR.ID(SENSOR.P_GPS_ACCURACYID).NAME='GPS_ACCURACY';
SENSOR.ID(SENSOR.P_GPS_ACCURACYID).FREQ=0;
SENSOR.ID(SENSOR.P_GPS_ACCURACYID).DB_TABLE='sensor25';
SENSOR.ID(SENSOR.P_GPS_ACCURACYID).READFROM='LOC';
SENSOR.ID(SENSOR.P_GPS_ACCURACYID).CSV_COLUMN=6;

%{

SENSOR.ID(SENSOR.WL_ACLX_REAL_ID).NAME='WL_ACLX_REAL_ID';	SENSOR.ID(SENSOR.WL_ACLX_LINEAR_ID).NAME='WL_ACLX_LINEAR_ID';	SENSOR.ID(SENSOR.WL_ACLX_GRAVITY_ID).NAME='WL_ACLX_GRAVITY_ID';
SENSOR.ID(SENSOR.WL_ACLX_REAL_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WL_ACLX_LINEAR_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WL_ACLX_GRAVITY_ID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WL_ACLX_REAL_ID).TOS_CHANNEL=16;           SENSOR.ID(SENSOR.WL_ACLX_LINEAR_ID).TOS_CHANNEL=16;           SENSOR.ID(SENSOR.WL_ACLX_GRAVITY_ID).TOS_CHANNEL=16;
SENSOR.ID(SENSOR.WL_ACLX_REAL_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WL_ACLX_LINEAR_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WL_ACLX_GRAVITY_ID).DB_TABLE='sensor29';
SENSOR.ID(SENSOR.WL_ACLX_REAL_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WL_ACLX_LINEAR_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WL_ACLX_GRAVITY_ID).READFROM='TOS';

SENSOR.ID(SENSOR.WL_ACLY_REAL_ID).NAME='WL_ACLY_REAL_ID';   SENSOR.ID(SENSOR.WL_ACLY_LINEAR_ID).NAME='WL_ACLY_LINEAR_ID';   SENSOR.ID(SENSOR.WL_ACLY_GRAVITY_ID).NAME='WL_ACLY_GRAVITY_ID';
SENSOR.ID(SENSOR.WL_ACLY_REAL_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WL_ACLY_LINEAR_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WL_ACLY_GRAVITY_ID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WL_ACLY_REAL_ID).TOS_CHANNEL=17;           SENSOR.ID(SENSOR.WL_ACLY_LINEAR_ID).TOS_CHANNEL=17;           SENSOR.ID(SENSOR.WL_ACLY_GRAVITY_ID).TOS_CHANNEL=17;
SENSOR.ID(SENSOR.WL_ACLY_REAL_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WL_ACLY_LINEAR_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WL_ACLY_GRAVITY_ID).DB_TABLE='sensor29';
SENSOR.ID(SENSOR.WL_ACLY_REAL_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WL_ACLY_LINEAR_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WL_ACLY_GRAVITY_ID).READFROM='TOS';

SENSOR.ID(SENSOR.WL_ACLZ_REAL_ID).NAME='WL_ACLZ_REAL_ID';   SENSOR.ID(SENSOR.WL_ACLZ_LINEAR_ID).NAME='WL_ACLZ_LINEAR_ID';   SENSOR.ID(SENSOR.WL_ACLZ_GRAVITY_ID).NAME='WL_ACLZ_GRAVITY_ID';
SENSOR.ID(SENSOR.WL_ACLZ_REAL_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WL_ACLZ_LINEAR_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WL_ACLZ_GRAVITY_ID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WL_ACLZ_REAL_ID).TOS_CHANNEL=18;           SENSOR.ID(SENSOR.WL_ACLZ_LINEAR_ID).TOS_CHANNEL=18;           SENSOR.ID(SENSOR.WL_ACLZ_GRAVITY_ID).TOS_CHANNEL=18;
SENSOR.ID(SENSOR.WL_ACLZ_REAL_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WL_ACLZ_LINEAR_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WL_ACLZ_GRAVITY_ID).DB_TABLE='sensor29';
SENSOR.ID(SENSOR.WL_ACLZ_REAL_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WL_ACLZ_LINEAR_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WL_ACLZ_GRAVITY_ID).READFROM='TOS';




SENSOR.ID(SENSOR.WR_ACLX_REAL_ID).NAME='WR_ACLX_REAL_ID';	SENSOR.ID(SENSOR.WR_ACLX_LINEAR_ID).NAME='WR_ACLX_LINEAR_ID';	SENSOR.ID(SENSOR.WR_ACLX_GRAVITY_ID).NAME='WR_ACLX_GRAVITY_ID';
SENSOR.ID(SENSOR.WR_ACLX_REAL_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WR_ACLX_LINEAR_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WR_ACLX_GRAVITY_ID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WR_ACLX_REAL_ID).TOS_CHANNEL=13;           SENSOR.ID(SENSOR.WR_ACLX_LINEAR_ID).TOS_CHANNEL=13;           SENSOR.ID(SENSOR.WR_ACLX_GRAVITY_ID).TOS_CHANNEL=13;
SENSOR.ID(SENSOR.WR_ACLX_REAL_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WR_ACLX_LINEAR_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WR_ACLX_GRAVITY_ID).DB_TABLE='sensor29';
SENSOR.ID(SENSOR.WR_ACLX_REAL_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WR_ACLX_LINEAR_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WR_ACLX_GRAVITY_ID).READFROM='TOS';

SENSOR.ID(SENSOR.WR_ACLY_REAL_ID).NAME='WR_ACLY_REAL_ID';   SENSOR.ID(SENSOR.WR_ACLY_LINEAR_ID).NAME='WR_ACLY_LINEAR_ID';   SENSOR.ID(SENSOR.WR_ACLY_GRAVITY_ID).NAME='WR_ACLY_GRAVITY_ID';
SENSOR.ID(SENSOR.WR_ACLY_REAL_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WR_ACLY_LINEAR_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WR_ACLY_GRAVITY_ID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WR_ACLY_REAL_ID).TOS_CHANNEL=14;           SENSOR.ID(SENSOR.WR_ACLY_LINEAR_ID).TOS_CHANNEL=14;           SENSOR.ID(SENSOR.WR_ACLY_GRAVITY_ID).TOS_CHANNEL=14;
SENSOR.ID(SENSOR.WR_ACLY_REAL_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WR_ACLY_LINEAR_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WR_ACLY_GRAVITY_ID).DB_TABLE='sensor29';
SENSOR.ID(SENSOR.WR_ACLY_REAL_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WR_ACLY_LINEAR_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WR_ACLY_GRAVITY_ID).READFROM='TOS';

SENSOR.ID(SENSOR.WR_ACLZ_REAL_ID).NAME='WR_ACLZ_REAL_ID';   SENSOR.ID(SENSOR.WR_ACLZ_LINEAR_ID).NAME='WR_ACLZ_LINEAR_ID';   SENSOR.ID(SENSOR.WR_ACLZ_GRAVITY_ID).NAME='WR_ACLZ_GRAVITY_ID';
SENSOR.ID(SENSOR.WR_ACLZ_REAL_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WR_ACLZ_LINEAR_ID).FREQ=64.0/3.0;            SENSOR.ID(SENSOR.WR_ACLZ_GRAVITY_ID).FREQ=64.0/3.0;
SENSOR.ID(SENSOR.WR_ACLZ_REAL_ID).TOS_CHANNEL=15;           SENSOR.ID(SENSOR.WR_ACLZ_LINEAR_ID).TOS_CHANNEL=15;           SENSOR.ID(SENSOR.WR_ACLZ_GRAVITY_ID).TOS_CHANNEL=15;
SENSOR.ID(SENSOR.WR_ACLZ_REAL_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WR_ACLZ_LINEAR_ID).DB_TABLE='sensor29';      SENSOR.ID(SENSOR.WR_ACLZ_GRAVITY_ID).DB_TABLE='sensor29';
SENSOR.ID(SENSOR.WR_ACLZ_REAL_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WR_ACLZ_LINEAR_ID).READFROM='TOS';           SENSOR.ID(SENSOR.WR_ACLZ_GRAVITY_ID).READFROM='TOS';

%}



%%%%%%%%%%%%%%%%%%%%%%% Nine Axis %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


SENSOR.ID(SENSOR.WR9_ACLXID).NAME='WR9_ACLXID';  SENSOR.ID(SENSOR.WR9_ACLYID).NAME='WR9_ACLYID';  SENSOR.ID(SENSOR.WR9_ACLZID).NAME='WR9_ACLZID';
SENSOR.ID(SENSOR.WR9_ACLXID).FREQ=16.0;          SENSOR.ID(SENSOR.WR9_ACLYID).FREQ=16.0;          SENSOR.ID(SENSOR.WR9_ACLZID).FREQ=16.0;
SENSOR.ID(SENSOR.WR9_ACLXID).TOS_CHANNEL=19;     SENSOR.ID(SENSOR.WR9_ACLYID).TOS_CHANNEL=20;     SENSOR.ID(SENSOR.WR9_ACLZID).TOS_CHANNEL=21;
SENSOR.ID(SENSOR.WR9_ACLXID).DB_TABLE='';        SENSOR.ID(SENSOR.WR9_ACLYID).DB_TABLE='';        SENSOR.ID(SENSOR.WR9_ACLZID).DB_TABLE='';
SENSOR.ID(SENSOR.WR9_ACLXID).READFROM='TOS';     SENSOR.ID(SENSOR.WR9_ACLYID).READFROM='TOS';     SENSOR.ID(SENSOR.WR9_ACLZID).READFROM='TOS';

SENSOR.ID(SENSOR.WR9_GYRXID).NAME='WR9_GYRXID';  SENSOR.ID(SENSOR.WR9_GYRYID).NAME='WR9_GYRYID';  SENSOR.ID(SENSOR.WR9_GYRZID).NAME='WR9_GYRZID';
SENSOR.ID(SENSOR.WR9_GYRXID).FREQ=16.0;          SENSOR.ID(SENSOR.WR9_GYRYID).FREQ=16.0;          SENSOR.ID(SENSOR.WR9_GYRZID).FREQ=16.0;
SENSOR.ID(SENSOR.WR9_GYRXID).TOS_CHANNEL=22;     SENSOR.ID(SENSOR.WR9_GYRYID).TOS_CHANNEL=23;     SENSOR.ID(SENSOR.WR9_GYRZID).TOS_CHANNEL=24;
SENSOR.ID(SENSOR.WR9_GYRXID).DB_TABLE='';        SENSOR.ID(SENSOR.WR9_GYRYID).DB_TABLE='';        SENSOR.ID(SENSOR.WR9_GYRZID).DB_TABLE='';
SENSOR.ID(SENSOR.WR9_GYRXID).READFROM='TOS';     SENSOR.ID(SENSOR.WR9_GYRYID).READFROM='TOS';     SENSOR.ID(SENSOR.WR9_GYRZID).READFROM='TOS';

SENSOR.ID(SENSOR.WR9_NULLID).NAME='WR9_NULLID';
SENSOR.ID(SENSOR.WR9_NULLID).FREQ=4.0;
SENSOR.ID(SENSOR.WR9_NULLID).TOS_CHANNEL=25;
SENSOR.ID(SENSOR.WR9_NULLID).DB_TABLE='';
SENSOR.ID(SENSOR.WR9_NULLID).READFROM='TOS';

SENSOR.ID(SENSOR.WL9_ACLXID).NAME='WL9_ACLXID';  SENSOR.ID(SENSOR.WL9_ACLYID).NAME='WL9_ACLYID';  SENSOR.ID(SENSOR.WL9_ACLZID).NAME='WL9_ACLZID';
SENSOR.ID(SENSOR.WL9_ACLXID).FREQ=16.0;          SENSOR.ID(SENSOR.WL9_ACLYID).FREQ=16.0;          SENSOR.ID(SENSOR.WL9_ACLZID).FREQ=16.0;
SENSOR.ID(SENSOR.WL9_ACLXID).TOS_CHANNEL=26;     SENSOR.ID(SENSOR.WL9_ACLYID).TOS_CHANNEL=27;     SENSOR.ID(SENSOR.WL9_ACLZID).TOS_CHANNEL=28;
SENSOR.ID(SENSOR.WL9_ACLXID).DB_TABLE='';        SENSOR.ID(SENSOR.WL9_ACLYID).DB_TABLE='';        SENSOR.ID(SENSOR.WL9_ACLZID).DB_TABLE='';
SENSOR.ID(SENSOR.WL9_ACLXID).READFROM='TOS';     SENSOR.ID(SENSOR.WL9_ACLYID).READFROM='TOS';     SENSOR.ID(SENSOR.WL9_ACLZID).READFROM='TOS';

SENSOR.ID(SENSOR.WL9_GYRXID).NAME='WL9_GYRXID';  SENSOR.ID(SENSOR.WL9_GYRYID).NAME='WL9_GYRYID';  SENSOR.ID(SENSOR.WL9_GYRZID).NAME='WL9_GYRZID';
SENSOR.ID(SENSOR.WL9_GYRXID).FREQ=16.0;          SENSOR.ID(SENSOR.WL9_GYRYID).FREQ=16.0;          SENSOR.ID(SENSOR.WL9_GYRZID).FREQ=16.0;
SENSOR.ID(SENSOR.WL9_GYRXID).TOS_CHANNEL=29;     SENSOR.ID(SENSOR.WL9_GYRYID).TOS_CHANNEL=30;     SENSOR.ID(SENSOR.WL9_GYRZID).TOS_CHANNEL=31;
SENSOR.ID(SENSOR.WL9_GYRXID).DB_TABLE='';        SENSOR.ID(SENSOR.WL9_GYRYID).DB_TABLE='';        SENSOR.ID(SENSOR.WL9_GYRZID).DB_TABLE='';
SENSOR.ID(SENSOR.WL9_GYRXID).READFROM='TOS';     SENSOR.ID(SENSOR.WL9_GYRYID).READFROM='TOS';     SENSOR.ID(SENSOR.WL9_GYRZID).READFROM='TOS';

SENSOR.ID(SENSOR.WL9_NULLID).NAME='WL9_NULLID';
SENSOR.ID(SENSOR.WL9_NULLID).FREQ=4.0;
SENSOR.ID(SENSOR.WL9_NULLID).TOS_CHANNEL=32;
SENSOR.ID(SENSOR.WL9_NULLID).DB_TABLE='';
SENSOR.ID(SENSOR.WL9_NULLID).READFROM='TOS';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end
