-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
	ADD COLUMN json_path TEXT;

ALTER TABLE monitor
	ADD COLUMN expected_value VARCHAR(255);
