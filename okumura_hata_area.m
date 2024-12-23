% Okumura-Hata Path Loss Model

%% Define the parameters
d = 1:0.01:20; % Jarak antena (1 km hingga 20 km)
hr = 10; % Ketinggian antena receiver (1 m hingga 10 m)
ht = 200; % Ketinggian antena transmitter (30 m hingga 200 m)
fc = 1500; % Frequency (150 MHz hingga 1500 MHz)

%% Urban Large Area
% --- Menghitung Faktor Koreksi Ketinggian Antena ---
ahr_urban = 3.2*(log10(11.75*hr)).^2 - 4.97;

% --- Menghitung Path Loss untuk Daerah Urban Large ---
large_urban = 69.55 + 26.16*log10(fc) + (44.9 - 6.55*log10(ht)) * log10(d) - 13.82*log10(ht) - ahr_urban;

%% Sub-Urban City
% --- Menghitung Faktor Koreksi Ketinggian Antena ---
ahr_suburban = ((1.1 * (log10(fc))) - 0.7)*hr - ((1.56*log10(fc))-0.8);

% --- Menghitung Path Loss untuk Daerah Sub-Urban Medium Size ---
medium_urban = 69.55 + 26.16*log10(fc) + (44.9 - 6.55*log10(ht)) * log10(d) - 13.82*log10(ht) - ahr_suburban;

% --- Menghitung Path Loss untuk Daerah Sub-Urban ---
sub_urban = medium_urban - 2*(log10(fc/28)).^2 - 5.4;

%% Rural Area
% --- Menghitung Path Loss untuk Daerah Rural ---
rural = medium_urban - 4.78*(log10(fc))^2 + 18.733*log10(fc) - 40.98;

%% --- Plot Hasil Perhitungan Loss ---
figure(1);
hold on;
h1 = plot(d, large_urban, 'r-V', 'MarkerIndices', 1:50:length(d), 'LineWidth', 1.5); % Large Urban (merah)
h2 = plot(d, sub_urban, 'g-X', 'MarkerIndices', 1:50:length(d), 'LineWidth', 1.5); % Sub Urban (hijau)
h3 = plot(d, rural, 'b-O', 'MarkerIndices', 1:50:length(d), 'LineWidth', 1.5); % Rural (biru)
grid on;

title('Pengaruh Path Loss Berdasarkan Karakteristik Wilayah')
xlabel('d [km]');
ylabel('L [dB]');

legend([h1, h2, h3], {'Urban Large', 'Sub Urban', 'Rural'}, 'Location', 'southeast');