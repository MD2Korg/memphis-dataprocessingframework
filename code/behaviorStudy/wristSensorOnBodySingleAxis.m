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

R_hillol=load('D:\People\Hillol\WristSensorOnBodyRecognition\TableTop\p05_s01_frmtraw.mat');
% R_hillol=load('D:\People\Hillol\WristSensorOnBodyRecognition\TableTop\p05_s02_frmtraw.mat');

wrist_x.timestamp=R_hillol.R.sensor{26}.timestamp(3000:end-3000);
wrist_x.sample=R_hillol.R.sensor{26}.sample(3000:end-3000);

wrist_y.timestamp=R_hillol.R.sensor{27}.timestamp(3000:end-3000);
wrist_y.sample=R_hillol.R.sensor{27}.sample(3000:end-3000);

wrist_z.timestamp=R_hillol.R.sensor{28}.timestamp(3000:end-3000);
wrist_z.sample=R_hillol.R.sensor{28}.sample(3000:end-3000);

%consider three second window, take 30 samples
% assuming that sampling frequecy is 10.33 Hz
% varianceOfMagnitude=[];
var_x=[];
var_y=[];
var_z=[];
% minLength=0;
% if length(wrist_y.sample)<=length(wrist_x.sample) && length(wrist_y.sample)<=length(wrist_z.sample)
%     minLength=length(wrist_y.sample);
% end
% if length(wrist_x.sample)<=length(wrist_y.sample) && length(wrist_x.sample)<=length(wrist_z.sample)
%     minLength=length(wrist_x.sample);
% end
% if length(wrist_z.sample)<=length(wrist_x.sample) && length(wrist_z.sample)<=length(wrist_y.sample)
%     minLength=length(wrist_z.sample);
% end

for i=1:30:length(wrist_x.sample)-30
    i
    x=wrist_x.sample(i:i+30);
    x=x-mean(x);
    var_x=[var_x;std(x)];
end

for i=1:30:length(wrist_y.sample)-30
    i
    y=wrist_y.sample(i:i+30);
    y=y-mean(y);
    var_y=[var_y;std(y)];
end

for i=1:30:length(wrist_z.sample)-30
    i
    z=wrist_z.sample(i:i+30);
    z=z-mean(z);
    var_z=[var_z;std(z)];
end

figure;hist(var_x);title('Variance(X)');
figure;hist(var_y);title('Variance(Y)');
figure;hist(var_z);title('Variance(Z)');

%data from real participants
load('D:\People\Hillol\WristSensorOnBodyRecognition\RealData\p11_s01_frmtraw.mat');
wrist_x_field.timestamp=R.sensor{26}.timestamp(3000:end-3000);
wrist_x_field.sample=R.sensor{26}.sample(3000:end-3000);

wrist_y_field.timestamp=R.sensor{27}.timestamp(3000:end-3000);
wrist_y_field.sample=R.sensor{27}.sample(3000:end-3000);

wrist_z_field.timestamp=R.sensor{28}.timestamp(3000:end-3000);
wrist_z_field.sample=R.sensor{28}.sample(3000:end-3000);

%consider three second window, take 30 samples
% assuming that sampling frequecy is 10.33 Hz
var_x_field=[];
var_y_field=[];
var_z_field=[];


for i=1:30:length(wrist_x_field.sample)-30
    i
    x=wrist_x_field.sample(i:i+30);
    x=x-mean(x);
    var_x_field=[var_x_field;std(x)];
end

for i=1:30:length(wrist_y_field.sample)-30
    i
    y=wrist_y_field.sample(i:i+30);
    y=y-mean(y);
    var_y_field=[var_y_field;std(y)];
end

for i=1:30:length(wrist_z_field.sample)-30
    i
    z=wrist_z_field.sample(i:i+30);
    z=z-mean(z);
    var_z_field=[var_z_field;std(z)];
end

figure;hist(var_x_field,1000);title('Variance(X_field)');
figure;hist(var_y_field,1000);title('Variance(Y_field)');
figure;hist(var_z_field,1000);title('Variance(Z_field)');
