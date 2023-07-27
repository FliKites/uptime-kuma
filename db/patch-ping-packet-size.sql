-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.

ALTER TABLE monitor
    ADD COLUMN packet_size INT DEFAULT 56 NOT NULL;
