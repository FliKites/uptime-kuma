-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD COLUMN expiry_notification BOOLEAN DEFAULT 1;
