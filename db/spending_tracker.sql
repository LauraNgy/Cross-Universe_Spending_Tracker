DROP TABLE accounts;
DROP TABLE transactons;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4,
  amount NUMERIC(12, 2),
  merchant_id INT4 REFERENCES merchants(id),
  tag_id INT4 REFERENCES tags(id),
  description VARCHAR(255),
  currency VARCHAR(255) PRIMARY KEY,
  transaction_date DATE
);

CREATE TABLE accounts (
  id SERIAL4 PRIMARY KEY,
  holder VARCHAR(255),
  currency_type VARCHAR(255) REFERENCES transactions(currency),
  budget NUMERIC(12, 2),
  balance NUMERIC(12, 2)
);
