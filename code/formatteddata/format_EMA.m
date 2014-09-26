function ema=format_EMA(data)
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

[row,col]=size(data);
a=[1,2,4,8,16,32,64,128,256,512,1024,2048];
ema=[];

for r=1:row
    questions=1;
    ema(r).triggertype=str2num(char(data(r,2)));
    ema(r).context=str2num(char(data(r,3)));
    ema(r).status=str2num(char(data(r,4)));
    ema(r).prompttimestamp=str2num(char(data(r,5)));
    ema(r).delayduration=str2num(char(data(r,6)));
    ema(r).starttimesstamp=str2num(char(data(r,7)));

    if isempty(char(data(r,8)))==1
        ema(r).delayresponse(1)=-1;
    else
        ema(r).delayresponse(1)=str2num(char(data(r,8)));
    end
    ema(r).delaytimestamp(1)=str2num(char(data(r,9)));
    if isempty(char(data(r,10)))==1
        ema(r).delayresponse(2)=-1;
    else
        ema(r).delayresponse(2)=str2num(char(data(r,10)));
    end
    ema(r).delaytimestamp(2)=str2num(char(data(r,11)));
    for c=14:2:col
        ema(r).question(questions).timestamp=str2num(char(data(r,c+1)));
        ema(r).question(questions).response=[];
        if ~isempty(str2num(char(data(r,c))))
            val=str2num(char(data(r,c)));
            for i=1:length(a)
                if val>=a(i)
                    if bitand(a(i),val)
                        %line=[line ',' num2str(i)];
                        ema(r).question(questions).response=[ema(r).question(questions).response i];
                    end
                end
            end
        else
            ema(r).question(questions).response=[ema(r).question(questions).response char(data(r,c))];
        end
        questions=questions+1;
    end
end
end
