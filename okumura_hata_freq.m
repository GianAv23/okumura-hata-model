% Sub-Urban | Okumura-Hata Path Loss Model

%% Define the parameters
d = 1:0.01:20; % Jarak antena (1 km hingga 20 km)
hr = 5; % Ketinggian antena receiver (1 m hingga 10 m)
ht = 100; % Ketinggian antena transmitter (30 m hingga 200 m)
fc1 = 1250; % Frequency (150 MHz hingga 1500 MHz)
fc2 = 550;
fc3 = 250;

%% Sub-Urban City
% --- Menghitung Faktor Koreksi Ketinggian Antena ---
ahr_sub1 = ((1.1 * (log10(fc1))) - 0.7)*hr - ((1.56*log10(fc1))-0.8);
ahr_sub2 = ((1.1 * (log10(fc2))) - 0.7)*hr - ((1.56*log10(fc2))-0.8);
ahr_sub3 = ((1.1 * (log10(fc3))) - 0.7)*hr - ((1.56*log10(fc2))-0.8);

% --- Menghitung Path Loss untuk Daerah Sub-Urban Medium Size ---
medium_urban1 = 69.55 + 26.16*log10(fc1) + (44.9 - 6.55*log10(ht)) * log10(d) - 13.82*log10(ht) - ahr_sub1;
medium_urban2 = 69.55 + 26.16*log10(fc2) + (44.9 - 6.55*log10(ht)) * log10(d) - 13.82*log10(ht) - ahr_sub2;
medium_urban3 = 69.55 + 26.16*log10(fc3) + (44.9 - 6.55*log10(ht)) * log10(d) - 13.82*log10(ht) - ahr_sub3;

% --- Menghitung Path Loss untuk Daerah Sub-Urban ---
sub_urban1 = medium_urban1 - 2*(log10(fc1/28)).^2 - 5.4;
sub_urban2 = medium_urban2 - 2*(log10(fc2/28)).^2 - 5.4;
sub_urban3 = medium_urban3 - 2*(log10(fc3/28)).^2 - 5.4;

%% --- Plot Hasil Perhitungan Loss
figure(1);
hold on;
f1 = plot(d, sub_urban1, 'r-V', 'MarkerIndices', 1:50:length(d), 'LineWidth', 1.5);
f2 = plot(d, sub_urban2, 'g-X', 'MarkerIndices', 1:50:length(d), 'LineWidth', 1.5);
f3 = plot(d, sub_urban3, 'b-O', 'MarkerIndices', 1:50:length(d), 'LineWidth', 1.5);
grid on;

title('Pengaruh Path Loss Berdasarkan Frequency di Wilayah Sub Urban')
xlabel('d [km]');
ylabel('L [dB]');