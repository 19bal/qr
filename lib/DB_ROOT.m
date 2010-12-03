function dbnm = DB_ROOT(LIB_PATH)

t = textread(strcat(LIB_PATH,'.dbroot'), '%s');
dbnm = char(t(1));
