import { Router } from "express";
import { students } from "../Controllers/controller.js";

const router = Router();


router.get("/", students);

export default router;