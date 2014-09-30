function G=config_run_nida(G)
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
G.STUDYNAME='NIDA';
G.TIME.TIMEZONE=-5;
G.TIME.DAYLIGHTSAVING=1;
G.TIME.FORMAT='mm/dd/yyyy HH:MM:SS';

G.DIR.DATA=[G.DIR.ROOT G.DIR.SEP 'data' G.DIR.SEP G.STUDYNAME];
%%{
G.PS_LIST= {

%subject and sessions are adjusted according to their actual study participation.
%     {'p01'},(cellstr(strcat('s',num2str((1:6)','%02d'))))'; %wk1
% 	{'p01'},(cellstr(strcat('s',num2str((8:13)','%02d'))))'; %wk2
% 	{'p01'},(cellstr(strcat('s',num2str((15:21)','%02d'))))'; %wk3
% 	{'p01'},(cellstr(strcat('s',num2str((23:29)','%02d'))))'; %wk4
%
%     {'p02'},(cellstr(strcat('s',num2str((1:7)','%02d'))))'; %wk1
% 	{'p02'},(cellstr(strcat('s',num2str((10:16)','%02d'))))'; %wk2
% 	{'p02'},(cellstr(strcat('s',num2str((18:26)','%02d'))))'; %wk3
% 	{'p02'},(cellstr(strcat('s',num2str((28:34)','%02d'))))'; %wk4
%
%     {'p03'},(cellstr(strcat('s',num2str((2:7)','%02d'))))';
%     {'p03'},(cellstr(strcat('s',num2str((8:14)','%02d'))))';
% 	{'p03'},(cellstr(strcat('s',num2str((17:19)','%02d'))))';
%     {'p03'},(cellstr(strcat('s',num2str((20:26)','%02d'))))';
%
%     {'p04'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
% 	{'p04'},(cellstr(strcat('s',num2str((10:16)','%02d'))))';
% 	{'p04'},(cellstr(strcat('s',num2str((18:23)','%02d'))))';
% 	{'p04'},(cellstr(strcat('s',num2str((25:31)','%02d'))))';
%
%     {'p05'},(cellstr(strcat('s',num2str((1:6)','%02d'))))';
% % 	{'p05'},(cellstr(strcat('s',num2str((9:10)','%02d'))))'; %wk2
% % 	{'p05'},(cellstr(strcat('s',num2str((12:13)','%02d'))))'; %wk2
%     {'p05'},(cellstr(strcat('s',num2str((9:13)','%02d'))))';
% 	{'p05'},(cellstr(strcat('s',num2str((15:21)','%02d'))))';
% 	{'p05'},(cellstr(strcat('s',num2str((23:27)','%02d'))))';
%
%     {'p06'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p06'},(cellstr(strcat('s',num2str((10:16)','%02d'))))';
% 	{'p06'},(cellstr(strcat('s',num2str((18:24)','%02d'))))';
% 	{'p06'},(cellstr(strcat('s',num2str((27:33)','%02d'))))';
%
%     {'p07'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p07'},(cellstr(strcat('s',num2str((9:11)','%02d'))))';
% % 	{'p07'},(cellstr(strcat('s',num2str((14:18)','%02d'))))'; %wk3
% %     {'p07'},(cellstr(strcat('s',num2str((19:19)','%02d'))))'; %wk3
%     {'p07'},(cellstr(strcat('s',num2str((14:19)','%02d'))))';
% 	{'p07'},(cellstr(strcat('s',num2str((20:24)','%02d'))))';
%
%     {'p08'},(cellstr(strcat('s',num2str((2:7)','%02d'))))';
%     {'p08'},(cellstr(strcat('s',num2str((8:12)','%02d'))))';
% 	{'p08'},(cellstr(strcat('s',num2str((13:19)','%02d'))))';
%     {'p08'},(cellstr(strcat('s',num2str((20:26)','%02d'))))';
%
%     {'p09'},(cellstr(strcat('s',num2str((1:5)','%02d'))))';
%     {'p09'},(cellstr(strcat('s',num2str((6:12)','%02d'))))';
% 	{'p09'},(cellstr(strcat('s',num2str((14:20)','%02d'))))';
% 	{'p09'},(cellstr(strcat('s',num2str((22:28)','%02d'))))';
%
%     {'p10'},(cellstr(strcat('s',num2str((1:5)','%02d'))))';
% 	{'p10'},(cellstr(strcat('s',num2str((8:14)','%02d'))))';
% 	{'p10'},(cellstr(strcat('s',num2str((16:22)','%02d'))))';
% 	{'p10'},(cellstr(strcat('s',num2str((25:31)','%02d'))))';
%
%     {'p11'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
%    {'p11'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
%    {'p11'},(cellstr(strcat('s',num2str((17:23)','%02d'))))';
%
%    {'p12'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
%    {'p12'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
%    {'p12'},(cellstr(strcat('s',num2str((18:24)','%02d'))))';
%     {'p12'},(cellstr(strcat('s',num2str((25:30)','%02d'))))';
%
%    {'p14'},(cellstr(strcat('s',num2str((2:9)','%02d'))))';
%    {'p14'},(cellstr(strcat('s',num2str((10:12)','%02d'))))';
%    {'p14'},(cellstr(strcat('s',num2str((13:20)','%02d'))))';
%    {'p14'},(cellstr(strcat('s',num2str((22:28)','%02d'))))';
%
%    {'p15'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
%    {'p15'},(cellstr(strcat('s',num2str((9:11)','%02d'))))';
%    {'p15'},(cellstr(strcat('s',num2str((12:18)','%02d'))))';
%    {'p15'},(cellstr(strcat('s',num2str((21:26)','%02d'))))';
%
%    {'p16'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
%    {'p16'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
%    {'p16'},(cellstr(strcat('s',num2str((16:23)','%02d'))))';
%    {'p16'},(cellstr(strcat('s',num2str((25:29)','%02d'))))';
%
%     {'p17'},(cellstr(strcat('s',num2str((1:5)','%02d'))))';
% 	{'p17'},(cellstr(strcat('s',num2str((8:9)','%02d'))))';
% 	{'p17'},(cellstr(strcat('s',num2str((11:15)','%02d'))))';
% 	{'p17'},(cellstr(strcat('s',num2str((17:24)','%02d'))))';
%
%     {'p18'},(cellstr(strcat('s',num2str((2:8)','%02d'))))';
%     {'p18'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
% 	{'p18'},(cellstr(strcat('s',num2str((17:21)','%02d'))))';
%
%     {'p19'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p19'},(cellstr(strcat('s',num2str((9:19)','%02d'))))';
%
%     {'p20'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p20'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
% 	{'p20'},(cellstr(strcat('s',num2str((17:23)','%02d'))))';
%     {'p20'},(cellstr(strcat('s',num2str((24:30)','%02d'))))';
%
%     {'p21'},(cellstr(strcat('s',num2str((2:7)','%02d'))))';
% 	{'p21'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
%     {'p21'},(cellstr(strcat('s',num2str((16:23)','%02d'))))';
% 	{'p21'},(cellstr(strcat('s',num2str((25:27)','%02d'))))'; %week4
% 	{'p21'},(cellstr(strcat('s',num2str((29:31)','%02d'))))'; %week4

% %     {'p22'},(cellstr(strcat('s',num2str((1:6)','%02d'))))';

%     {'p23'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
%     {'p23'},(cellstr(strcat('s',num2str((9:14)','%02d'))))';
%     {'p23'},(cellstr(strcat('s',num2str((15:23)','%02d'))))';
%     {'p23'},(cellstr(strcat('s',num2str((24:32)','%02d'))))';
%
%     {'p24'},(cellstr(strcat('s',num2str((14:21)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((22:29)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((30:36)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((37:43)','%02d'))))';  %%wk4
% %
%       {'p25'},(cellstr(strcat('s',num2str((13:38)','%02d'))))';
% %
%       {'p26'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
%       {'p26'},(cellstr(strcat('s',num2str((12:19)','%02d'))))';
%       {'p26'},(cellstr(strcat('s',num2str((20:25)','%02d'))))';
%       {'p26'},(cellstr(strcat('s',num2str((27:34)','%02d'))))';
%
%       %     {'p27'},(cellstr(strcat('s',num2str((1:32)','%02d'))))';
%       {'p27'},(cellstr(strcat('s',num2str((3:10)','%02d'))))';
%       {'p27'},(cellstr(strcat('s',num2str((12:16)','%02d'))))';
%       {'p27'},(cellstr(strcat('s',num2str((17:24)','%02d'))))';
%       {'p27'},(cellstr(strcat('s',num2str((25:32)','%02d'))))';
%
%     {'p28'},(cellstr(strcat('s',num2str((1:25)','%02d'))))';
%     {'p28'},(cellstr(strcat('s',num2str((26:37)','%02d'))))';
%
%     {'p29'},(cellstr(strcat('s',num2str((1:27)','%02d'))))';
%
%     {'p30'},(cellstr(strcat('s',num2str((3:32)','%02d'))))';

% % % %     {'p31'},(cellstr(strcat('s',num2str((1:4)','%02d'))))';
% % % %     {'p32'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';

%     {'p33'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
%     {'p33'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
%     {'p33'},(cellstr(strcat('s',num2str((16:22)','%02d'))))';
%     {'p33'},(cellstr(strcat('s',num2str((23:30)','%02d'))))';
%
%     {'p34'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
%     {'p34'},(cellstr(strcat('s',num2str((10:17)','%02d'))))';
%     {'p34'},(cellstr(strcat('s',num2str((19:25)','%02d'))))';
%     {'p34'},(cellstr(strcat('s',num2str((27:34)','%02d'))))';
%
%     {'p35'},(cellstr(strcat('s',num2str((2:8)','%02d'))))';
%     {'p35'},(cellstr(strcat('s',num2str((9:14)','%02d'))))';
%     {'p35'},(cellstr(strcat('s',num2str((15:18)','%02d'))))';
%     {'p35'},(cellstr(strcat('s',num2str((19:22)','%02d'))))';
%
%     {'p36'},(cellstr(strcat('s',num2str((17:24)','%02d'))))';
% % % %     week#2 missing (9/23/2013 - 9/29/2013)
%     {'p36'},(cellstr(strcat('s',num2str((25:29)','%02d'))))';
%     {'p36'},(cellstr(strcat('s',num2str((30:37)','%02d'))))';


% % %     {'p37'},(cellstr(strcat('s',num2str((1:1)','%02d'))))';

    {'p38'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
    {'p38'},(cellstr(strcat('s',num2str((8:17)','%02d'))))';
    {'p38'},(cellstr(strcat('s',num2str((18:25)','%02d'))))';
    {'p38'},(cellstr(strcat('s',num2str((26:32)','%02d'))))';


    {'p39'},(cellstr(strcat('s',num2str((6:13)','%02d'))))';
    {'p39'},(cellstr(strcat('s',num2str((14:21)','%02d'))))';
    {'p39'},(cellstr(strcat('s',num2str((22:28)','%02d'))))';
%%%   week#4 is missing


%%%   week#1 is missing
    {'p40'},(cellstr(strcat('s',num2str((2:10)','%02d'))))';
    {'p40'},(cellstr(strcat('s',num2str((11:18)','%02d'))))';
    {'p40'},(cellstr(strcat('s',num2str((19:22)','%02d'))))';

    {'p41'},(cellstr(strcat('s',num2str((10:17)','%02d'))))';
    {'p41'},(cellstr(strcat('s',num2str((18:24)','%02d'))))';
    {'p41'},(cellstr(strcat('s',num2str((25:29)','%02d'))))';
    {'p41'},(cellstr(strcat('s',num2str((30:33)','%02d'))))';

    %%%   week#1 is missing
    {'p42'},(cellstr(strcat('s',num2str((1:9)','%02d'))))';
    {'p42'},(cellstr(strcat('s',num2str((10:14)','%02d'))))';
    %%   week#4 is missing

    {'p43'},(cellstr(strcat('s',num2str((13:20)','%02d'))))';
    {'p43'},(cellstr(strcat('s',num2str((19:19)','%02d'))))';
    {'p43'},(cellstr(strcat('s',num2str((22:29)','%02d'))))';
    {'p43'},(cellstr(strcat('s',num2str((30:38)','%02d'))))';
    {'p43'},(cellstr(strcat('s',num2str((39:45)','%02d'))))';

    {'p44'},(cellstr(strcat('s',num2str((4:8)','%02d'))))';
    %%%   week#2 is missing
    %%%   week#3 is missing
    %%%   week#4 is missing

    {'p45'},(cellstr(strcat('s',num2str((4:9)','%02d'))))';
    {'p45'},(cellstr(strcat('s',num2str((10:17)','%02d'))))';
    {'p45'},(cellstr(strcat('s',num2str((18:25)','%02d'))))';
    {'p45'},(cellstr(strcat('s',num2str((26:27)','%02d'))))';
    {'p45'},(cellstr(strcat('s',num2str((29:33)','%02d'))))';

    {'p46'},(cellstr(strcat('s',num2str((1:22)','%02d'))))';
   };
%}

 %{
G.PS_LIST= {

%subject and sessions are adjusted according to their actual study
%participation. plus week matching
    {'p01'},(cellstr(strcat('s',num2str((1:6)','%02d'))))'; %wk1
	{'p01'},(cellstr(strcat('s',num2str((8:13)','%02d'))))'; %wk2
	{'p01'},(cellstr(strcat('s',num2str((15:21)','%02d'))))'; %wk3
	{'p01'},(cellstr(strcat('s',num2str((23:29)','%02d'))))'; %wk4

    {'p02'},(cellstr(strcat('s',num2str((1:7)','%02d'))))'; %wk1
	{'p02'},(cellstr(strcat('s',num2str((10:16)','%02d'))))'; %wk2
	{'p02'},(cellstr(strcat('s',num2str((18:26)','%02d'))))'; %wk3
	{'p02'},(cellstr(strcat('s',num2str((28:34)','%02d'))))'; %wk4

    {'p03'},(cellstr(strcat('s',num2str((2:7)','%02d'))))';
    {'p03'},(cellstr(strcat('s',num2str((8:14)','%02d'))))';
	{'p03'},(cellstr(strcat('s',num2str((17:19)','%02d'))))';
    {'p03'},(cellstr(strcat('s',num2str((20:26)','%02d'))))';

    {'p04'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
	{'p04'},(cellstr(strcat('s',num2str((10:16)','%02d'))))';
	{'p04'},(cellstr(strcat('s',num2str((18:23)','%02d'))))';
	{'p04'},(cellstr(strcat('s',num2str((25:31)','%02d'))))';

    {'p05'},(cellstr(strcat('s',num2str((1:6)','%02d'))))';
	{'p05'},(cellstr(strcat('s',num2str((9:13)','%02d'))))'; %wk2 merged. some day missing
% 	{'p05'},(cellstr(strcat('s',num2str((12:13)','%02d'))))'; %wk2
	{'p05'},(cellstr(strcat('s',num2str((15:21)','%02d'))))';
	{'p05'},(cellstr(strcat('s',num2str((23:27)','%02d'))))';

    {'p06'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
	{'p06'},(cellstr(strcat('s',num2str((10:16)','%02d'))))';
	{'p06'},(cellstr(strcat('s',num2str((18:24)','%02d'))))';
	{'p06'},(cellstr(strcat('s',num2str((27:33)','%02d'))))';

    {'p07'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
	{'p07'},(cellstr(strcat('s',num2str((9:11)','%02d'))))';
	{'p07'},(cellstr(strcat('s',num2str((14:19)','%02d'))))'; %wk3 merged. some day missing. check against the session def
	{'p07'},(cellstr(strcat('s',num2str((20:24)','%02d'))))';

    {'p08'},(cellstr(strcat('s',num2str((2:7)','%02d'))))';
    {'p08'},(cellstr(strcat('s',num2str((8:12)','%02d'))))';
	{'p08'},(cellstr(strcat('s',num2str((13:19)','%02d'))))';
    {'p08'},(cellstr(strcat('s',num2str((20:26)','%02d'))))';

    {'p09'},(cellstr(strcat('s',num2str((1:5)','%02d'))))';
      {'p09'},(cellstr(strcat('s',num2str((6:12)','%02d'))))';
	{'p09'},(cellstr(strcat('s',num2str((14:20)','%02d'))))';
	{'p09'},(cellstr(strcat('s',num2str((22:28)','%02d'))))';

    {'p10'},(cellstr(strcat('s',num2str((1:5)','%02d'))))';
	{'p10'},(cellstr(strcat('s',num2str((8:14)','%02d'))))';
	{'p10'},(cellstr(strcat('s',num2str((16:22)','%02d'))))';
	{'p10'},(cellstr(strcat('s',num2str((25:31)','%02d'))))';

%     {'p11'},(cellstr(strcat('s',num2str((1:7)','%02d'))))'; %week1
%    {'p11'},(cellstr(strcat('s',num2str((9:15)','%02d'))))'; %week3
%    {'p11'},(cellstr(strcat('s',num2str((17:23)','%02d'))))'; %week4

   {'p12'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
   {'p12'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
   {'p12'},(cellstr(strcat('s',num2str((18:24)','%02d'))))';
    {'p12'},(cellstr(strcat('s',num2str((25:30)','%02d'))))';

   {'p14'},(cellstr(strcat('s',num2str((2:9)','%02d'))))';
   {'p14'},(cellstr(strcat('s',num2str((10:12)','%02d'))))';
   {'p14'},(cellstr(strcat('s',num2str((13:20)','%02d'))))';
   {'p14'},(cellstr(strcat('s',num2str((22:28)','%02d'))))';

   {'p15'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
   {'p15'},(cellstr(strcat('s',num2str((9:11)','%02d'))))';
   {'p15'},(cellstr(strcat('s',num2str((12:18)','%02d'))))';
   {'p15'},(cellstr(strcat('s',num2str((21:26)','%02d'))))';

   {'p16'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
   {'p16'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
   {'p16'},(cellstr(strcat('s',num2str((16:23)','%02d'))))';
   {'p16'},(cellstr(strcat('s',num2str((25:29)','%02d'))))';

    {'p17'},(cellstr(strcat('s',num2str((1:5)','%02d'))))';
	{'p17'},(cellstr(strcat('s',num2str((8:9)','%02d'))))';
	{'p17'},(cellstr(strcat('s',num2str((11:15)','%02d'))))';
	{'p17'},(cellstr(strcat('s',num2str((17:24)','%02d'))))';

%     {'p18'},(cellstr(strcat('s',num2str((2:8)','%02d'))))';
%     {'p18'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
% 	{'p18'},(cellstr(strcat('s',num2str((17:21)','%02d'))))';

%     {'p19'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p19'},(cellstr(strcat('s',num2str((9:19)','%02d'))))';

    {'p20'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
	{'p20'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
	{'p20'},(cellstr(strcat('s',num2str((17:23)','%02d'))))';
    {'p20'},(cellstr(strcat('s',num2str((24:30)','%02d'))))';

    {'p21'},(cellstr(strcat('s',num2str((2:7)','%02d'))))';
	{'p21'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
    {'p21'},(cellstr(strcat('s',num2str((16:23)','%02d'))))';
	{'p21'},(cellstr(strcat('s',num2str((25:31)','%02d'))))'; %week4 merged. some day missing.
% % 	{'p21'},(cellstr(strcat('s',num2str((29:31)','%02d'))))'; %week4
% %     {'p22'},(cellstr(strcat('s',num2str((1:6)','%02d'))))';
    {'p23'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
    {'p23'},(cellstr(strcat('s',num2str((9:14)','%02d'))))';
    {'p23'},(cellstr(strcat('s',num2str((15:23)','%02d'))))';
    {'p23'},(cellstr(strcat('s',num2str((24:32)','%02d'))))';

%     {'p24'},(cellstr(strcat('s',num2str((1:3)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((4:8)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((9:13)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((14:21)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((22:29)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((1:43)','%02d'))))';

%     {'p24'},(cellstr(strcat('s',num2str((1:3)','%02d'))))';
    {'p24'},(cellstr(strcat('s',num2str((14:21)','%02d'))))';
    {'p24'},(cellstr(strcat('s',num2str((22:29)','%02d'))))';
    {'p24'},(cellstr(strcat('s',num2str((30:36)','%02d'))))';
    {'p24'},(cellstr(strcat('s',num2str((37:43)','%02d'))))';  %%wk4

    %first try up to P24 to see the learning effect, if there is an effect,
    %then we can include other participants.

    {'p25'},(cellstr(strcat('s',num2str((6:12)','%02d'))))';
    {'p25'},(cellstr(strcat('s',num2str((13:20)','%02d'))))';
    {'p25'},(cellstr(strcat('s',num2str((24:31)','%02d'))))';
    {'p25'},(cellstr(strcat('s',num2str((32:38)','%02d'))))';
%
    {'p26'},(cellstr(strcat('s',num2str((1:9)','%02d'))))';
    {'p26'},(cellstr(strcat('s',num2str((11:19)','%02d'))))';
    {'p26'},(cellstr(strcat('s',num2str((20:26)','%02d'))))';
    {'p26'},(cellstr(strcat('s',num2str((27:34)','%02d'))))';

    {'p27'},(cellstr(strcat('s',num2str((3:11)','%02d'))))';
    {'p27'},(cellstr(strcat('s',num2str((12:16)','%02d'))))';
    {'p27'},(cellstr(strcat('s',num2str((17:24)','%02d'))))';
    {'p27'},(cellstr(strcat('s',num2str((25:32)','%02d'))))';

    {'p28'},(cellstr(strcat('s',num2str((1:9)','%02d'))))';
    {'p28'},(cellstr(strcat('s',num2str((10:20)','%02d'))))';
    {'p28'},(cellstr(strcat('s',num2str((21:29)','%02d'))))';
    {'p28'},(cellstr(strcat('s',num2str((30:37)','%02d'))))';

%     {'p28'},(cellstr(strcat('s',num2str((26:37)','%02d'))))';
%     {'p29'},(cellstr(strcat('s',num2str((1:27)','%02d'))))';
%     {'p30'},(cellstr(strcat('s',num2str((1:21)','%02d'))))';
%     {'p30'},(cellstr(strcat('s',num2str((22:32)','%02d'))))';
% % %     {'p31'},(cellstr(strcat('s',num2str((1:4)','%02d'))))';
% % %     {'p32'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
%     {'p33'},(cellstr(strcat('s',num2str((1:30)','%02d'))))';
%     {'p34'},(cellstr(strcat('s',num2str((1:25)','%02d'))))';
%     {'p34'},(cellstr(strcat('s',num2str((27:34)','%02d'))))';
%     {'p35'},(cellstr(strcat('s',num2str((1:22)','%02d'))))';
%     {'p36'},(cellstr(strcat('s',num2str((1:37)','%02d'))))';
% % %     {'p37'},(cellstr(strcat('s',num2str((1:1)','%02d'))))';
%     {'p38'},(cellstr(strcat('s',num2str((1:32)','%02d'))))';
%     {'p39'},(cellstr(strcat('s',num2str((1:28)','%02d'))))';
%     {'p40'},(cellstr(strcat('s',num2str((1:9)','%02d'))))';
%     {'p40'},(cellstr(strcat('s',num2str((11:22)','%02d'))))';
%     {'p41'},(cellstr(strcat('s',num2str((1:33)','%02d'))))';
%     {'p42'},(cellstr(strcat('s',num2str((1:14)','%02d'))))';
%     {'p44'},(cellstr(strcat('s',num2str((1:9)','%02d'))))';
   };
%}

%{
G.PS_LIST= {
    {'p01'},{'s01','s02','s03','s06','s08','s10','s12','s16','s17','s18'};
    {'p02'},{'s01','s05','s10','s11','s14','s15','s18','s20','s21','s23'};
    {'p04'},{'s04','s06','s07','s10','s11','s12','s14','s18','s19','s21'};
    {'p05'},{'s01','s02','s09','s12','s16','s18','s19','s20','s26','s27'};
    {'p06'},{'s01','s03','s07','s10','s11','s12','s14','s19','s22','s24'};
    {'p08'},{'s02','s03','s09','s11','s13','s15','s16','s17','s18','s26'};
    {'p09'},{'s01','s03','s04','s07','s08','s10','s11','s15','s16','s18'};
    {'p10'},{'s01','s03','s05','s08','s09','s10','s11','s14','s16','s18'};
};
%}

% G.PS_LIST= {
%     {'p03'},{'s18'};
%     {'p06'},{'s01'};
%{
    {'p01'},{'s04','s06','s10','s12','s16','s21'};    {'p03'},{'s18'};    {'p04'},{'s04','s07'};
    {'p06'},{'s01','s03','s13','s16','s19','s20','s22','s31','s32'};
    {'p08'},{'s06','s07','s09','s18'}; {'p09'},{'s10','s12'};{'p12'},{'s02','s07','s10','s15','s20','s22','s24','s25','s27'};
    {'p14'},{'s10','s11','s13','s15','s16','s19','s24','s27'};
    {'p15'},{'s02','s05','s09','s10','s12','s13','s14','s16','s25','s26'};{'p18'},{'s04','s05','s12'};
    {'p19'},{'s01'};
%}
% };
%}
    %% Formatted Raw
    G.RUN.FRMTRAW.SENSORLIST_TOS=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,G.SENSOR.R_ACLXID, G.SENSOR.R_ACLYID, G.SENSOR.R_ACLZID,...
        G.SENSOR.R_BAT_SKN_AMB_ID,G.SENSOR.R_BATID,G.SENSOR.R_SKINID,G.SENSOR.R_AMBID];
    G.RUN.FRMTRAW.SENSORLIST_DB=[G.SENSOR.P_ACLXID, G.SENSOR.P_ACLYID, G.SENSOR.P_ACLZID];
    G.RUN.FRMTRAW.SELFREPORTLIST=[G.SELFREPORT.DRNKID,G.SELFREPORT.SMKID,G.SELFREPORT.CRVID];
    G.RUN.FRMTRAW.SENSORLIST_GPS=[G.SENSOR.P_GPS_LATID, G.SENSOR.P_GPS_LONGID, G.SENSOR.P_GPS_ALTID, G.SENSOR.P_GPS_SPDID, G.SENSOR.P_GPS_BEAR, G.SENSOR.P_GPS_ACCURACYID];

    G.RUN.FRMTRAW.LOADDATA=0;
    G.RUN.FRMTRAW.TOS=1;
    G.RUN.FRMTRAW.PHONESENSOR=1;
    G.RUN.FRMTRAW.GPS=0;
    G.RUN.FRMTRAW.SELFREPORT=1;
    G.RUN.FRMTRAW.LABSTUDYMARK=1;
    G.RUN.FRMTRAW.LABSTUDYLOG=1;
    G.RUN.FRMTRAW.EMA=1;

    %% Formatted Data
    G.RUN.FRMTDATA.SENSORLIST_CORRECTTIMESTAMP=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,G.SENSOR.R_ACLXID, G.SENSOR.R_ACLYID, G.SENSOR.R_ACLZID,...
        G.SENSOR.R_SKINID,G.SENSOR.R_AMBID,G.SENSOR.R_BATID];
    G.RUN.FRMTDATA.SENSORLIST_INTERPOLATE=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_GSRID,G.SENSOR.R_ACLXID, G.SENSOR.R_ACLYID, G.SENSOR.R_ACLZID];
%     G.RUN.FRMTDATA.SENSORLIST_QUALITY=[G.SENSOR.R_RIPID,G.SENSOR.R_ECGID,G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
%     G.RUN.FRMTDATA.SENSORLIST_QUALITY=[G.SENSOR.R_ACLXID,G.SENSOR.R_ACLYID,G.SENSOR.R_ACLZID];
%     G.RUN.FRMTDATA.SENSORLIST_QUALITY=[G.SENSOR.R_RIPID];
    G.RUN.FRMTDATA.SENSORLIST_QUALITY=[G.SENSOR.R_ECGID];

    G.RUN.FRMTDATA.LOADDATA=1;
    G.RUN.FRMTDATA.EMA=0;
    G.RUN.FRMTDATA.CORRECTTIMESTAMP=0;
    G.RUN.FRMTDATA.INTERPOLATE=0;
    G.RUN.FRMTDATA.QUALITY=1;

    G.RUN.BASICFEATURE.LOADDATA=0;
    G.RUN.BASICFEATURE.PEAKVALLEY=1;
    G.RUN.BASICFEATURE.RR=1;

    G.RUN.WINDOW.LOADDATA=0;
    G.RUN.FEATURE.LOADDATA=0;
    G.RUN.MODEL=G.MODEL.STRESS60;

    G.BIAS(G.SENSOR.R_ACLXID)=1865;
    G.BIAS(G.SENSOR.R_ACLYID)=1875;
    G.BIAS(G.SENSOR.R_ACLZID)=1958;

    %{
    G.PS_LIST= {

%Cocaine day
    {'p01'},(cellstr(strcat('s',num2str((1:6)','%02d'))))';
	{'p01'},(cellstr(strcat('s',num2str((8:13)','%02d'))))';
	{'p01'},(cellstr(strcat('s',num2str((15:21)','%02d'))))';
	{'p01'},(cellstr(strcat('s',num2str((23:29)','%02d'))))';
%     {'p02'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p02'},(cellstr(strcat('s',num2str((10:16)','%02d'))))';
% 	{'p02'},(cellstr(strcat('s',num2str((18:26)','%02d'))))';
% 	{'p02'},(cellstr(strcat('s',num2str((28:34)','%02d'))))';
	{'p03'},(cellstr(strcat('s',num2str((2:14)','%02d'))))';
	{'p03'},(cellstr(strcat('s',num2str((17:26)','%02d'))))';
%     {'p04'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
% 	{'p04'},(cellstr(strcat('s',num2str((10:16)','%02d'))))';
% 	{'p04'},(cellstr(strcat('s',num2str((18:23)','%02d'))))';
% 	{'p04'},(cellstr(strcat('s',num2str((25:31)','%02d'))))';
%     {'p05'},(cellstr(strcat('s',num2str((1:6)','%02d'))))';
% 	{'p05'},(cellstr(strcat('s',num2str((9:10)','%02d'))))';
% 	{'p05'},(cellstr(strcat('s',num2str((12:13)','%02d'))))';
% 	{'p05'},(cellstr(strcat('s',num2str((15:21)','%02d'))))';
% 	{'p05'},(cellstr(strcat('s',num2str((23:27)','%02d'))))';
    {'p06'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
	{'p06'},(cellstr(strcat('s',num2str((10:16)','%02d'))))';
	{'p06'},(cellstr(strcat('s',num2str((18:24)','%02d'))))';
	{'p06'},(cellstr(strcat('s',num2str((27:33)','%02d'))))';
%     {'p07'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p07'},(cellstr(strcat('s',num2str((9:11)','%02d'))))';
% 	{'p07'},(cellstr(strcat('s',num2str((14:18)','%02d'))))';
% 	{'p07'},(cellstr(strcat('s',num2str((20:24)','%02d'))))';
%     {'p08'},(cellstr(strcat('s',num2str((2:11)','%02d'))))';
% 	{'p08'},(cellstr(strcat('s',num2str((13:26)','%02d'))))';
    {'p09'},(cellstr(strcat('s',num2str((1:12)','%02d'))))';
	{'p09'},(cellstr(strcat('s',num2str((14:20)','%02d'))))';
	{'p09'},(cellstr(strcat('s',num2str((22:28)','%02d'))))';
% 	{'p10'},(cellstr(strcat('s',num2str((1:5)','%02d'))))';
% 	{'p10'},(cellstr(strcat('s',num2str((8:14)','%02d'))))';
% 	{'p10'},(cellstr(strcat('s',num2str((16:22)','%02d'))))';
% 	{'p10'},(cellstr(strcat('s',num2str((25:31)','%02d'))))';
%    {'p11'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
%    {'p11'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
%    {'p11'},(cellstr(strcat('s',num2str((17:23)','%02d'))))';
   {'p12'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
   {'p12'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
   {'p12'},(cellstr(strcat('s',num2str((18:30)','%02d'))))';
   {'p14'},(cellstr(strcat('s',num2str((2:20)','%02d'))))';
   {'p14'},(cellstr(strcat('s',num2str((22:28)','%02d'))))';
   {'p15'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
   {'p15'},(cellstr(strcat('s',num2str((9:18)','%02d'))))';
   {'p15'},(cellstr(strcat('s',num2str((21:26)','%02d'))))';
%     {'p16'},(cellstr(strcat('s',num2str((1:23)','%02d'))))';
% 	{'p16'},(cellstr(strcat('s',num2str((25:29)','%02d'))))';
%     {'p17'},(cellstr(strcat('s',num2str((1:5)','%02d'))))';
% 	{'p17'},(cellstr(strcat('s',num2str((8:9)','%02d'))))';
% 	{'p17'},(cellstr(strcat('s',num2str((11:15)','%02d'))))';
% 	{'p17'},(cellstr(strcat('s',num2str((17:24)','%02d'))))';
%     {'p18'},(cellstr(strcat('s',num2str((2:15)','%02d'))))';
% 	{'p18'},(cellstr(strcat('s',num2str((17:21)','%02d'))))';
%     {'p19'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p19'},(cellstr(strcat('s',num2str((9:19)','%02d'))))';
%     {'p20'},(cellstr(strcat('s',num2str((1:7)','%02d'))))';
% 	{'p20'},(cellstr(strcat('s',num2str((9:15)','%02d'))))';
% 	{'p20'},(cellstr(strcat('s',num2str((17:30)','%02d'))))';
%     {'p21'},(cellstr(strcat('s',num2str((2:7)','%02d'))))';
% 	{'p21'},(cellstr(strcat('s',num2str((9:23)','%02d'))))';
% 	{'p21'},(cellstr(strcat('s',num2str((25:27)','%02d'))))';
% 	{'p21'},(cellstr(strcat('s',num2str((29:31)','%02d'))))';
% %     {'p22'},(cellstr(strcat('s',num2str((1:6)','%02d'))))';
%     {'p23'},(cellstr(strcat('s',num2str((1:16)','%02d'))))';
%     {'p23'},(cellstr(strcat('s',num2str((17:32)','%02d'))))';
%     {'p24'},(cellstr(strcat('s',num2str((1:43)','%02d'))))';
%     {'p25'},(cellstr(strcat('s',num2str((1:38)','%02d'))))';
%     {'p26'},(cellstr(strcat('s',num2str((1:34)','%02d'))))';
    {'p27'},(cellstr(strcat('s',num2str((1:32)','%02d'))))';
    {'p28'},(cellstr(strcat('s',num2str((1:25)','%02d'))))';
    {'p28'},(cellstr(strcat('s',num2str((26:37)','%02d'))))';
%     {'p29'},(cellstr(strcat('s',num2str((1:27)','%02d'))))';
%     {'p30'},(cellstr(strcat('s',num2str((1:21)','%02d'))))';
%     {'p30'},(cellstr(strcat('s',num2str((22:32)','%02d'))))';
% %     {'p31'},(cellstr(strcat('s',num2str((1:4)','%02d'))))';
% %     {'p32'},(cellstr(strcat('s',num2str((1:8)','%02d'))))';
%     {'p33'},(cellstr(strcat('s',num2str((1:30)','%02d'))))';
    {'p34'},(cellstr(strcat('s',num2str((1:25)','%02d'))))';
    {'p34'},(cellstr(strcat('s',num2str((27:34)','%02d'))))';
%     {'p35'},(cellstr(strcat('s',num2str((1:22)','%02d'))))';
%     {'p36'},(cellstr(strcat('s',num2str((1:37)','%02d'))))';
% %     {'p37'},(cellstr(strcat('s',num2str((1:1)','%02d'))))';
%     {'p38'},(cellstr(strcat('s',num2str((1:32)','%02d'))))';
    {'p39'},(cellstr(strcat('s',num2str((1:28)','%02d'))))';
%     {'p40'},(cellstr(strcat('s',num2str((1:9)','%02d'))))';
%     {'p40'},(cellstr(strcat('s',num2str((11:22)','%02d'))))';
    {'p41'},(cellstr(strcat('s',num2str((1:33)','%02d'))))';
%     {'p42'},(cellstr(strcat('s',num2str((1:14)','%02d'))))';
    {'p44'},(cellstr(strcat('s',num2str((1:9)','%02d'))))';
   };

    %}

end
%{

RUN.FRMTDATA.LOADFRMTDATA=0;
RUN.FRMTDATA.EMA=1;
RUN.FRMTDATA.FORMATSENSOR=[SENSOR.R_RIPID,SENSOR.R_ECGID,SENSOR.R_GSRID,SENSOR.R_ACLXID, SENSOR.R_ACLYID, SENSOR.R_ACLZID, SENSOR.A_ALCID];
RUN.FRMTDATA.RIP=1;RUN.FRMTDATA.ECG=1;RUN.FRMTDATA.ACL=1;
RUN.FRMTDATA.NIDA_PDA_SELFREPORT=1;
RUN.FRMTDATA.JHU_PDA_LABREPORT=0;

RUN.BASICFEATURE.RAW_NORMALIZE=[SENSOR.R_ACLXID, SENSOR.R_ACLYID, SENSOR.R_ACLZID];
RUN.BASICFEATURE.LOADDATA=1;
RUN.BASICFEATURE.RIP=0;
RUN.BASICFEATURE.ECG=0;
RUN.BASICFEATURE.RIPECG=0;
RUN.BASICFEATURE.ACCEL=0;
%}
