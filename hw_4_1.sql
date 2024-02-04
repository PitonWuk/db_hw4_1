--Завдання
--1. Виведіть усі можливі пари рядків викладачів і груп.
SELECT Teachers.Name AS TeacherName, Teachers.Surname AS TeacherSurname, Groups.Name AS GroupName
FROM Teachers
CROSS JOIN Groups;

--2. Виведіть назви факультетів, фонд фінансування кафедр яких перевищує фонд фінансування факультету.
SELECT DISTINCT F1.Name AS FacultyName
FROM Faculties F1
INNER JOIN Departments D1 ON F1.Id = D1.FacultyId
WHERE D1.Financing > F1.Financing;

--3. Виведіть прізвища кураторів груп і назви груп, які вони курирують.
SELECT C.Surname AS CuratorSurname, G.Name AS GroupName
FROM Curators C
INNER JOIN GroupsCurators GC ON C.Id = GC.CuratorId
INNER JOIN Groups G ON GC.GroupId = G.Id;

--4. Виведіть імена та прізвища викладачів, які читають лекціїу групі «P107».
SELECT DISTINCT T.Name AS TeacherName, T.Surname AS TeacherSurname
FROM Teachers T
INNER JOIN Lectures L ON T.Id = L.TeacherId
INNER JOIN GroupsLectures GL ON L.Id = GL.LectureId
INNER JOIN Groups G ON GL.GroupId = G.Id
WHERE G.Name = 'P107';

--5. Виведіть прізвища викладачів і назви факультетів, на яких вони читають лекції.
SELECT DISTINCT T.Surname AS TeacherSurname, F.Name AS FacultyName
FROM Teachers T
INNER JOIN Lectures L ON T.Id = L.TeacherId
INNER JOIN GroupsLectures GL ON L.Id = GL.LectureId
INNER JOIN Groups G ON GL.GroupId = G.Id
INNER JOIN Departments D ON G.DepartmentId = D.Id
INNER JOIN Faculties F ON D.FacultyId = F.Id;

--6. Виведіть назви кафедр і назви груп, які до них належать.
SELECT D.Name AS DepartmentName, G.Name AS GroupName
FROM Departments D
INNER JOIN Groups G ON D.Id = G.DepartmentId;

--7. Виведіть назви предметів, які викладає викладач «Samantha Adams».
SELECT DISTINCT S.Name AS SubjectName
FROM Subjects S
INNER JOIN Lectures L ON S.Id = L.SubjectId
INNER JOIN Teachers T ON L.TeacherId = T.Id
WHERE T.Name = 'Samantha' AND T.Surname = 'Adams';

--8. Виведіть назви кафедр, на яких викладається дисципліна «Database Theory».
SELECT DISTINCT D.Name AS DepartmentName
FROM Departments D
INNER JOIN Groups G ON D.Id = G.DepartmentId
INNER JOIN GroupsLectures GL ON G.Id = GL.GroupId
INNER JOIN Lectures L ON GL.LectureId = L.Id
INNER JOIN Subjects S ON L.SubjectId = S.Id
WHERE S.Name = 'Database Theory';

--9. Виведіть назви груп, що належать до факультету «Computer Science».
SELECT G.Name AS GroupName
FROM Groups G
INNER JOIN Departments D ON G.DepartmentId = D.Id
INNER JOIN Faculties F ON D.FacultyId = F.Id
WHERE F.Name = 'Computer Science';

--10. Виведіть назви груп 5-го курсу, а також назви факультетів, до яких вони належать.
SELECT G.Name AS GroupName, F.Name AS FacultyName
FROM Groups G
INNER JOIN Departments D ON G.DepartmentId = D.Id
INNER JOIN Faculties F ON D.FacultyId = F.Id
WHERE G.Year = 5;

--11. Виведіть повні імена викладачів і лекції, які вони читають (назви предметів та груп). Зробіть відбір по тим лекціям,
--які проходять в аудиторії «B103».
SELECT T.Name AS TeacherName, T.Surname AS TeacherSurname, S.Name AS SubjectName, G.Name AS GroupName
FROM Teachers T
INNER JOIN Lectures L ON T.Id = L.TeacherId
INNER JOIN GroupsLectures GL ON L.Id = GL.LectureId
INNER JOIN Groups G ON GL.GroupId = G.Id
INNER JOIN Subjects S ON L.SubjectId = S.Id
WHERE L.LectureRoom = 'B103';