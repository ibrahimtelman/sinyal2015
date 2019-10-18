function[frek] = frek(nota,oktav)
    

    if nargin < 2 
        oktav = 4; 
    end
    
    notalar = {'Do','Dod','Re','Mib','Mi','Fa','Fad','Sol','Sold','La','Sib','Si','Sus'};
    
    frek = 0;
    
    index = find(ismember(notalar,nota)); 
    
    if index~=13 
        base = 440; 
        frek=base*2^((index-10)/12 + (oktav-4));
    end
end
    
