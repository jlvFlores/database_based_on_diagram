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
  total_amount DECIMAL(10,2),
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id),
  PRIMARY KEY(id)
);

CREATE TABLE invoices_items (
  id INT,
  unit_price DECIMAL(10,2),
  quantity INT,
  total_price DECIMAL(10,2),
  treatment_id INT REFERENCES treatments(id),
  invoice_id INT REFERENCES invoices(id),
  PRIMARY KEY(id)
);

CREATE TABLE treatments (
  id INT,
  type VARCHAR(50),
  name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories_join_treatments (
  medical_histories_id INT REFERENCES medical_histories(id),
  treatments_id INT REFERENCES treatments(id),
  PRIMARY KEY(medical_histories_id, treatments_id)
);
