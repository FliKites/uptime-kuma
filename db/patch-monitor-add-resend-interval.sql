-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD resend_interval INT DEFAULT 0 NOT NULL;

ALTER TABLE heartbeat
    ADD down_count INT DEFAULT 0 NOT NULL;
