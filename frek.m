function[frek] = frek(nota,oktav=4)
    
    baseDo = 16.35; %%Do notasının 0. oktavdaki değeri
    
    %%Tüm notalar için aynı işlemi tekrarlamamak için istenilen oktavdaki Do notasının değeri
    oktavDo = baseDo*(2^oktav);
    
    
    %%    Her bir notanın frekansının do notasının frekansına bölümünde notaya has sabit bir oran gelmektedir.
    %%    Bu oranlar notalara göre aşağıda listelenmektedir
        
    %%    Do (1), Re (1,122), Mi (1,259), Fa (1,333), Sol (1,5), La (1,682), Si (1,888)

    oranDo = 1;
    oranRe = 1.122;
    oranMi = 1.259;
    oranFa = 1.333;
    oranSol = 1.5;
    oranLa = 1.682;
    oranSi = 1.888;
    
    switch nota %%Gelen notaya göra işlem yapılıyor
    
        case "Do"
            frek = oktavDo*oranDo;    
        break
        
        case "Re"
            frek = oktavDo*oranRe;
        break
        
        case "Mi"
            frek = oktavDo*oranMi;
        break
        
        case "Fa"
            frek = oktavDo*oranFa;
        break
        
        case "Sol"
            frek = oktavDo*oranSol;
        break
        
        case "La"
            frek = oktavDo*oranLa;
        break
        
        case "Si"
            frek = oktavDo*oranSi;
        break
        
        otherwise
            disp("Notayı yanlış girdiniz")
        break
    end

    