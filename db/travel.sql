DROP TABLE destinations;
DROP TABLE countries;

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name VARCHAR (255) NOT NULL,
  continent VARCHAR(255),
  visited BOOLEAN
);

CREATE TABLE destinations(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  country_id INT REFERENCES countries(id) ON DELETE CASCADE,
  type VARCHAR(255),
  visited BOOLEAN
);
