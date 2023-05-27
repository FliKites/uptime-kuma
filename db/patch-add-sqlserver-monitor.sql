ALTER TABLE monitor
    ADD COLUMN database_connection_string VARCHAR(2000),
    ADD COLUMN database_query TEXT;