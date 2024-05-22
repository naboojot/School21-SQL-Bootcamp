SELECT p1.name AS person_name_1, p2.name AS person_name_2, p1.address AS common_address
FROM person p1,
     person p2
WHERE p1.address = p2.address
  AND p1.id > p2.id
ORDER BY person_name_1, person_name_2, common_address;