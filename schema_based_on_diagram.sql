CREATE TABLE patients (
  id INT,
  name VARCHAR(100),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories (
  id INT,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(50),
  PRIMARY KEY(id)
);

CREATE TABLE invoices (
  id INT,
  total_amount DECIMAL(6,2),
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id),
  PRIMARY KEY(id)
);