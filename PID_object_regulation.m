clear all

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

u1 = zeros(sim_time, 1);
u2 = zeros(sim_time, 1);
u3 = zeros(sim_time, 1);
u4 = zeros(sim_time, 1);

y1 = zeros(sim_time, 1);
y2 = zeros(sim_time, 1);
y3 = zeros(sim_time, 1);

pid1 = PID(0.5, 0.1, 0.1, 0.1);
pid2 = PID(0.5, 0.1, 0.1, 0.1);
pid3 = PID(0.5, 0.1, 0.1, 0.1);

err = zeros(3,1);

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
hold on
for ui = [u1,u2,u3,u4]
    plot(ui); 
end
hold off