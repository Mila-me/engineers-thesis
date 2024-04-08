freq = (1:20)*1e9;
R0 = 5e3;               % 5 km dystansu
snowrate = [0.1 1.5 4]; % odpowiednik opadu deszczu mm/h

for m = 1:numel(snowrate)
snowloss(:,m) = snowpl(R0,freq,snowrate(m));
end
loglog(freq/1e9,snowloss);
grid on;
legend('Lekki śnieg','Średni śnieg','Mocny śnieg', ...
'Location','SouthEast');
xlabel('Częstotliwość (GHz)');
ylabel('Tłumienie na dystansie 5 km (dB)')
title('Tłumienie śniegu');
