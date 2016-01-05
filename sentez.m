%% Matlab ile Sentezleme
% Matlab ile,
% nota frekanslar�n�n ve sinyallerinin i�lenerek ses olu�turulmas�.
%% Dosya A�/Kapa ��lemleri
fid = fopen('notalar.txt','r');

[B] = textscan(fid, '%s%s%s',...
    'Delimiter',',','EmptyValue',-Inf);

fclose(fid);
%% Sentez De�i�kenlerinin Olu�turulmas�
%�rnekleme frekans�
fs = 11025;
%Duraklama
duraklama = zeros(1,round(fs*0.01));

%oktav degeri
oktavDegeri = 0;

nota = B{1};
oktav = zeros(length(nota),1);
vurus = zeros(length(nota),1);

notalar = [];
%% Notalar de�i�keninin olu�turulmas�
for i=1:length(nota)
    
    %Dosyada okunmus degerler sayiya donusturuluyor
    oktav(i) = str2num(B{2}{i});
    vurus(i) = str2num(B{3}{i});
   
    oktav(i) = oktav(i)+oktavDegeri;
    
    frekans = frek(nota(i),oktav(i));
   
    [xx,tt] = note(frekans,vurus(i));
    
    notalar = [notalar xx duraklama];
    
end
%% Echo Ekleme Islemi
%echo gecikme 
gecikme = round(fs*0.1);

for z=1:length(notalar(1,end))
    
    notalar(1,z+gecikme) = notalar(1,z+gecikme) + 0.3*notalar(1,z);
end
%% Normalizasyon Islemi
%notalardaki en yuksek deger
M = max(notalar);

notalar = notalar / M;

%%
plot(notalar)
%%
% Notalar frekans�n�n, sin�s de�erlerine harmonik ve 
% eko eklendi�inde olu�an zamana ba�l� grafik

%%
sound(notalar,fs)
