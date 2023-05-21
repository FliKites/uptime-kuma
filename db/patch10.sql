-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
CREATE TABLE IF NOT EXISTS tag (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS monitor_tag (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    monitor_id INT NOT NULL,
    tag_id INT NOT NULL,
    value TEXT,
    CONSTRAINT FK_tag FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_monitor FOREIGN KEY (monitor_id) REFERENCES monitor(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX monitor_tag_monitor_id_index ON monitor_tag (monitor_id);
CREATE INDEX monitor_tag_tag_id_index ON monitor_tag (tag_id);
