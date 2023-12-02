import client from "../DB/connectDB.js";
import { getStudentByID, getStudents, checkEmailExists, addStudent, updateStudent, deleteStudentByID } from "../Queries/queries.js";

export const students = async (req, res) => {
    const students = await client.query(getStudents);
    res.status(200).json(students.rows);
};

export const studentById = async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const student = await client.query(getStudentByID, [id, ""]);
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
    res.status(202).json({ message: "Added Successfully" });
};

export const updateStudentById = async (req, res) => {
    const id = parseInt(req.params.id);
    const { name } = req.body;

    await client.query(updateStudent, [name, id]);
    res.status(200).json({ message: "Your data is updated" });
}

export const deleteStudentsByID = async (req, res) => {

    const id = parseInt(req.params.id);

    try {
        const checkStudent = await client.query(getStudentByID, [id, ""]);

        if (checkStudent.rows.length) {
            await client.query(deleteStudentByID, [id]);
            res.status(200).send("Student deleted successfully");
        } else {
            res.status(404).send("Check you student detail, No student exists by this ID");
        }

    } catch (error) {
        console.log(error);
    }
}