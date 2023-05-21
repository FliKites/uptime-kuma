-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD method VARCHAR(255) DEFAULT 'GET' NOT NULL,
    ADD body TEXT,
    ADD headers TEXT;
