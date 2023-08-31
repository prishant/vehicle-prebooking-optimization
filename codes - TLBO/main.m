clc;
clear all;close all;
%rng(1,'twister') % For reproducibility
T = 50;
fun = @myFunction; % objective function handle
[N,M,st,en,D,Dk,locx,locy,x1,x2,y1,y2,dur] = data;
lb = [st' repelem([1],N)]; % Lower bound
ub = [repelem([24],N) repelem([M],N)]; % Upper bound

intcon=1:2*N;
[bestsol,bestfitness,BestFitIter,P,f] = TLBO(fun,lb,ub,14,T);

bestsol,bestfitness
%x,fval,exitflag,output,population,scores
fprintf("The highest profit made by all the rides is : %d\n",-bestfitness);
x=bestsol;

figure,
title('Best Fitness value')
xlabel('Iterations')
ylabel('Fitness')
plot(1:T+1,BestFitIter)

% Plotting figure for assignment of cars to rides
figure,
Cs = strcat('C',string(1:1:N));
hold on;
Col = {'#0072BD','#D95319','#EDB120','#77AC30','#76BC60','#4DBEEE',...
    '#A2142F','#0062AD','#B93319','#CAB120','#87EC30','#77AC30',...
    '#4DBEEE','#A21C2F'};
for i=1:N
    plot(x(i):x(i)+dur(i,x(N+i)),((N+1)-i)*ones(1,dur(i,x(N+i))+1 ),'LineWidth',12);
    text(x(i)+dur(i,x(N+i))/2,((N+1)-i),Cs(x(N+i)),'FontSize', 8);
end
label=strcat('R',string(N:-1:1));;
t = strtrim(sprintf('%s\n', label{:}));
py = gca(); 
py.YTick = 1:N; 
py.YLim =  [0 N+1];
py.YTickLabel = t;   
xticks(0:1:30)
grid
title('TIME ALLOTMENT OF CARS IN TIME')
xlabel('Time')
ylabel('CARS')
hold off

