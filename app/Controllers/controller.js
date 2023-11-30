import client from "../DB/connectDB.js";
import { getStudentByID, getStudents, checkEmailExists, addStudent } from "../Queries/queries.js";

export const students = async (req, res) => {
    const students = await client.query(getStudents);
    res.status(200).json(students.rows);
};

export const studentById = async (req, res) => {
    const id = parseInt(req.params.id);
    await client.query(getStudentByID, [id], (err, results) => {
        if (err) throw err;
        res.status(200).json(results.rows);
    });
};

export const addStudents = async (req, res) => {
    const { name, age, dob, email_id } = req.body;

    await client.query(checkEmailExists, [email_id], async (error, result) => {
        if (error) throw error;

        //! Here LENGTH is an array type and if there is any value inside it will indicate length of an array 1 or more than 1 means not empty vice versa with 0.
        if (result.rows.length) {
            res.send("EMAIL IS ALREADY EXISTS");
        }
        await client.query(addStudent, [name, age, dob, email_id], (err, data) => {
            if (err) throw err;

            res.status(202).send("Data Successfully added");
        });
    });
};