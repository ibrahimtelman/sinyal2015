%% Matlab ile Sentezleme
% Matlab ile,
% nota frekanslarýnýn ve sinyallerinin iþlenerek ses oluþturulmasý.
%% Dosya Aç/Kapa Ýþlemleri
fid = fopen('notalar.txt','r');

[B] = textscan(fid, '%s%s%s',...
    'Delimiter',',','EmptyValue',-Inf);

fclose(fid);
%% Sentez Deðiþkenlerinin Oluþturulmasý
%Örnekleme frekansý
fs = 11025;
%Duraklama
duraklama = zeros(1,round(fs*0.01));

%oktav degeri
oktavDegeri = 0;

nota = B{1};
oktav = zeros(length(nota),1);
vurus = zeros(length(nota),1);

notalar = [];
%% Notalar deðiþkeninin oluþturulmasý
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
% Notalar frekansýnýn, sinüs deðerlerine harmonik ve 
% eko eklendiðinde oluþan zamana baðlý grafik

%%
sound(notalar,fs)
