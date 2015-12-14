function [xx,tt] = note(frek,exmp,dur)
    
    %% "exmp" periyot başına istenilen örnek sayısı

    tt = 0:1/(exmp*frek):dur %% Zaman 
    
    xx = sin(2*pi*frek*tt); %% sinüs değerleri
