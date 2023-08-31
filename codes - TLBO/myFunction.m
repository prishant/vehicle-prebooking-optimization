function c = myFunction(d1)
    [N,M,~,en,D,Dk,locx,locy,x1,x2,y1,y2,dur] = data;
    c = 0;% Net profit/fitness value
    d=d1';
    e = d;
    
    [~ , I] = sort(e(1 : N));% sorting the start time values
    
    %I=round(I);
    for i = 1:N
        I(i)
        Dk(I(i)) = abs(x1(I(i)) - locx(d(N + I(i)))) + abs(y1 ...
            (I(i)) - locy(d(N + I(i))));% excess distace to go before next ride
        D(I(i)) = abs(x2(I(i)) - x1(I(i))) + abs(y2(I(i)) - y1(I(i)));% distance of the ride
        % saving last ride's final coordinates
        locx(d(N + I(i))) = x2(I(i));
        locy(d(N + I(i))) = y2(I(i));
        
        
        if(d(I(i)) + dur(I(i) , d(N + I(i))) < en(I(i)))
            c = c + D(I(i)) * 10 - Dk(I(i)) + 20;% bonus = 20
        end
        if(d(I(i)) + dur(I(i) , d(N + I(i))) == en(I(i)))
            c = c + D(I(i)) * 10 - Dk(I(i));
        end
        if(d(I(i)) + dur(I(i) , d(N + I(i))) > en(I(i)))
            c = c + D(I(i)) * 10 - Dk(I(i)) - 100 * (d(I(i)) + dur(I(i) , d(N + I(i))) ...
                - en(I(i)));% penalty = 100 * extra time taken
        end
        
    end
    
 % Checking for overlap of times for more than one rides on one car
 busytime = zeros(M);
 for i = 1 : N
     if(busytime(d(N + I(i))) > d(I(i)))
         c = c - 10000;% taking high penalty of 1000
     end
     busytime(d(N + I(i))) = d(I(i)) + dur(I(i) , d(N + I(i)));
 end
 c=-c;
end