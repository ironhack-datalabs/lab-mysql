/* Basic information of the database */
/* # Number of registers, once edited */
USE IVAN;
SELECT COUNT(*) FROM student;
-- >58
SELECT COUNT(*) FROM prof;
-- >11
SELECT COUNT(*) FROM RA;
-- >25
SELECT COUNT(*) FROM course;
-- >12
SELECT COUNT(*) FROM registration;
-- >92

/* Students with more than 2 of intelligence ordered by ranking in ascending mode */
USE IVAN;
SELECT * 
FROM student
WHERE intelligence>2
ORDER BY ranking ASC;

/* Teachers ordered by popularity in descending mode 
Analysis of their popularity and teaching ability */
USE IVAN;
CREATE TEMPORARY TABLE IF NOT EXISTS prof_cool
SELECT * 
,CASE /* Here we create a new attribute to measure the teacher coolness*/
	WHEN popularity>3 THEN 'NICE'
    WHEN popularity<=3 AND popularity >1 THEN 'MEH'
    WHEN popularity<=1 THEN 'BUH!'
    ELSE 'NOT KNOWN'
END 'coolness'
FROM prof
ORDER BY teachingability DESC;
SELECT *
FROM prof_cool;

/* Relations between teachers and RA Entities
We are going to do an INNER JOIN to obtain the relation
between teachers, their teaching ability and salary for
those who have salary values NOT NULL ordered by salary
in ascending mode and then by teaching ability by ASC mode*/
USE IVAN;
CREATE TEMPORARY TABLE IF NOT EXISTS prof_ra
SELECT pc.prof_id,pc.popularity,pc.teachingability,pc.coolness,ra.salary
FROM prof_cool as pc INNER JOIN RA as ra
ON pc.prof_id=ra.prof_id;
SELECT prof_id,popularity,teachingability,coolness,salary
FROM prof_ra
ORDER BY teachingability ASC;

/* Relations between student, registration and course ENTITIES */
USE IVAN;
CREATE TEMPORARY TABLE IF NOT EXISTS rg_co
SELECT rg.course_id,rg.student_id,rg.grade,rg.sat,cs.diff
FROM registration as rg RIGHT JOIN course as cs
ON rg.course_id=cs.course_id;
CREATE TEMPORARY TABLE IF NOT EXISTS st_rg
SELECT st.student_id,rg.course_id,rg.grade,rg.sat
FROM student as st LEFT JOIN registration as rg
ON rg.student_id=st.student_id;

/*How many students did not give their oppinion? */
USE IVAN;
SELECT COUNT(*)
FROM st_rg
WHERE st_rg.course_id IS NULL;
-- > 20 Students

/* Average grade and difficulty by course ordered by av difficulty */ 
USE IVAN;
SELECT course_id,AVG(grade) as avgrade,
AVG(diff) as difficulty, COUNT(course_id) as num_votes
FROM rg_co
GROUP BY course_id
ORDER BY difficulty DESC;