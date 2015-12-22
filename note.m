function [xx,tt] = note(frek,dur,fs=8192)
    
    %% "fs" periyot başına istenilen örnek sayısı

    tt = 0:1/fs:(dur-1/fs); %% Zaman 
    
    %%zarf için hazırlıklar
    elemanS = length(tt); %% Eleman sayısı
    
    attack = linspace(0,1.5,(elemanS*2/8));
    
    decay = linspace(1.5-(0.5/(elemanS/8)),1,(elemanS/8));
    
    sustain = ones(1,(elemanS/2));
    
    relase = linspace(1-(1/(elemanS/8)),0,(elemanS/8));
    
    zarf = [attack, decay, sustain, relase];

    xx = zarf .* sin(2*pi*frek*tt + zarf); %% zarflı sinüs değerleri

    