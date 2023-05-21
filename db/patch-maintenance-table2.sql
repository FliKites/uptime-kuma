-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
DROP TABLE IF EXISTS maintenance_status_page;
DROP TABLE IF EXISTS monitor_maintenance;
DROP TABLE IF EXISTS maintenance;
DROP TABLE IF EXISTS maintenance_timeslot;

CREATE TABLE maintenance (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    user_id INT,
    active BOOLEAN NOT NULL DEFAULT 1,
    strategy VARCHAR(50) NOT NULL DEFAULT 'single',
    start_date DATETIME,
    end_date DATETIME,
    start_time TIME,
    end_time TIME,
    weekdays VARCHAR(250) DEFAULT '[]',
    days_of_month TEXT,
    interval_day INT,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE INDEX manual_active ON maintenance(strategy, active);
CREATE INDEX active ON maintenance(active);
CREATE INDEX maintenance_user_id ON maintenance(user_id);

CREATE TABLE maintenance_status_page (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    status_page_id INT NOT NULL,
    maintenance_id INT NOT NULL,
    FOREIGN KEY (maintenance_id) REFERENCES maintenance (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (status_page_id) REFERENCES status_page (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX status_page_id_index ON maintenance_status_page(status_page_id);
CREATE INDEX maintenance_id_index ON maintenance_status_page(maintenance_id);

CREATE TABLE maintenance_timeslot (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    maintenance_id INT NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME,
    generated_next BOOLEAN DEFAULT 0,
    FOREIGN KEY (maintenance_id) REFERENCES maintenance(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX maintenance_id_index3 ON maintenance_timeslot (maintenance_id DESC);
CREATE INDEX active_timeslot_index ON maintenance_timeslot (maintenance_id DESC, start_date DESC, end_date DESC);
CREATE INDEX generated_next_index ON maintenance_timeslot (generated_next);

CREATE TABLE monitor_maintenance (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    monitor_id INT NOT NULL,
    maintenance_id INT NOT NULL,
    FOREIGN KEY (maintenance_id) REFERENCES maintenance (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (monitor_id) REFERENCES monitor (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX maintenance_id_index2 ON monitor_maintenance(maintenance_id);
CREATE INDEX monitor_id_index ON monitor_maintenance(monitor_id);
