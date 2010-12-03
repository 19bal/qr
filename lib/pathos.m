function p = pathos(pnm)

fr = '\';
to = filesep;

if to == '\'
	fr = '/'
end

p = strrep(pnm, fr, to);
