-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor_group
    ADD COLUMN send_url BOOLEAN DEFAULT 0 NOT NULL;