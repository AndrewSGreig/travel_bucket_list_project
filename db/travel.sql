DROP TABLE destinations;
DROP TABLE countries;

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name VARCHAR (255) NOT NULL,
  continent VARCHAR(255),
  visited VARCHAR(255)
);

CREATE TABLE destinations(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255)
);
