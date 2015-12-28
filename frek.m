function[frek] = frek(nota,oktav)
    

    if nargin < 2  % eger oktav belirtilmemisse,
        oktav = 4; % 4.oktav kabul ediliyor.
    end
    
    notalar = {'Do','Dod','Re','Mib','Mi','Fa','Fad','Sol','Sold','La','Sib','Si','Sus'};
    
    frek = 0; %Sus geldiði zaman geri dönmesi için
    
    index = find(ismember(notalar,nota)); %%istenilen notanýn dizideki yeri bulunuyor
    
    if index~=13 %%Sus geldiyse hesaplanmayacak
        base = 440; %%La notasýnýn 4. oktavdaki deðeri
        frek=base*2^((index-10)/12 + (oktav-4));
    end
end
    