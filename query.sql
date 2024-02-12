CREATE DATABASE Human_friends;
USE Human_friends;
CREATE TABLE animal_classes
(
	id INT AUTO_INCREMENT PRIMARY KEY, 
	class_name VARCHAR(20)
);

INSERT INTO animal_classes (class_name)
VALUES ('Вьючные'),
       ('Домашние');  


CREATE TABLE packed_animals
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    class_type VARCHAR (20),
    class_id INT,
    FOREIGN KEY (Class_id) REFERENCES animal_classes (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO packed_animals (class_type, class_id)
VALUES ('Лошади', 1),
       ('Ослы', 1),  
       ('Верблюды', 1); 
    
CREATE TABLE home_animals
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    class_type VARCHAR (20),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES animal_classes (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO home_animals (class_type, class_id)
VALUES ('Кошки', 2),
('Собаки', 2),  
('Хомяки', 2); 

CREATE TABLE cats 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    class_type_id int,
    Foreign KEY (class_type_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO cats (nameme, birthday, commands, class_type_id)
VALUES ('Барсик', '2020-01-01', 'кс-кс-кс', 1),
       ('Коксик', '2020-01-01', "брысь", 1),  
       ('Рыжик', '2020-01-01', "ну ка", 1); 

CREATE TABLE dogs 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    class_type_id int,
    Foreign KEY (class_type_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO dogs (name, birthday, commands, class_type_id)
VALUES ('Маршал', '2020-01-01', 'ко мне', 2),
       ('Граф', '2020-01-01', "дай лапу", 2),  
       ('Шарик', '2020-01-01', "сидеть", 2), 
       ('Эйн', '2020-01-01', "лежать", 2);

CREATE TABLE hamsters 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    class_type_id int,
    Foreign KEY (class_type_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO hamsters (name, birthday, commands, class_type_id)
VALUES ('Малой', '2020-10-12', '', 3),
('Медведь', '2021-03-12', "атака сверху", 3),  
('Ниндзя', '2022-07-11', NULL, 3), 
('Бурый', '2022-05-10', NULL, 3);

CREATE TABLE horses 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    class_type_id int,
    Foreign KEY (class_type_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO horses (name, birthday, commands, class_type_id)
VALUES ('Гром', '2020-01-01', 'бегом', 1),
       ('Закат', '2020-01-01', "шагом", 1),  
       ('Байкал', '2020-01-01', "хоп", 1), 
       ('Молния', '2020-01-01', "брр", 1);

CREATE TABLE donkeys 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    class_type_id int,
    Foreign KEY (class_type_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO donkeys (name, birthday, commands, class_type_id)
VALUES ('Ишак', '2020-01-01', "", 2),
       ('Скакун', '2020-01-01', "", 2),  
       ('Благородный', '2020-01-01', "", 2), 
       ('Золотое копытце', '2020-01-01', "", 2);

CREATE TABLE camels 
(       
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    class_type_id int,
    Foreign KEY (class_type_id) REFERENCES home_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO camels (name, birthday, commands, class_type_id)
VALUES ('Скакун персидский', '2020-01-01', 'бегом', 3),
       ('Скакун арабский', '2020-01-01', "шагом", 3),  
       ('Скакун египетский', '2020-01-01', "хоп", 3), 
       ('Скакун сахарский', '2020-01-01', "брр", 3);

DELETE FROM camels;

SELECT name, birthday, commands FROM horses
UNION SELECT  name, birthday, commands FROM donkeys;

CREATE TEMPORARY TABLE animals AS 
SELECT *, 'Лошади' as genus FROM horses
UNION SELECT *, 'Ослы' AS genus FROM donkeys
UNION SELECT *, 'Собаки' AS genus FROM dogs
UNION SELECT *, 'Кошки' AS genus FROM cats
UNION SELECT *, 'Хомяки' AS genus FROM hamsters;

CREATE TABLE yung_animal AS
SELECT name, birthday, commands, genus, TIMESTAMPDIFF(MONTH, birthday, CURDATE()) AS age_in_month
FROM animals WHERE birthday BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
 
SELECT * FROM yung_animal;

SELECT h.name, h.birthday, h.commands, pa.class_type_id, ya.age_in_month 
FROM horses h
LEFT JOIN yung_animal ya ON ya.name = h.name
LEFT JOIN packed_animals pa ON pa.id = h.class_type_id
UNION 
SELECT d.name, d.birthday, d.commands, pa.class_type_id, ya.Age_in_month 
FROM donkeys d 
LEFT JOIN yung_animal ya ON ya.name = d.name
LEFT JOIN packed_animals pa ON pa.id = d.class_type_id
UNION
SELECT c.name, c.birthday, c.commands, ha.class_type_id, ya.Age_in_month 
FROM cats c
LEFT JOIN yung_animal ya ON ya.name = c.name
LEFT JOIN home_animals ha ON ha.id = c.class_type_id
UNION
SELECT d.name, d.birthday, d.commands, ha.class_type_id, ya.Age_in_month 
FROM dogs d
LEFT JOIN yung_animal ya ON ya.name = d.name
LEFT JOIN home_animals ha ON ha.id = d.class_type_id
UNION
SELECT hm.name, hm.birthday, hm.commands, ha.class_type_id, ya.Age_in_month 
FROM hamsters hm
LEFT JOIN yung_animal ya ON ya.name = hm.name
LEFT JOIN home_animals ha ON ha.id = hm.class_type_id;