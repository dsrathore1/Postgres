export const getStudents = 'SELECT * FROM STUDENTS';
export const getStudentByID = 'SELECT * FROM STUDENTS WHERE ID=$1 OR EMAIL_ID=$2';
export const checkEmailExists = 'SELECT NAME FROM STUDENTS WHERE NAME=$1';
export const addStudent = 'INSERT INTO STUDENTS (NAME, AGE, DOB, EMAIL_ID) VALUES ($1,$2,$3,$4)';
export const updateStudent = 'UPDATE STUDENTS SET NAME=$1 WHERE ID=$2';
export const deleteStudentByID = 'DELETE FROM STUDENTS WHERE ID=$1';