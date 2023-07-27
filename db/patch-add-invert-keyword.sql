-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD COLUMN invert_keyword BOOLEAN default 0 not null;
