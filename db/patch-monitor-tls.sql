-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
START TRANSACTION;

ALTER TABLE monitor
    ADD tls_ca TEXT,
    ADD tls_cert TEXT,
    ADD tls_key TEXT;

COMMIT;
