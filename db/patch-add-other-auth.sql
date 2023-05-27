ALTER TABLE monitor
    ADD COLUMN auth_method VARCHAR(250),
    ADD COLUMN auth_domain TEXT,
    ADD COLUMN auth_workstation TEXT;

UPDATE monitor
    SET auth_method = 'basic'
    WHERE basic_auth_user IS NOT NULL;