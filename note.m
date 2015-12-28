function [xx,tt] = note(frek,dur)
    
    %% "fs" periyot başına istenilen örnek sayısı

    fs=8192;
    
    T = 1/fs;
    
    tt = 0:T:(dur-T); %% Zaman 
    
    %%zarf için hazırlıklar
    elemanS = length(tt); %% Eleman sayısı
    
    attack = linspace(0,1.5,(elemanS*2/8));
    
    decay = linspace(1.5-(0.5/(elemanS/8)),1,(elemanS/8));
    
    sustain = ones(1,(elemanS/2));
    
    relase = linspace(1-(1/(elemanS/8)),0,(elemanS/8));
    
    zarf = [attack, decay, sustain, relase];

     h_k = [1, 0.8, 0.4, 0.1];

     xx = zeros(1,elemanS);

     
     for i=1:length(h_k)
        x = h_k(i).*zarf .* sin(2*pi*frek*tt);

        xx = xx + x;

        i = i+1;
        
     end

    