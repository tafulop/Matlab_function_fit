% variables
k = 5;
intervals = 10;
power = 2;

% interval
i_min = 0;
i_max = 1;
density = 0.0001;

% -------------------------------
% Create original funciton 
% -------------------------------

    % preload values into a vector
    x = i_min:density:i_max;

    % store function generated values
    y = exp(k*(x - i_max));

% -------------------------------
% create fitting curve polinoms
% -------------------------------

    increment = length(x) / intervals;
    polynoms = zeros(intervals, power + 1);
    
    for i = 0 : intervals - 1
        
        % get the required interval
        i_start = floor(increment * i) + 1;
        i_stop = floor(increment * (i + 1));
        
        % create temporary function
        temp_x = x(i_start:i_stop);
        temp_y = exp(k*(temp_x - i_max));
        
        % create fitting curve for the generated function
        polynoms(i+1,:) = polyfit(temp_x, temp_y, 2);
 
    end
    

% -------------------------------------
% plot original
% -------------------------------------
    figure
    plot(x,y,'linewidth',2);
    title(['Exponencialis fuggveny K = ', num2str(k), ' sulytenyezovel'])

    % figure title
    set(gcf,'name','Exponential function','numbertitle','off')

% -------------------------------------
% plot fitting curve
% -------------------------------------
    
    figure
    % figure title
    set(gcf,'name','Fitting curve','numbertitle','off')

    increment = length(x) / intervals;
    
    for i = 0 : intervals - 1
        
        % get the required interval
        i_start = floor(increment * i) + 1;
        i_stop = floor(increment * (i + 1));
        
        % create temporary function
        temp_x = x(i_start:i_stop);
        
        % plot
        y_fit = polynoms(i+1,1) * temp_x.^2 + polynoms(i+1,2) * temp_x + polynoms(i+1,3);
        plot(temp_x, y_fit, 'red','linewidth',2);
        hold on
  
    end
     
    title(['Kozelites n = ', num2str(intervals), ' darab masodfoku fuggvennyel'])
