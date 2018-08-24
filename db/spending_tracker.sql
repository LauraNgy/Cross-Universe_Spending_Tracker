DROP TABLE accounts;
DROP TABLE transactons;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);
