R0 = 5e3;                % 5 km zasięg
rainrate = [1 4 20];     % siła opadu w mm/h
el = 0;                  % 0 stopni wznoszenia
tau = 0;                 % polaryzacja horyzontalna

for m = 1:numel(rainrate)
    rainloss_itu(:,m) = rainpl(R0,freq,rainrate(m),el,tau)';
    rainloss_crane(:,m) = cranerainpl(R0,freq,rainrate(m),el,tau)';
end
loglog(freq/1e9,rainloss_itu);
hold on;
set(gca,'ColorOrderIndex',1); % reset color index for better comparison
loglog(freq/1e9,rainloss_crane,'--');
hold off;
grid on;
legend('Słaby deszcz (ITU)','Średni deszcz (ITU)','Mocny deszcz (ITU)',...
    'Słaby deszcz (Crane)','Średni deszcz (Crane)','Mocny deszcz (Crane)', ...
    'Location','SouthEast');
xlabel('Częstotliwość (GHz)');
ylabel('Tłumienie na dystansie 5 km (dB)')
title('Tłumienie deszczu dla zadanej polaryzacji');