import client from "../DB/connectDB.js";

export const students = async (req, res) => {

    const students = await client.query('SELECT * FROM STUDENTS');

    res.status(200).json(students.rows);
};