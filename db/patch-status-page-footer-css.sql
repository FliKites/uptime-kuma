-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
START TRANSACTION;

ALTER TABLE status_page
    ADD footer_text TEXT,
    ADD custom_css TEXT,
    ADD show_powered_by TINYINT(1) NOT NULL DEFAULT 1;

COMMIT;
