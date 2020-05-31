clear all;

load('skok_u1.mat')
load('skok_u2.mat')
load('odp_u3.mat')
load('odp_u4.mat')

S= {s11,s21,s31, s41;
    s12,s22,s32, s42;
    s13,s23,s33, s43;};

Yzad = zeros(400,3);
Yzad(1:100,1) = 20;
Yzad(101:200,1) = 10;
Yzad(201:300,1) = 15;
Yzad(301:400,1) = 0;

Yzad(1:100,2) = 50;
Yzad(101:200,2) = 10;
Yzad(201:300,2) = -20;
Yzad(301:400,2) = 40;

Yzad(1:100,3) = 10;
Yzad(101:200,3) = 70;
Yzad(201:300,3) = -50;
Yzad(301:400,3) = 0;

sim_time = length(Yzad);

% Presets serve a purpose of tuning
           %N %Nu %lambda
presets = [[195,195,1];
           [195,100,1]];
       
for prst = 1:size(presets,1)
    clearvars -except sim_time Yzad S presets prst
    
    nu=4;
    ny=3;
    
    N = presets(prst,1);
    Nu = presets(prst,2);
    lambda = presets(prst,3);
    
    dmc = DMC(195, N, Nu, lambda, S);
    
    err = zeros(ny,1);

    u1 = zeros(sim_time, 1);
    u2 = zeros(sim_time, 1);
    u3 = zeros(sim_time, 1);
    u4 = zeros(sim_time, 1);
    
    y1 = zeros(sim_time, 1);
    y2 = zeros(sim_time, 1);
    y3 = zeros(sim_time, 1);
    
    u = [0; 0; 0; 0];
    for k = 5:sim_time
        
        [y1(k), y2(k), y3(k)] = symulacja_obiektu6 ...
                                (u1(k-1),u1(k-2),u1(k-3),u1(k-4), ...
                                u2(k-1), u2(k-2),u2(k-3),u2(k-4), ...
                                u3(k-1),u3(k-2), u3(k-3),u3(k-4), ...
                                u4(k-1),u4(k-2),u4(k-3), u4(k-4), ...
                                y1(k-1),y1(k-2),y1(k-3),y1(k-4), ...
                                y2(k-1),y2(k-2),y2(k-3),y2(k-4), ...
                                y3(k-1),y3(k-2),y3(k-3),y3(k-4));
                            
        y = [y1(k), y2(k), y3(k)];
        [u, e] = dmc.eval_controls(y,  u, Yzad(k,:));
        
        u1(k) = u(1);
        u2(k) = u(2);
        u3(k) = u(3);
        u4(k) = u(4);
        
        err = err + e;
        
    end
    
    str = sprintf('N = %d, Nu = %d, lmd = %d :',N,Nu, lambda);
    disp(str)
    disp(err/k) %mean squared error
    
    i = 1;
    figure(1)
    hold on;
    for yi = [y1,y2,y3]
        plot(yi);  plot(Yzad(:,i));
        i = i + 1;
    end
    hold off;
    
    figure(2)
    for ui = [u1,u2,u3,u4]
        plot(ui);
    end
 
end


