%% Self Report information
function SELFREPORT=config_selfreport()
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

SELFREPORT.DRNKID=1; SELFREPORT.ID(SELFREPORT.DRNKID).NAME='drinking';    SELFREPORT.ID(SELFREPORT.DRNKID).DB_TABLE='model21';
SELFREPORT.SMKID=2;  SELFREPORT.ID(SELFREPORT.SMKID).NAME='smoking';      SELFREPORT.ID(SELFREPORT.SMKID).DB_TABLE='model22';
SELFREPORT.CRVID=3;  SELFREPORT.ID(SELFREPORT.CRVID).NAME='craving';      SELFREPORT.ID(SELFREPORT.CRVID).DB_TABLE='model23';
end
