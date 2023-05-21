-- You should not modify if this have pushed to Github, unless it does serious wrong with the db.
CREATE TABLE docker_host (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
	docker_daemon VARCHAR(255),
	docker_type VARCHAR(255),
	name VARCHAR(255)
);

ALTER TABLE monitor
	ADD COLUMN docker_host INT,
	ADD FOREIGN KEY (docker_host) REFERENCES docker_host(id);

ALTER TABLE monitor
	ADD COLUMN docker_container VARCHAR(255);

