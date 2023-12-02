import client from "../DB/connectDB.js";
import { getStudentByID, getStudents, checkEmailExists, addStudent, updateStudent } from "../Queries/queries.js";

export const students = async (req, res) => {
    const students = await client.query(getStudents);
    res.status(200).json(students.rows);
};

export const studentById = async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const student = await client.query(getStudentByID, [id]);
        res.status(200).json(student.rows);
    } catch (error) {
        console.log(error)
    }
};

export const addStudents = async (req, res) => {
    const { name, age, dob, email_id } = req.body;

    const checkEmail = await client.query(checkEmailExists, [email_id]);
    console.log(checkEmail.rowCount);
    
    await client.query(addStudent, [name, age, dob, email_id]); //* Updated
    const addedStudent = client.query(getStudentByID, [age, email_id]);
    res.status(202).json({ message: "Added Successfully", addedStudent: addedStudent });
    console.log(addedStudent);
};

export const updateStudentById = async (req, res) => {
    const id = parseInt(req.params.id);
    const { name } = req.body;

    await client.query(updateStudent, [name, id]);
    const updated = await client.query(getStudentByID, [id]);
    res.status(200).json({
        message: "Your data is updated",
        data: updated.rows
    });
}