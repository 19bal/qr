function idx_aday = filtre_orientation(orientation, dbg);
% function idx_aday = filtre_orientation(orientation, dbg);
% 
% Usage
%   idx_aday = filtre_orientation(orientation, true)

sz = length(orientation);

for i=1:sz
    or1 = orientation(i);
    
    for j=1:sz  
        if i ~= j
            or2 = orientation(j);
            
            fark(j) = abs(or1 - or2);
            if fark(j) < 80     % FIXME:
                fark(j) = Inf;
            end
        else
            fark(j) = Inf;
        end
    end
    adaylar = abs(fark - round(fark / 90) * 90);
    
    if dbg,
        [(1:sz)' fark' adaylar']
    end
    
    idx_aday{i} = find(adaylar < 1);
end