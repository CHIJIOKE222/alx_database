-- a script that creates the database hbtn_0d_usa and the table cities
CREATE DATABASE IF NOT EXISTS hbtn_0d_usa;
CREATE TABLE IF NOT EXISTS hbtn_0d_usa.cities (
	id INT UNIQUE AUTO_INCREMENT PRIMARY KEY NOT NULL,
	state_id INT,
	name VARCHAR(256) NOT NULL,
	FOREIGN KEY (state_id) REFERENCES states (id)
	);