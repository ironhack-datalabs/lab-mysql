-- Appending data into COURSE entity (course)
INSERT INTO IVAN.course 
(`course_id`, `rating`, `diff`) 
VALUES 
('14', '3', '1'),
('15', '1', '5');

-- Appending registers to proffesor Entity (prof)
INSERT INTO IVAN.prof 
(`prof_id`, `popularity`, `teachingability`) 
VALUES 
('10', '1', '3'),
('11', '5', '5'),
('12', '2', '4'),
('13', '4', '4'),
('14', '3', '3');

-- Appending registers to student entity (student)
INSERT INTO IVAN.student
(`student_id`, `intelligence`, `ranking`) 
VALUES 
('42', '1', '4'),
('43', '2', '4'),
('44', '3', '1'),
('45', '5', '5'),
('46', '1', '1'),
('47', '2', '5'),
('48', '3', '1'),
('49', '2', '2'),
('50', '5', '1'),
('51', '4', '1'),
('52', '5', '1'),
('53', '1', '4'),
('54', '3', '5'),
('55', '5', '5'),
('56', '4', '1'),
('57', '5', '1'),
('58', '5', '2'),
('59', '5', '4'),
('60', '4', '1'),
('61', '3', '5');