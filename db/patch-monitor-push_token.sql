-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD COLUMN push_token VARCHAR(20) DEFAULT NULL;
