SELECT CONCAT(name, '(age:', age, ',gender:', gender, ',address:', address, ')') as information_about_persons
FROM person
ORDER BY information_about_persons;