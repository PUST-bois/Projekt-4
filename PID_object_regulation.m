err = zeros(ny,1);

u1 = zeros(sim_time, 1);
u2 = zeros(sim_time, 1);
u3 = zeros(sim_time, 1);
u4 = zeros(sim_time, 1);

y1 = zeros(sim_time, 1);
y2 = zeros(sim_time, 1);
y3 = zeros(sim_time, 1);

pid1 = PID(0.5, 10, 0.1, 0.1);
pid2 = PID(0.5, 10, 0.1, 0.1);
pid3 = PID(0.5, 10, 0.1, 0.1);

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
    
    [u1(k), e(1)] = pid1.eval_controls(y1(k),  u1(k-1), Yzad(k,1));
    [u2(k), e(2)] = pid2.eval_controls(y2(k),  u2(k-1), Yzad(k,2));
    [u3(k), e(3)] = pid3.eval_controls(y3(k),  u3(k-1), Yzad(k,3));
    
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