-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
START TRANSACTION;

ALTER TABLE notification
    ADD is_default TINYINT(1) DEFAULT 0 NOT NULL;

COMMIT;
