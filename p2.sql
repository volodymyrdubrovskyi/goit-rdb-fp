DROP TABLE IF EXISTS entities;
CREATE TABLE entities (
    Entity_id INT PRIMARY KEY AUTO_INCREMENT,
    Entity VARCHAR(45),
    Code VARCHAR(45)
);

INSERT INTO entities (Entity, Code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;

CREATE TABLE cases (
  case_id INT PRIMARY KEY AUTO_INCREMENT,
  Entity_id INT,
  Year int DEFAULT NULL,
  Number_yaws int DEFAULT NULL,
  polio_cases int DEFAULT NULL,
  cases_guinea_worm int DEFAULT NULL,
  Number_rabies float DEFAULT NULL,
  Number_malaria float DEFAULT NULL,
  Number_hiv float DEFAULT NULL,
  Number_tuberculosis float DEFAULT NULL,
  Number_smallpox int DEFAULT NULL,
  Number_cholera_cases int DEFAULT NULL,
  FOREIGN KEY (Entity_id) REFERENCES entities(Entity_id)
);

INSERT INTO cases (Entity_id, Year, Number_yaws, polio_cases, cases_guinea_worm, Number_rabies, 
				   Number_malaria, Number_hiv, Number_tuberculosis, Number_smallpox, Number_cholera_cases)
SELECT e.Entity_id, ic.Year, ic.Number_yaws, ic.polio_cases, ic.cases_guinea_worm, ic.Number_rabies, 
	   ic.Number_malaria, ic.Number_hiv, ic.Number_tuberculosis, ic.Number_smallpox, ic.Number_cholera_cases
FROM infectious_cases AS ic
JOIN entities AS e ON ic.Entity = e.Entity;