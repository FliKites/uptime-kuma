-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD basic_auth_user TEXT;

ALTER TABLE monitor
    ADD basic_auth_pass TEXT;
