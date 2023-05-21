-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
START TRANSACTION;

CREATE TABLE status_page (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    icon VARCHAR(255) NOT NULL,
    theme VARCHAR(30) NOT NULL,
    published TINYINT(1) NOT NULL DEFAULT 1,
    search_engine_index TINYINT(1) NOT NULL DEFAULT 1,
    show_tags TINYINT(1) NOT NULL DEFAULT 0,
    password VARCHAR(255),
    created_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CREATE UNIQUE INDEX slug ON status_page (slug);

CREATE TABLE status_page_cname (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    status_page_id INT NOT NULL,
    domain VARCHAR(255) NOT NULL UNIQUE,
    FOREIGN KEY (status_page_id) REFERENCES status_page (id) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE incident ADD status_page_id INT;
ALTER TABLE `group` ADD status_page_id INT;

COMMIT;
