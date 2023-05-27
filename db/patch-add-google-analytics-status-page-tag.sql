-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE status_page
	ADD COLUMN google_analytics_tag_id VARCHAR(255);
