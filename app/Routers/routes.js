import express, { Router } from "express";
import { studentById, students, addStudents, updateStudentById, deleteStudentsByID } from "../Controllers/controller.js";

const router = Router();

router.use(express.json());

router.get("/", students);
router.post("/", addStudents);
router.get("/:id", studentById);
router.put("/:id", updateStudentById);
router.delete("/:id", deleteStudentsByID);

export default router;