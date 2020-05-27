%% Odp skokowa - u1

sim_len = 200;

u1 = zeros(sim_len, 1);
u1(5:end) = 1;
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

t = (0:sim_len-5)';
figure;
subplot(2, 1, 1);
plot(t, y1(5:end), 'r'); hold on;
plot(t, y2(5:end), 'k');
plot(t, y3(5:end), 'k');
subplot(2, 1, 2);
plot(t, u1(5:end), 'r'); hold on;
plot(t, u2(5:end), 'k');
plot(t, u3(5:end), 'k');
plot(t, u4(5:end), 'k');



s11 = y1(6:end);
s12 = y2(6:end);
s13 = y3(6:end);

save('skok_u1.mat', 's11', 's12', 's13')



%% Odp skokowa - u2
sim_len = 200;

u1 = zeros(sim_len, 1);
u2 = zeros(sim_len, 1);
u2(5:end) = 1;
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

t = (0:sim_len-5)';
figure;
subplot(2, 1, 1);
plot(t, y1(5:end), 'r'); hold on;
plot(t, y2(5:end), 'k');
plot(t, y3(5:end), 'k');
subplot(2, 1, 2);
plot(t, u1(5:end), 'k'); hold on;
plot(t, u2(5:end), 'r');
plot(t, u3(5:end), 'k');
plot(t, u4(5:end), 'k');

s21 = y1(6:end);
s22 = y2(6:end);
s23 = y3(6:end);

save('skok_u2', 's21', 's22', 's23');

%% Odp skokowa - u3

sim_len = 200;

u1 = zeros(sim_len, 1);
u2 = zeros(sim_len, 1);
u3 = zeros(sim_len, 1);
u3(5:end) = 1;
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

t = (0:sim_len-5)';
figure;
subplot(2, 1, 1);
plot(t, y1(5:end), 'r'); hold on;
plot(t, y2(5:end), 'k');
plot(t, y3(5:end), 'k');
subplot(2, 1, 2);
plot(t, u1(5:end), 'k'); hold on;
plot(t, u2(5:end), 'k');
plot(t, u3(5:end), 'r');
plot(t, u4(5:end), 'k');


s31 = y1(6:end); 
s32 = y2(6:end);
s33 = y3(6:end);

save('odp_u3', 's31', 's32', 's33');

%% Odp skokowa - u4

sim_len = 200;

u1 = zeros(sim_len, 1);
u2 = zeros(sim_len, 1);
u3 = zeros(sim_len, 1);
u4 = zeros(sim_len, 1);
u4(5:end) = 1;

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

t = (0:sim_len-5)';
figure;
subplot(2, 1, 1);
plot(t, y1(5:end), 'r'); hold on;
plot(t, y2(5:end), 'k');
plot(t, y3(5:end), 'k');
subplot(2, 1, 2);
plot(t, u1(5:end), 'k'); hold on;
plot(t, u2(5:end), 'k');
plot(t, u3(5:end), 'k');
plot(t, u4(5:end), 'r');

s41 = y1(6:end);
s42 = y2(6:end);
s43 = y3(6:end);

save('odp_u4', 's41', 's42', 's43');


%% Zapisz odp skokowe do wykresow

t = (0:length(s11)-1)';
S11 = table(t, s11);
writetable(S11, 'dane_wykresy/S11.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S12 = table(t, s12);
writetable(S12, 'dane_wykresy/S12.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S13 = table(t, s13);
writetable(S13, 'dane_wykresy/S13.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S21 = table(t, s21);
writetable(S21, 'dane_wykresy/S21.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S22 = table(t, s22);
writetable(S22, 'dane_wykresy/S22.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S23 = table(t, s23);
writetable(S23, 'dane_wykresy/S23.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S31 = table(t, s31);
writetable(S31, 'dane_wykresy/S31.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S32 = table(t, s32);
writetable(S32, 'dane_wykresy/S32.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S33 = table(t, s33);
writetable(S33, 'dane_wykresy/S33.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S41 = table(t, s41);
writetable(S41, 'dane_wykresy/S41.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S42 = table(t, s42);
writetable(S42, 'dane_wykresy/S42.txt', 'Delimiter', ' ', 'WriteVariableName', false);
S43 = table(t, s43);
writetable(S43, 'dane_wykresy/S43.txt', 'Delimiter', ' ', 'WriteVariableName', false);


