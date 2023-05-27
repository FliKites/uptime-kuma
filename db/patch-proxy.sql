-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
START TRANSACTION;

CREATE TABLE proxy (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    protocol VARCHAR(10) NOT NULL,
    host VARCHAR(255) NOT NULL,
    port SMALLINT NOT NULL,
    auth TINYINT(1) NOT NULL,
    username VARCHAR(255) NULL,
    password VARCHAR(255) NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    `default` TINYINT(1) NOT NULL DEFAULT 0,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

ALTER TABLE monitor ADD COLUMN proxy_id INT, ADD CONSTRAINT fk_proxy FOREIGN KEY (proxy_id) REFERENCES proxy(id);

CREATE INDEX proxy_id ON monitor (proxy_id);
CREATE INDEX proxy_user_id ON proxy (user_id);

COMMIT;
