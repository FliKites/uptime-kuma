-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.

CREATE TABLE notification_sent_history (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type VARCHAR(50) NOT NULL,
    monitor_id INT NOT NULL,
    days INT NOT NULL,
    UNIQUE(type, monitor_id, days)
);

CREATE INDEX good_index ON notification_sent_history (
    type,
    monitor_id,
    days
);

