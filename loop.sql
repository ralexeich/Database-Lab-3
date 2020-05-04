DECLARE 
    test_values INT NOT NULL DEFAULT 1; 
BEGIN
    FOR i IN 1..test_values LOOP
      INSERT INTO track(track_name,artist,track_duration)
            VALUES ('Mile High' ,'James Blake', 146);
      INSERT INTO track(track_name,artist,track_duration)
            VALUES ('Vanish' ,'Nicolas Jaar', 172);      
    END LOOP;
END;

