ALTER TABLE monitor
    ADD COLUMN radius_username VARCHAR(255),
    ADD COLUMN radius_password VARCHAR(255),
    ADD COLUMN radius_calling_station_id VARCHAR(50),
    ADD COLUMN radius_called_station_id VARCHAR(50),
    ADD COLUMN radius_secret VARCHAR(255);