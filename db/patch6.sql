-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
SET FOREIGN_KEY_CHECKS = 0;

START TRANSACTION;

CREATE TABLE IF NOT EXISTS monitor_dg_tmp (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150),
    active TINYINT(1) DEFAULT 1 NOT NULL,
    user_id INT,
    `interval` INT DEFAULT 20 NOT NULL,
    url TEXT,
    type VARCHAR(20),
    weight INT DEFAULT 2000,
    hostname VARCHAR(255),
    port INT,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    keyword VARCHAR(255),
    maxretries INT NOT NULL DEFAULT 0,
    ignore_tls TINYINT(1) DEFAULT 0 NOT NULL,
    upside_down TINYINT(1) DEFAULT 0 NOT NULL,
    maxredirects INT DEFAULT 10 NOT NULL,
    -- accepted_statuscodes_json TEXT DEFAULT '["200-299"]' NOT NULL
    accepted_statuscodes_json TEXT
);

INSERT INTO monitor_dg_tmp (
    id,
    name,
    active,
    user_id,
    `interval`,
    url,
    type,
    weight,
    hostname,
    port,
    created_date,
    keyword,
    maxretries,
    ignore_tls,
    upside_down
)
SELECT
    id,
    name,
    active,
    user_id,
    `interval`,
    url,
    type,
    weight,
    hostname,
    port,
    created_date,
    keyword,
    maxretries,
    ignore_tls,
    upside_down
FROM
    monitor;

DROP TABLE monitor;

ALTER TABLE monitor_dg_tmp RENAME TO monitor;

CREATE INDEX user_id ON monitor (user_id);

COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
