-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE user ADD COLUMN twofa_secret VARCHAR(64);
ALTER TABLE user ADD COLUMN twofa_status BOOLEAN DEFAULT 0 NOT NULL;