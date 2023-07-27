-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.

ALTER TABLE user
ADD COLUMN twofa_last_token VARCHAR(6);

