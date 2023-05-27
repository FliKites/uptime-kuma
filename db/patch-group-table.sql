-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
CREATE TABLE `group`
(
    id           INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(255) NOT NULL,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    public       BOOLEAN DEFAULT 0 NOT NULL,
    active       BOOLEAN DEFAULT 1 NOT NULL,
    weight       INT NOT NULL DEFAULT 1000
);

CREATE TABLE monitor_group
(
    id         INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    monitor_id INT NOT NULL,
    group_id   INT NOT NULL,
    weight     INT NOT NULL DEFAULT 1000,
    FOREIGN KEY (monitor_id) REFERENCES monitor (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (group_id) REFERENCES `group` (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX fk
    ON monitor_group (monitor_id, group_id);
