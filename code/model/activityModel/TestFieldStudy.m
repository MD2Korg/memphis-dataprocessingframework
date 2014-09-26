%function TestFieldStudy()
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

file='si4day1_test';
TestJ48(file);
TestAdaboost(file);
TestSVM(file);
[b1,c1,res1]=Results('si4day1_test_output_ADA');
[b2,c2,res2]=Results('si4day1_test_output_J48');
[b3,c3,res3]=Results('si4day1_test_output_SMO');

%sget_weka_results('si4day1_test_output_ADA.txt');
