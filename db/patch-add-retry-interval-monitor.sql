-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD COLUMN retry_interval INTEGER DEFAULT 0 NOT NULL;