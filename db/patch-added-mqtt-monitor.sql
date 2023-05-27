-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
ALTER TABLE monitor
    ADD COLUMN mqtt_topic TEXT,
    ADD COLUMN mqtt_success_message VARCHAR(255),
    ADD COLUMN mqtt_username VARCHAR(255),
    ADD COLUMN mqtt_password VARCHAR(255);
