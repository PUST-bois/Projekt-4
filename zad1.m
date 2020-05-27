%% Poprawność punktu pracy
u1_pp = 0;
u2_pp = 0;
u3_pp = 0; 
u4_pp = 0;

sim_len = 200;

u1 = zeros(sim_len, 1);
u2 = zeros(sim_len, 1);
u3 = zeros(sim_len, 1);
u4 = zeros(sim_len, 1);

y1 = zeros(sim_len, 1);
y2 = zeros(sim_len, 1);
y3 = zeros(sim_len, 1);

for k=5:sim_len
    [y1(k), y2(k), y3(k)] = symulacja_obiektu6 ...
    (u1(k-1),u1(k-2),u1(k-3),u1(k-4), u2(k-1), ...
     u2(k-2),u2(k-3),u2(k-4), u3(k-1),u3(k-2), ...
     u3(k-3),u3(k-4), u4(k-1),u4(k-2),u4(k-3), ...
     u4(k-4),y1(k-1),y1(k-2),y1(k-3),y1(k-4), ...
     y2(k-1),y2(k-2),y2(k-3),y2(k-4), ...
     y3(k-1),y3(k-2),y3(k-3),y3(k-4));
 
 
end

figure;
t = (0:1:sim_len-1)';
plot(t, y1);
hold on;
plot(t, y2);
plot(t, y3);
hold off
title("Punkt pracy")
legend('y1', 'y2', 'y3');