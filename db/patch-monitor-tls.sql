-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.

ALTER TABLE monitor
    ADD COLUMN tls_ca TEXT,
    ADD COLUMN tls_cert TEXT,
    ADD COLUMN tls_key TEXT;
