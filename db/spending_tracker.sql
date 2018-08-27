DROP TABLE transactons;
DROP TABLE accounts;
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

CREATE TABLE accounts (
  id SERIAL4 PRIMARY KEY,
  currency VARCHAR(255),
  budget NUMERIC(12, 2)
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  amount NUMERIC(12, 2),
  merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
  description VARCHAR(255),
  account_id INT4 REFERENCES accounts(id) ON DELETE CASCADE,
  transaction_date DATE
);
