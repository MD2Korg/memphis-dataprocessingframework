function [x,t,means,stds] = local_winsorize(x,t,winsize)
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
NORMALIZATION.BETA = 3;
NORMALIZATION.TRIM = 0;
    startT=t(1);
    total=size(t);
    if NORMALIZATION.TRIM
        newt = [];
        newx = [];
    end
    if nargout > 2
        means = [];
        stds = [];
    end

    while startT<t(end)
        endT=startT+winsize;% in millisecs
        indT=find(t>=startT & t<endT);
        samples=x(indT);
        times = t(indT);

%        mean = nanmean(samples)
%        std = sqrt(nanvar(samples))
        med = nanmedian(samples);

        mad = nanmedian(abs(samples-med));
        low = med-NORMALIZATION.BETA*mad;
        high = med+NORMALIZATION.BETA*mad;
%        pause

        if NORMALIZATION.TRIM
            times = times(samples<=high & samples >= low);
            samples = samples(samples<=high & samples >= low);
        else
            samples(samples>high) = high;
            samples(samples<low) = low;
        end

 %       length(samples)
 %       samples
        mean = nanmean(samples);
        std = sqrt(nanvar(samples));

        samples = (samples-mean)/std;
%        pause


        if nargout > 2
            means(end+1,1:3) = [mean,startT,endT];
            stds(end+1,1:3) = [std,startT,endT];
        end
        if NORMALIZATION.TRIM
            newx = [newx;samples];
        else
            x(indT) = samples;
        end

        if nargout > 1 && NORMALIZATION.TRIM
            newt = [newt;times];
        end

        if indT(end)+1>total
            break;
        end
        startT=t(indT(end)+1);
    end
    if NORMALIZATION.TRIM
        x = newx;
    end
    if nargout > 1 && NORMALIZATION.TRIM
        t = newt;
    end
end
