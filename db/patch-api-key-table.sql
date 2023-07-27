-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
CREATE TABLE api_key (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `key` VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    active BOOLEAN DEFAULT 1 NOT NULL,
    expires DATETIME DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE
);
