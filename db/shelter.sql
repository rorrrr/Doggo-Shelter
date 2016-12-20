DROP TABLE adoptions;
DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  contact_number VARCHAR(255),
  ideal_type VARCHAR(255)
);

CREATE TABLE animals
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255),
  breed VARCHAR(255),
  bio VARCHAR(255),
  rating INT8,
  image VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL8 primary key,
  owner_id INT8 references owners(id) ON DELETE CASCADE,
  animal_id INT8 references animals(id) ON DELETE CASCADE
);