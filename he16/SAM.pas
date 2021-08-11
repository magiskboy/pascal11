VAR s:TEXT;
    ch: CHAR;
BEGIN
    assign(s,'C:\FPC\2.6.4\units\i386-win32\a52\a52.0');
    reset(s);
    WHILE NOT eof(s) DO
    BEGIN
        read(s,ch);
        write(ch);
    END;
    readln;
END.