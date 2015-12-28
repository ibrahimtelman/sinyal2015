function[frek] = frek(nota,oktav)
    

    if nargin < 2  % eger oktav belirtilmemisse,
        oktav = 4; % 4.oktav kabul ediliyor.
    end
    
    notalar = {'Do','Dod','Re','Mib','Mi','Fa','Fad','Sol','Sold','La','Sib','Si','Sus'};
    
    frek = 0; %Sus geldi�i zaman geri d�nmesi i�in
    
    index = find(ismember(notalar,nota)); %%istenilen notan�n dizideki yeri bulunuyor
    
    if index~=13 %%Sus geldiyse hesaplanmayacak
        base = 440; %%La notas�n�n 4. oktavdaki de�eri
        frek=base*2^((index-10)/12 + (oktav-4));
    end
end
    