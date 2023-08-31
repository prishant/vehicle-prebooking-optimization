function state = ganewfun(options,state,flag)
% Best score in the previous generation
persistent best 

if(strcmp(flag,'init'))
    xlim([1,options.MaxGenerations]);
    a = gca;
    hold on;
    xlabel Generation
    title('Best Fitness Value')
end

best = min(state.Score); % Best score in the current generation
if state.Generation == 0 % Set best to high value.
    best = 10^10;
else
    plot(state.Generation,best,'xr');
end