function state = gaplot(options, state, flag)
% GAPLOT Plots the logarithmic change in the best score from the previous generation.

% Best score in the previous generation
persistent last_best 

if(strcmp(flag,'init'))
    xlim([1,options.MaxGenerations]);
    a = gca;
    a.YScale = 'log';
    hold on;
    xlabel Generation
    title('Log Absolute Change in Best Fitness Value')
end

best = min(state.Score); % Best score in the current generation
if state.Generation == 0 % Set last_best to best.
    last_best = best;
else
	change = last_best - best; % Change in best score 
	last_best = best;
    if change > 0 % Plot only when the fitness improves
        plot(state.Generation,change,'xr');
    end
end