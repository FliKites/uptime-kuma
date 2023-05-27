-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
DROP TABLE IF EXISTS maintenance_timeslot;

ALTER TABLE maintenance 
ADD COLUMN cron TEXT,
ADD COLUMN timezone VARCHAR(255),
ADD COLUMN duration INTEGER;
