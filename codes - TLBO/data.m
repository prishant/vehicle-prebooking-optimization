function [N,M,st,en,D,Dk,locx,locy,x1,x2,y1,y2,dur] = data
%{
% Example data 1
N=4;% No of prebooked rides
M=3;% No of cars

st = [2;12;5;12];%start time for each ride
en = [10;20;12;15];% end time for each ride

D = [0;0;0;0];% Initialization for distance for each ride
Dk = [0 ; 0 ; 0 ; 0];% Initialization for excess distance to be covered in starting for ride

locx = [0;0;0;0];% Initialization of X coordinate of the car after completion of each ride
locy = [0;0;0;0];% Initialization of Y coordinate of the car after completion of each ride

velocity = [0.5 1 1];% Velocity of each car
velocity = repmat(velocity,N,1);

x1 = [0 ; 1 ; 0 ; 0];% X coordinates of the start of each ride
x2 =[2;2;1;1];% X coordinates of the end of each ride
y1 = [1;4;0;1];% Y coordinates of the start of each ride
y2 = [3;0;2;0];% Y coordinates of the end of each ride

Di = abs(x2 - x1) + abs(y2 - y1);% distance for each ride
Di=repmat(Di,1,M);

dur = Di./velocity;% time taken by each car for rides
%}

%
% Example data 2
N=7;% No of prebooked rides
M=5;% No of cars

st = [1;2;5;4;10;13;17];%start time for each ride
en = [5;5;9;12;14;18;22];% end time for each ride

D = [0;0;0;0;0;0;0];% Initialization for distance for each ride
Dk= [0;0;0;0;0;0;0];% Initialization for excess distance to be covered in starting for ride

locx = [0;0;0;0;0;0;0];% Initialization of X coordinate of the car after completion of each ride
locy = [0;0;0;0;0;0;0];% Initialization of Y coordinate of the car after completion of each ride

velocity = [1 .5 1 1 .2];% Velocity of each car
velocity = repmat(velocity,N,1);

x1 = [0;3;0;2;1;3;1];% X coordinates of the start of each ride
x2 =[2;4;1;0;3;1;3];% X coordinates of the end of each ride
y1 = [4;1;0;4;1;2;3];% Y coordinates of the start of each ride
y2 = [3;0;2;0;2;4;4];% Y coordinates of the end of each ride

Di = abs(x2 - x1) + abs(y2 - y1);% distance for each ride
Di=repmat(Di,1,M);

dur = Di./velocity;% time taken by each car for rides
%
end