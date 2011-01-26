function idx_aday = filtre_area(area, idx_aday, dbg)
% function idx_aday = filtre_area(area, idx_aday, dbg)
% 
% Usage
%   idx_aday = filtre_area(area, idx_aday, true);

f_area = area(idx_aday{1});
idx = find(f_area > 400);
idx_aday{1} = idx_aday{1}(idx);