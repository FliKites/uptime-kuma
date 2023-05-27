-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
CREATE TABLE incident
(
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    style VARCHAR(30) DEFAULT 'warning' NOT NULL,
    created_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    last_updated_date DATETIME,
    pin BOOLEAN DEFAULT 1 NOT NULL,
    active BOOLEAN DEFAULT 1 NOT NULL,
    PRIMARY KEY (id)
);
