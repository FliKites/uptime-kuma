-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD http_body_encoding VARCHAR(25);

UPDATE monitor 
    SET http_body_encoding = 'json' 
    WHERE (type = 'http' or type = 'keyword') AND http_body_encoding IS NULL;
